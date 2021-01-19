<?php
require_once DIR_SYSTEM . 'journal2/classes/journal2_utils.php';
require_once DIR_SYSTEM . 'journal2/classes/journal2_cache.php';
require_once DIR_SYSTEM . 'journal2/lib/Browser.php';
require_once(DIR_SYSTEM . 'journal2/classes/journal2_db_upgrade.php');

class ControllerModuleJournal2 extends Controller {

    protected $data = array();

    protected function render() {
        if (version_compare(VERSION, '3', '>=')) {
			$class = new ReflectionClass('Template');

			if (count($constructor = $class->getConstructor()->getParameters()) > 1) {
				// d_twig_manager fix
				$template = new Template('template', $this->registry);
			} else {
				$template = new Template('template');
			}

            foreach ($this->data as $key => $value) {
                $template->set($key, $value);
            }

            return $template->render($this->registry->get('config')->get('template_directory') . str_replace('.tpl', '', $this->template));
        }

        if (version_compare(VERSION, '2.2', '>=')) {
            return $this->load->view(str_replace('.tpl', '', $this->template), $this->data);
        }

        return version_compare(VERSION, '2', '>=') ? $this->load->view($this->template, $this->data) : parent::render();
    }

    public function  __construct($registry) {
        parent::__construct($registry);

        Journal2DBUpgrade::check();

        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $this->data['base'] = HTTPS_CATALOG;
        } else {
            $this->data['base'] = HTTP_CATALOG;
        }

        $this->data['base_href'] = Journal2Utils::link('module/journal2', version_compare(VERSION, '3', '>=') ? ('user_token=' . $this->session->data['user_token']) : ('token=' . $this->session->data['token']), 'SSL');
        $this->data['export_href'] = Journal2Utils::link('module/journal2/rest/data/export', version_compare(VERSION, '3', '>=') ? ('user_token=' . $this->session->data['user_token']) : ('token=' . $this->session->data['token']), 'SSL');
        $this->data['import_href'] = Journal2Utils::link('tool/backup', version_compare(VERSION, '3', '>=') ? ('user_token=' . $this->session->data['user_token']) : ('token=' . $this->session->data['token']), 'SSL');
        $this->data['export_csv'] = Journal2Utils::link('module/journal2/rest/newsletter/export_csv', version_compare(VERSION, '3', '>=') ? ('user_token=' . $this->session->data['user_token']) : ('token=' . $this->session->data['token']), 'SSL');
        $this->data['transition_gallery_href'] = Journal2Utils::link('module/journal2/transition_gallery', version_compare(VERSION, '3', '>=') ? ('user_token=' . $this->session->data['user_token']) : ('token=' . $this->session->data['token']), 'SSL');

        $this->data['journal2_config'] = array();
        $this->data['journal2_config']['token'] = $this->session->data[version_compare(VERSION, '3', '>=') ? 'user_token' : 'token'];
        $this->data['journal2_config']['version'] = defined('JOURNAL_VERSION') ? JOURNAL_VERSION : null;
        $this->data['journal2_config']['user_id'] = $this->user->getId();

        $this->data['journal2_config']['items_per_page'] = 20;

        if (!property_exists('Front', 'IS_OC2') && !property_exists('Router', 'IS_OC2')) {
            echo '
                <h3>Journal Installation Error</h3>
                <p>Make sure you have uploaded all Journal files to your server and successfully replaced <b>system/engine/front.php</b> file.</p>
                <p>You can find more information <a href="http://docs.digital-atelier.com/opencart/journal/#/settings/install" target="_blank">here</a>.</p>
            ';
            exit();
        }

        if (version_compare(VERSION, '3', '>=')) {
            $this->data['journal2_config']['oc3'] = true;
        } else if (version_compare(VERSION, '2', '>=')) {
            $this->data['journal2_config']['oc2'] = true;
        }
    }

    public function index() {
        $this->document->setTitle('Journal Control Panel');

        $this->document->addStyle('//fonts.googleapis.com/css?family=Oswald');

        if (!version_compare(VERSION, '2', '>=')) {
            $this->document->addStyle('view/journal2/lib/bootstrap/css/bootstrap.css');
            $this->document->addScript('view/journal2/lib/bootstrap/js/bootstrap.min.js');
        }
        $this->document->addScript('view/journal2/lib/css_browser_selector.js');

        $this->document->addScript('//ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js');

        $this->document->addScript('view/journal2/lib/ckeditor/ckeditor.js');

        $this->document->addStyle('view/journal2/lib/css-toggle-switch/toggle-switch.css');

        $this->document->addStyle('view/journal2/lib/select2/select2.css');

        $this->document->addStyle('view/journal2/lib/angular-table/ng-table.min.css');

        $this->document->addStyle('view/journal2/lib/simple-slider/css/simple-slider.css');
        $this->document->addStyle('view/journal2/css/hint.min.css');
        $this->document->addStyle('view/journal2/css/main.css');

        $this->document->addScript('view/journal2/lib/spectrum/spectrum.js');
        $this->document->addStyle('view/journal2/lib/spectrum/spectrum.css');

        $this->document->addScript('view/journal2/js/colors.js');

        $this->document->addStyle('../catalog/view/theme/journal2/css/icons/style.css');

        if (version_compare(VERSION, '2', '>=')) {
            $this->data['header'] = $this->load->controller('common/header');
            $this->data['column_left'] = $this->load->controller('common/column_left');
            $this->data['footer'] = $this->load->controller('common/footer');
        } else {
            $this->children = array(
                'common/header',
                'common/footer'
            );
        }

        /* check browser */
        $browser = new Browser();
        if ($browser->isBrowser('Internet Explorer') && version_compare($browser->getVersion(), '8.0', '<=')) {
            $this->template = 'journal2/error' . (version_compare(VERSION, '2', '>=') ? '_oc2' : '') . '.tpl';
            $this->data['journal_error_title']      = 'Browser Error';
            $this->data['journal_error_message']    = 'It seems you are using an outdated browser. <br />We recommend you update your browser to the latest version.';
            $this->response->setOutput($this->render());
            return;
        }

        /* tables does not exist*/
        if (!$this->db->query(str_replace('_', '\_', 'show tables like "' . DB_PREFIX . 'journal2_config"'))->num_rows) {
            $this->template = 'journal2/error' . (version_compare(VERSION, '2', '>=') ? '_oc2' : '') . '.tpl';
            $this->data['journal_error_title']      = 'Database Error';
            $this->data['journal_error_message']    = 'Uninstalling and reinstalling this module may solve this issue.';
            $this->response->setOutput($this->render());
            return;
        }

        /* check if files are replaced correctly */
        if (!defined('JOURNAL_VERSION')) {
            $this->template = 'journal2/error' . (version_compare(VERSION, '2', '>=') ? '_oc2' : '') . '.tpl';
            $this->data['journal_error_title']      = 'Journal Installation Error';
            $this->data['journal_error_message']    = 'Make sure you have uploaded all Journal files to your server and successfully replaced <b>system/engine/front.php</b> file.<br /> You can find more information <a href="http://docs.digital-atelier.com/opencart/journal/#/settings/install" target="_blank">here</a>.';
            $this->response->setOutput($this->render());
            return;
        }

        if (!version_compare(VERSION, '2', '>=')) {
            $this->load->model('setting/extension');
            if (!method_exists($this->model_setting_extension, 'uninstallJ2Extension')) {
                $this->template = 'journal2/error' . (version_compare(VERSION, '2', '>=') ? '_oc2' : '') . '.tpl';
                $this->data['journal_error_title']      = 'Journal Installation Error';
                $this->data['journal_error_message']    = 'Make sure you have uploaded all Journal files to your server and successfully replaced <b>admin/model/setting/extension.php</b> file.<br /> You can find more information <a href="http://docs.digital-atelier.com/opencart/journal/#/settings/install" target="_blank">here</a>.';
                $this->response->setOutput($this->render());
                return;
            }
        }

        /* check if vqmod is installed */
        if (!version_compare(VERSION, '2', '>=') && !class_exists('VQMod')) {
            $this->template = 'journal2/error' . (version_compare(VERSION, '2', '>=') ? '_oc2' : '') . '.tpl';
            $this->data['journal_error_title']      = 'VQMod Error';
            $this->data['journal_error_message']    = 'It seems you do not have the latest VQMod version installed. Click <a href="https://github.com/vqmod/vqmod/releases" target="_blank">here</a> to download it.';
            $this->response->setOutput($this->render());
            return;
        }

        /* check if blog is installed */
        $this->load->model('journal2/blog');
        if (!$this->model_journal2_blog->isInstalled()) {
            $this->model_journal2_blog->install();
        }

        /* get success message */
        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }

        /* get warning message */
        if (isset($this->session->data['warning'])) {
            $this->data['warning'] = $this->session->data['warning'];
            unset($this->session->data['warning']);
        } else {
            $this->data['warning'] = '';
        }

        /* get stores */
        $this->load->model('setting/store');
        $stores = $this->model_setting_store->getStores();
        array_unshift($stores, array(
            'store_id' => "0",
            'name'     => $this->config->get('config_name'),
        ));
        $this->data['journal2_config']['stores'] = $stores;

        /* get active skin */
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "journal2_config WHERE store_id = '0' AND `key` = 'active_skin'");
        $this->data['journal2_config']['active_skin'] = $query->num_rows ? $query->row['value'] : 1;

        /* get languages */
        $this->load->model('localisation/language');
        $languages = $this->model_localisation_language->getLanguages();
        $default_language = null;
        foreach ($languages as &$language) {
            if ($language['language_id'] == $this->config->get('config_language_id')) {
                $default_language = $language['language_id'];
            }
            if (version_compare(VERSION, '2.2', '>=')) {
                $language['image'] = 'language/' . $language['code'] . '/' . $language['code'] . '.png';
            } else {
                $language['image'] = 'view/image/flags/' . $language['image'];
            }
        }
        $this->data['journal2_config']['languages'] = array(
            'languages' => $languages,
            'default'   => $default_language
        );

        /* get layouts */
        $this->load->model('design/layout');
        $this->data['journal2_config']['layouts'] = $this->model_design_layout->getLayouts();

        /* img folder */
        $this->data['journal2_config']['img_folder'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) ? HTTPS_CATALOG . 'image/' : HTTP_CATALOG . 'image/';

        /* render template */
        $this->template = 'journal2/cp_index.tpl';

        $this->response->setOutput($this->render());
    }

    public function transition_gallery() {
        $this->template = 'journal2/layer_slider/transition_gallery.tpl';
        $this->response->setOutput($this->render());
    }

    public function tpl() {
        $tpl = isset($this->request->get['tpl']) ? $this->request->get['tpl'] : 'not_found.tpl';

        $this->data['tpl'] = $tpl;

        if (file_exists(DIR_TEMPLATE . 'journal2/' . $tpl . '.tpl')) {
            $this->template = 'journal2/' . $tpl . '.tpl';
        } else {
            $this->template = 'journal2/not_found.tpl';
        }

        $this->response->setOutput($this->render());
    }

    /*
     * handles ajax http requests as:
     * ----------------------------------------------------------------------------------
     * module/journal2/rest/modules/all                 GET module_type
     * module/journal2/rest/modules/get                 GET module_id
     * module/journal2/rest/modules/add                 POST module_data
     * module/journal2/rest/modules/edit                GET module_id, POST module_data
     * module/journal2/rest/modules/remove              GET module_id
     * module/journal2/rest/modules/load                GET module_type
     * module/journal2/rest/modules/save                GET module_type, POST module_data
     * ----------------------------------------------------------------------------------
     * module/journal2/rest/catalog/find_products       GET filter
     * module/journal2/rest/catalog/find_categories     GET filter
     * module/journal2/rest/catalog/find_manufacturers  GET filter
     * module/journal2/rest/catalog/find_information    GET filter
     * ----------------------------------------------------------------------------------
     * module/journal2/rest/misc/fonts
     * module/journal2/rest/misc/layouts
     * module/journal2/rest/misc/languages
     * ----------------------------------------------------------------------------------
     * module/journal2/rest/settings/get                GET category, subcategory
     * module/journal2/rest/settings/set                POST module_data
     */
    public function rest() {
        $response = array();

        $route = $this->request->get['route'];
        $parts = explode('/', $route);

        try {
            if (count($parts) < 5) {
                throw new Exception('Invalid REST route');
            }

            $model_file = 'journal2/' . $parts[3];
            $model_obj = 'model_' . str_replace('/', '_', $model_file);
            $model_method = $parts[4];

            if (!file_exists(DIR_APPLICATION . 'model/' . $model_file . '.php')) {
                throw new Exception('Invalid REST endpoint');
            }

            $this->load->model($model_file);

            if (!method_exists($this->$model_obj, $model_method)) {
//                throw new Exception('Invalid REST action');
            }

            $response['status'] = 'success';
            $response['response'] = $this->$model_obj->$model_method();
        } catch (Exception $e) {
            $response['status'] = 'error';
            $response['error'] = $e->getMessage();
        }

        $response['route'] = str_replace('module/journal2/rest/', '', $route);

        header('Content-Type: application/json');
        echo json_encode($response);
        exit();
    }

    public function clear_cache() {
        if ($this->user->hasPermission('modify', 'module/journal2')) {
            Journal2Cache::deleteCache();
//            $this->session->data['success'] = 'Journal Cache has been successfully cleared.';
        } else {
//            $this->session->data['warning'] = 'You do not have permissions to modify Journal2 module.';
        }
        if (isset($this->session->data['j2_redirect'])) {
            $redirect = Journal2Utils::link($this->session->data['j2_redirect'], version_compare(VERSION, '3', '>=') ? ('user_token=' . $this->session->data['user_token']) : ('token=' . $this->session->data['token']), 'SSL');
            unset($this->session->data['j2_redirect']);
        } else {
            $redirect = Journal2Utils::link('common/home', version_compare(VERSION, '3', '>=') ? ('user_token=' . $this->session->data['user_token']) : ('token=' . $this->session->data['token']), 'SSL');
        }
        if (version_compare(VERSION, '2', '>=')) {
            $this->response->redirect($redirect);
        } else {
            $this->redirect($redirect);
        }
    }

    public function check_version() {
        if (!isset($this->session->data['journal_version'])) {
            $defaults = array(
                CURLOPT_HEADER => 0,
                CURLOPT_URL => 'http://journal.digital-atelier.com/version.php?v=' . JOURNAL_VERSION,
                CURLOPT_FRESH_CONNECT => 1,
                CURLOPT_RETURNTRANSFER => 1,
                CURLOPT_FORBID_REUSE => 1,
                CURLOPT_TIMEOUT => 5,
                CURLOPT_SSL_VERIFYPEER => 0,
                CURLOPT_SSL_VERIFYHOST => 0
            );

            $ch = curl_init();
            curl_setopt_array($ch, $defaults);
            $result = json_decode(curl_exec($ch), true);
            curl_close($ch);
            $version = is_array($result) && isset($result['version']) ? $result['version'] : null;
            $this->session->data['journal_version'] = $version;
        }

        $version = $this->session->data['journal_version'];

        if ($version !== null && version_compare(JOURNAL_VERSION, $version) === -1) {
            $response = array(
                'status'    => 'success',
                'response'  => array(
                    'current'   => JOURNAL_VERSION,
                    'latest'    => $version,
                    'upgrade'   => true
                )
            );
        } else {
            $response = array(
                'status'    => 'success',
                'response'  => array(
                    'upgrade'   => false
                )
            );
        }
        $this->response->setOutput(json_encode($response));
    }

    public function install() {
        $this->uninstall();

        /* create tables */
        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_modules` (
          `module_id` int(11) NOT NULL AUTO_INCREMENT,
          `module_type` varchar(64) NOT NULL,
          `module_data` mediumtext NOT NULL,
          PRIMARY KEY (`module_id`)
        ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_config` (
          `key` varchar(64) NOT NULL,
          `store_id` int(11) NOT NULL DEFAULT 0,
          `value` mediumtext NOT NULL,
          `serialized` tinyint(1) NOT NULL,
          PRIMARY KEY `pk` (`key`,`store_id`)
        ) ENGINE=MyISAM DEFAULT CHARSET=utf8;');

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_settings` (
          `theme_id` int(11) NOT NULL DEFAULT 0,
          `key` varchar(64) NOT NULL,
          `category` varchar(64) NOT NULL,
          `value` mediumtext NOT NULL,
          `serialized` tinyint(1) NOT NULL,
          PRIMARY KEY `pk` (`key`,`theme_id`)
        ) ENGINE=MyISAM DEFAULT CHARSET=utf8;');

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_skins` (
          `skin_id` int(11) NOT NULL AUTO_INCREMENT,
          `skin_name` varchar(64) NOT NULL,
          `parent_id` int(11) NOT NULL,
          PRIMARY KEY (`skin_id`)
        ) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=100;');

        $this->load->model('journal2/blog');
        $this->model_journal2_blog->install(true);
        
        /* oc23 permissions */
        if (version_compare(VERSION, '2.3', '>=')) {
            $this->load->model('user/user_group');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'module/journal2');
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'module/journal2');
        }
    }

    public function uninstall() {
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_skins`');
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_settings`');
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_config`');
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_modules`');
        $this->db->query('DELETE FROM `' . DB_PREFIX . 'setting` WHERE `key` LIKE "journal2_%"');

        $this->load->model('journal2/blog');
        $this->model_journal2_blog->uninstall(true);

        /* oc23 permissions */
        if (version_compare(VERSION, '2.3', '>=')) {
            $this->load->model('user/user_group');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'module/journal2');
            $this->model_user_user_group->removePermission($this->user->getGroupId(), 'modify', 'module/journal2');
        }
    }
}
?>
