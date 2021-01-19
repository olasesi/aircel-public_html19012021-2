<?php
class ControllerExtensionModuleTimezone extends Controller {
	private $error = array();
	private $version = '5.1.0';

	public function index() {
		if (version_compare($this->version, $this->config->get('module_timezone_version'), 'gt')) $this->install();
		
		$this->load->language('extension/module/timezone');
		
		$data['user_token'] = $this->session->data['user_token'];

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('module_timezone', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->db->query("UPDATE " . DB_PREFIX . "modification SET status = '" . (int)$this->request->post['module_timezone_status'] . "' WHERE code = 'timezone'");
			
		  $this->response->redirect($this->url->link('extension/module/timezone', 'user_token=' . $this->session->data['user_token'] . '&refreshModCache=1', true));
		}
		
		$data['success'] = isset($this->session->data['success']) ? $this->session->data['success'] : '';
		unset($this->session->data['success']);

		$data['heading_title'] = $this->language->get('heading_title') . ' - ' . $this->version;

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/timezone', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/module/timezone', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&tab=module', true);
		
		$data['timezones'] = DateTimeZone::listIdentifiers(DateTimeZone::ALL);
    $data['db_time'] = $this->db->query("SELECT NOW() AS now")->row['now'];
    $data['php_time'] = date('Y-m-d H:i:s');
		
		$data['status'] = $this->config->get('module_timezone_status');
		$data['timezone'] = $this->config->get('module_timezone_timezone');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/timezone', $data));
	} //index end

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/timezone')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	} //validate end
	
	public function install() {
	  $this->db->query("DELETE FROM " . DB_PREFIX . "modification WHERE code = 'default_timezone'");
	  $this->db->query("UPDATE " . DB_PREFIX . "modification SET version = '" . $this->db->escape($this->version) . "' WHERE code = 'timezone'");
    $this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `key` = 'module_timezone_version'");
    $this->db->query("INSERT INTO " . DB_PREFIX . "setting SET `code` = 'module_timezone', `key` = 'module_timezone_version', `value` = '" . $this->db->escape($this->version) .  "'");
    
    $this->load->language('extension/module/timezone');
    
    $this->session->data['success'] = $this->language->get('text_success');
    
    if (isset($this->request->get['redirect'])) $this->response->redirect($this->url->link('extension/module/timezone', 'user_token=' . $this->session->data['user_token'], true));
	} //install end
	
	public function uninstall() {
    $this->db->query("UPDATE " . DB_PREFIX . "modification SET status = '0' WHERE code = 'timezone'");
		$this->load->controller('marketplace/modification/refresh');
  } //uninstall end
} //class end