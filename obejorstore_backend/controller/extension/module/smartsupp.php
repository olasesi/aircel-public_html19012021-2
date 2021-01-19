<?php

use Smartsupp\Auth\Api;


require __DIR__ . '/../../../../system/library/smartsupp/vendor/autoload.php';

class ControllerExtensionModuleSmartsupp extends Controller
{
    /**
     * Smartsupp partner key for Magento platform
     */
    const PARNER_KEY = 'j29hnc919y';

	const SETTING_NAME = 'smartsupp';

	public function index()
	{
		$this->load->language('extension/module/smartsupp');
		$this->load->model('setting/setting');

		$settings = $this->model_setting_setting->getSetting(self::SETTING_NAME);

		$message = NULL;
		$formAction = NULL;

		if (isset($_GET['action'])) {
			switch ($_GET['action']) {
				case 'disable':
					$this->model_setting_setting->deleteSetting(self::SETTING_NAME);
					break;
				case 'login':
				case 'register':
					$api = new Api;
					$data = array(
						'email' => $_POST['email'],
						'password' => $_POST['password'],
						'consentTerms' => 1,
                        'platform' => 'Opencart ' . $this->getOpenCartVersion(),
                        'partnerKey' => self::PARNER_KEY,
					);
					$result = $_GET['action'] === 'register' ? $api->create($data) : $api->login($data);
					if (isset($result['error'])) {
						$message = $result['message'];
						$formAction = $_GET['action'];
						$data['email'] = $_POST['email'];
					} else {
						$this->model_setting_setting->editSetting(self::SETTING_NAME, array(
							self::SETTING_NAME . 'firstRun' => TRUE,
							self::SETTING_NAME . 'email' => $_POST['email'],
							self::SETTING_NAME . 'chatId' => $result['account']['key'],
							self::SETTING_NAME . 'customCode' => ''
						));
					}
					break;
				case 'update':
					$smartsupp = $this->model_setting_setting->getSetting(self::SETTING_NAME);
					$smartsupp[self::SETTING_NAME . 'customCode'] = $_POST['code'];
					$this->model_setting_setting->editSetting(self::SETTING_NAME, $smartsupp);
					$message = 'Custom code was updated.';
					break;
			}
		}

		$that = $this;
		$data['translator'] = new SmartsuppModuleExtensionTranslator($_ = function ($text) use ($that) {
			return $that->language->get($text);
		});

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$base = HTTPS_SERVER;
		} else {
			$base = HTTP_SERVER;
		}

		$base = rtrim($base, '/\\');

		$this->document->addScript($base . '/view/javascript/smartsupp.js');
		$this->document->addStyle($base . '/view/stylesheet/bootstrap-smartsupp.css');
		$this->document->addStyle($base . '/view/stylesheet/smartsupp.css');
		$this->document->setTitle($title = $_('headingTitle'));

		$settings = $this->model_setting_setting->getSetting(self::SETTING_NAME);
		if (isset($settings[self::SETTING_NAME . 'email'])) {
			$data['email'] = $settings[self::SETTING_NAME . 'email'];
			$data['enabled'] = TRUE;
		} else {
			$data['enabled'] = FALSE;
		}
		if (isset($settings[self::SETTING_NAME . 'customCode'])) {
			$data['customCode'] = $settings[self::SETTING_NAME . 'customCode'];
		}
		$data['base'] = $base;
		$data['headingTitle'] = $title;

		if (isset($_GET['action'])) {
			$data['header'] = '';
			$data['leftMenu'] = '';
			$data['footer'] = '';
		} else {
			$data['header'] = $this->load->controller('common/header');
			$data['leftMenu'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
		}

		$data['message'] = $message;
		$data['formAction'] = $formAction;

		$this->response->setOutput($this->load->view('extension/module/smartsupp', $data));
	}

    private function getOpenCartVersion()
    {
        return defined('VERSION') ? VERSION : '???';
    }

    public function install() {
        $this->load->model('setting/setting');
        $this->model_setting_setting->editSetting('module_smartsupp', ['module_smartsupp_status'=>1]);
    }

    public function uninstall() {
        $this->load->model('setting/setting');
        $this->model_setting_setting->deleteSetting('module_smartsupp_status');
    }
}

class SmartsuppModuleExtensionTranslator
{
	private $translateFunc;

	public function __construct($translateFunc)
	{
		$this->translateFunc = $translateFunc;
	}

	public function translate($text)
	{
		$tr = $this->translateFunc;
		return $tr($text);

	}
}
