<?php
class ControllerExtensionModuleiSenseLabsSeo extends Controller {
    private $moduleName;
    private $modulePath;
    private $moduleModel;
	private $moduleVersion;
    private $extensionsLink;
    private $partTokenStoreId;
    private $callModel;
    private $error  = array(); 
    private $data   = array();
    private $moduleModelEditor;
    private $eventGroup = "isenselabs_seo";
    private $storeId;
 
    public function __construct($registry) {        
        parent::__construct($registry);
        
        // Config Loader
        $this->config->load('isenselabs/isenselabs_seo');
        
        // Token
        $this->data['token_string'] = $this->config->get('isenselabs_seo_token_string');
        $this->data['token']        = $this->session->data[$this->data['token_string']];
        
        /* Fill Main Variables - Begin */
        $this->moduleName           = $this->config->get('isenselabs_seo_name');
        $this->callModel            = $this->config->get('isenselabs_seo_model');
        $this->modulePath           = $this->config->get('isenselabs_seo_path');
        $this->moduleVersion        = $this->config->get('isenselabs_seo_version');        
        $this->extensionsLink       = $this->url->link($this->config->get('isenselabs_seo_link'), $this->data['token_string'] . '=' . $this->data['token'] . $this->config->get('isenselabs_seo_link_params'), 'SSL');
        
        $this->callModelEditor      = $this->config->get('isenselabs_seo_model_editor');
        $this->modulePathEditor     = $this->config->get('isenselabs_seo_path_editor');
        /* Fill Main Variables - End */
        
        // Load Model
        $this->load->model($this->modulePath);
        $this->load->model($this->modulePathEditor);
        
        // Model Instance
        $this->moduleModel          = $this->{$this->callModel};
        $this->moduleModelEditor    = $this->{$this->callModelEditor};
        
        // Multi-Store
        $this->load->model('setting/store');
        // Settings
        $this->load->model('setting/setting');
        // Multi-Lingual
        $this->load->model('localisation/language');
        
        // Languages
        $this->language->load($this->modulePath);
		$language_strings = $this->language->load($this->modulePath);
        foreach ($language_strings as $code => $languageVariable) {
			$this->data[$code] = $languageVariable;
		}
        
        // Variables
        $this->data['moduleName']   = $this->moduleName;
        $this->data['modulePath']   = $this->modulePath;
        $this->data['ocVersion']    = VERSION;
        
        // Store Data
        if (!isset($this->request->get['store_id'])) {
            $this->request->get['store_id'] = 0;
        }
        $this->storeId = (int)$this->request->get['store_id'];

        $this->partTokenStoreId = $this->data['token_string'] . '=' . $this->data['token'] . '&store_id=' . $this->storeId;
    }

	public function index() {
        /* Database Checks */
        $this->moduleModel->initDb($this->storeId);
        
        $module_status = array(
            'group' => $this->config->get('isenselabs_seo_status_group'),
            'value' => $this->config->get('isenselabs_seo_status_value')
        );
        $this->model_setting_setting->editSetting($module_status['group'], array($module_status['value'] => '1'));

        // Title
		$this->document->setTitle($this->language->get('heading_title'));
        $this->data['heading_title'] = $this->data['heading_title'] . ' ' . $this->moduleVersion;
        
        // The charts for the SEO Score and other charts
        $this->document->addScript('view/javascript/'.$this->moduleName.'/charts/d3.v3.min.js' . '?v=' . $this->moduleVersion); 
        $this->document->addScript('view/javascript/'.$this->moduleName.'/charts/c3.min.js' . '?v=' . $this->moduleVersion); 
       
        // For the bootstrap dialogs
        $this->document->addScript('view/javascript/'.$this->moduleName.'/bootbox.js' . '?v=' . $this->moduleVersion); 
        
        // For the commom functionalities of the module
        $this->document->addScript('view/javascript/'.$this->moduleName.'/'.$this->moduleName.'.js' . '?v=' . $this->moduleVersion);
        
        // For the autolinks
        $this->document->addScript('view/javascript/'.$this->moduleName.'/autolinks.js' . '?v=' . $this->moduleVersion); 

        // For the custom URLs
        $this->document->addScript('view/javascript/'.$this->moduleName.'/customurls.js' . '?v=' . $this->moduleVersion); 
        
        // For the image zoom
        $this->document->addScript('view/javascript/'.$this->moduleName.'/ekko_lightbox.js' . '?v=' . $this->moduleVersion); 
        
        // For the advanced editor
        $this->document->addScript('view/javascript/'.$this->moduleName.'/advanced_editor.js' . '?v=' . $this->moduleVersion); 

        // Styles		
		$this->document->addStyle('view/stylesheet/'.$this->moduleName.'/'.$this->moduleName.'.css' . '?v=' . $this->moduleVersion);	
        $this->document->addStyle('view/javascript/'.$this->moduleName.'/charts/c3.min.css' . '?v=' . $this->moduleVersion); 
        $this->document->addStyle('view/stylesheet/'.$this->moduleName.'/ekko_lightbox.css' . '?v=' . $this->moduleVersion); 

        $this->load->model('localisation/language');
        $this->data['languages'] = $this->model_localisation_language->getLanguages();

		$this->data['store'] = $this->getCurrentStore($this->storeId);
        $this->data['storeId'] = $this->storeId;
        
        $this->load->model('setting/store');
        $this->data['stores'] = array_merge(array(0 => $this->getCurrentStore(0)), $this->model_setting_store->getStores());
        
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->setupEvent();

            if (!empty($this->request->post['OaXRyb1BhY2sgLSBDb21'])) {
				$this->request->post[$this->moduleName]['LicensedOn'] = $this->request->post['OaXRyb1BhY2sgLSBDb21'];
			}
			if (!empty($this->request->post['cHRpbWl6YXRpb24ef4fe'])) {
				$this->request->post[$this->moduleName]['License'] = json_decode(base64_decode($this->request->post['cHRpbWl6YXRpb24ef4fe']),true);
			}
            
			$this->model_setting_setting->editSetting($this->moduleName, $this->request->post, $this->storeId);

			$this->session->data['success'] = $this->language->get('text_success');
			
            $this->response->redirect($this->url->link($this->modulePath, $this->partTokenStoreId, 'SSL'));
		}

        $this->data['toggle_seo_analysis'] = $this->moduleModel->getSetting('search_engine_analytics_enable');
        $this->data['toggle_seo_analysis_url'] = $this->url->link($this->modulePath . '/toggle_seo_analysis', $this->partTokenStoreId, 'SSL');

        $this->data['toggle_404_detection'] = $this->moduleModel->getSetting('404_pages_gathering');
        $this->data['toggle_404_detection_url'] = $this->url->link($this->modulePath . '/toggle_missing_pages_detection', $this->partTokenStoreId, 'SSL');

        $this->data['canonical_products']           = $this->moduleModel->getSetting('canonical_products', $this->storeId);
        $this->data['canonical_information_pages']  = $this->moduleModel->getSetting('canonical_information_pages', $this->storeId);
        $this->data['canonical_home_page']          = $this->moduleModel->getSetting('canonical_home_page', $this->storeId);
        $this->data['canonical_special_page']       = $this->moduleModel->getSetting('canonical_special_page', $this->storeId);
        $this->data['canonical_manufacturers']      = $this->moduleModel->getSetting('canonical_manufacturers', $this->storeId);
        $this->data['canonical_categories']         = $this->moduleModel->getSetting('canonical_categories', $this->storeId);
		
		$this->data['unify_urls']                   = $this->moduleModel->getSetting('unify_urls', $this->storeId);
		$this->data['breadcrumb_products']          = $this->moduleModel->getSetting('breadcrumb_products', $this->storeId);
        $this->data['breadcrumb_categories']        = $this->moduleModel->getSetting('breadcrumb_categories', $this->storeId);
         
        $this->data['url_product_autogenerate']     = $this->moduleModel->getSetting('url_product_autogenerate', $this->storeId);
		$this->data['url_category_autogenerate']    = $this->moduleModel->getSetting('url_category_autogenerate', $this->storeId);
        $this->data['url_manufacturer_autogenerate']= $this->moduleModel->getSetting('url_manufacturer_autogenerate', $this->storeId);
        $this->data['url_information_autogenerate'] = $this->moduleModel->getSetting('url_information_autogenerate', $this->storeId);
	          
		$this->data['subfolder_prefixes']           = $this->moduleModel->getSetting('subfolder_prefixes', $this->storeId);
        $this->data['subfolder_prefixes_alias']     = json_decode($this->moduleModel->getSetting('subfolder_prefixes_alias'), true);
        $this->data['default_lang_prefix']          = $this->moduleModel->getSetting('default_lang_prefix', $this->storeId);
        $this->data['redirect_active_lang_prefix']  = $this->moduleModel->getSetting('redirect_active_lang_prefix');
        $this->data['cyrillic_urls']                = $this->moduleModel->getSetting('cyrillic_urls', $this->storeId);
        $this->data['redirect_to_seo_links']        = $this->moduleModel->getSetting('redirect_to_seo_links', $this->storeId);

        $this->data['feed_product_limit']           = $this->moduleModel->getSetting('feed_product_limit', $this->storeId);
        $this->data['feed_category_product']        = $this->moduleModel->getSetting('feed_category_product', $this->storeId);
        $this->data['feed_manufacturer_product']    = $this->moduleModel->getSetting('feed_manufacturer_product', $this->storeId);

        if (empty($this->data['subfolder_prefixes_alias'])) {
            $this->data['subfolder_prefixes_alias'] = array();
            foreach ($this->data['languages'] as $lang) {
                $this->data['subfolder_prefixes_alias'][$lang['code']] = $lang['code'];
            }
        }

        // Sucess & Error messages
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
        
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		// Breadcrumbs
  		$this->data['breadcrumbs'] = array();
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', $this->data['token_string'] . '=' . $this->data['token'], 'SSL'),
      		'separator' => false
   		);
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->extensionsLink,
      		'separator' => ' :: '
   		);
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link($this->modulePath, $this->partTokenStoreId, 'SSL'),
      		'separator' => ' :: '
   		);

        // Crawler example URLs 
        $product_data = $this->db->query("SELECT `product_id` FROM `" . DB_PREFIX . "product` WHERE `status` = 1 ORDER BY `product_id` DESC LIMIT 1");
        $category_data = $this->db->query("SELECT `category_id` FROM `" . DB_PREFIX . "category` WHERE `status` = 1 ORDER BY `category_id` DESC LIMIT 1");
        $information_data = $this->db->query("SELECT `information_id` FROM `" . DB_PREFIX . "information` WHERE `status` = 1 ORDER BY `information_id` DESC LIMIT 1");
        
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTP_SERVER;
        } else {
            $storeURL = HTTPS_SERVER;
        }

        if ($product_data->num_rows) {
            $urls['product'] = str_replace($storeURL, '', $this->url->link('product/product', 'product_id='.$product_data->row['product_id'], 'SSL'));
        } 
        
        if ($category_data->num_rows) {
            $urls['category'] = str_replace($storeURL, '', $this->url->link('product/category', 'path='.$category_data->row['category_id'], 'SSL'));
        } 
        
        if ($information_data->num_rows) {
            $urls['information'] = str_replace($storeURL, '', $this->url->link('information/information', 'information_id='.$information_data->row['information_id'], 'SSL'));
        } 

        $this->data['urls_array']               = array(
            'home'      => '',
            'product'   => isset($urls['product']) ? $urls['product'] : '',
            'category'  => isset($urls['category']) ? $urls['category'] : '',
            'information' => isset($urls['information']) ? $urls['information'] : ''
        );

        // Variables for the view
		$this->data['action']					= $this->url->link($this->modulePath, $this->partTokenStoreId, 'SSL');
		$this->data['cancel']					= $this->extensionsLink;
        $this->data['config_language_id']       = $this->config->get('config_language_id');
        $this->data['moduleSettings']			= $this->model_setting_setting->getSetting($this->moduleName, $this->storeId);
        $this->data['moduleData']				= (isset($this->data['moduleSettings'][$this->moduleName])) ? $this->data['moduleSettings'][$this->moduleName] : array();
        $this->data['header']                   = $this->load->controller('common/header');
		$this->data['column_left']              = $this->load->controller('common/column_left');
		$this->data['footer']                   = $this->load->controller('common/footer');
        
        // License Data
        $hostname = (!empty($_SERVER['HTTP_HOST'])) ? $_SERVER['HTTP_HOST'] : '' ;
        $this->data['hostname'] = (strstr($hostname,'http://') === false) ? 'http://'.$hostname : $hostname;
        $this->data['hostname_base64'] = base64_encode($this->data['hostname']);
        $this->data['time_now'] = time();
        
        $this->data['unlicensedHtml'] = (empty($this->data['moduleData']['LicensedOn'])) ? base64_decode('ICAgIDxkaXYgY2xhc3M9ImFsZXJ0IGFsZXJ0LWRhbmdlciBmYWRlIGluIj4NCiAgICAgICAgPGJ1dHRvbiB0eXBlPSJidXR0b24iIGNsYXNzPSJjbG9zZSIgZGF0YS1kaXNtaXNzPSJhbGVydCIgYXJpYS1oaWRkZW49InRydWUiPsOXPC9idXR0b24+DQogICAgICAgIDxoND5XYXJuaW5nISBZb3UgYXJlIHJ1bm5pbmcgdW5saWNlbnNlZCB2ZXJzaW9uIG9mIHRoZSBtb2R1bGUhPC9oND4NCiAgICAgICAgPHA+WW91IGFyZSBydW5uaW5nIGFuIHVubGljZW5zZWQgdmVyc2lvbiBvZiB0aGlzIG1vZHVsZSEgWW91IG5lZWQgdG8gZW50ZXIgeW91ciBsaWNlbnNlIGNvZGUgdG8gZW5zdXJlIHByb3BlciBmdW5jdGlvbmluZywgYWNjZXNzIHRvIHN1cHBvcnQgYW5kIHVwZGF0ZXMuPC9wPjxkaXYgc3R5bGU9ImhlaWdodDo1cHg7Ij48L2Rpdj4NCiAgICAgICAgPGEgY2xhc3M9ImJ0biBidG4tZGFuZ2VyIiBocmVmPSJqYXZhc2NyaXB0OnZvaWQoMCkiIG9uY2xpY2s9IiQoJ2FbaHJlZj0jaXNlbnNlLXN1cHBvcnRdJykudHJpZ2dlcignY2xpY2snKSI+RW50ZXIgeW91ciBsaWNlbnNlIGNvZGU8L2E+DQogICAgPC9kaXY+') : '';
        $this->data['licenseDataBase64'] = !empty($this->data['moduleData']['License']) ? base64_encode(json_encode($this->data['moduleData']['License'])) : '';
        $this->data['supportTicketLink'] = 'http://isenselabs.com/tickets/open/' . base64_encode('Support Request') . '/' . base64_encode('429') . '/' . base64_encode($_SERVER['SERVER_NAME']);
        $this->data['LicenseExpireDate'] = !empty($this->data['moduleData']['License']) ? date("F j, Y", strtotime($this->data['moduleData']['License']['licenseExpireDate'])) : "";

        $this->data['moduleTabs'] = $this->getTabs('main');
        $this->data['missingPagesTabs'] = $this->getTabs('missing_pages');
        $this->data['urlLinkingTabs'] = $this->getTabs('urls_linking');
        
		$this->response->setOutput($this->load->view($this->modulePath.'/'.$this->moduleName, $this->data));
	}

    private function getTabs($type = 'main') {
        $dir = 
            'extension' . DIRECTORY_SEPARATOR . 
            'module' . DIRECTORY_SEPARATOR . 
            $this->moduleName . DIRECTORY_SEPARATOR;

        $result = array();
        
        switch ($type) {
            case 'main': 
                $name_map = array(
                    'tab_urls_linking.twig' => array(
                        'name' => 'URLs & Linking',
                        'id' => 'urls-linking-tab'
                    ),
                    'tab_content.twig' => array(
                        'name' => 'Content',
                        'id' => 'content-tab'
                    ),
                    'tab_advanced_editor.twig' => array(
                        'name' => 'Advanced Editor',
                        'id' => 'advanced-editor-tab'
                    ),
                    'tab_social_seo.twig' => array(
                        'name' => 'Social SEO',
                        'id' => 'social-seo-tab'
                    ),
                    'tab_structured_data.twig' => array(
                        'name' => 'Structured Data',
                        'id' => 'structured-data-tab'
                    ),
                    'tab_image_names.twig' => array(
                        'name' => 'Page Crawler',
                        'id' => 'image-names-tab'
                    ),
                    'tab_crawler.twig' => array(
                        'name' => 'Page Crawler',
                        'id' => 'crawler-tab'
                    ),
                    'tab_seo_analysis.twig' => array(
                        'name' => 'Search Engine Analytics',
                        'id' => 'analysis-tab'
                    ),
                    'tab_missing_pages.twig' => array(
                        'name' => '404 Manager',
                        'id' => 'missing-pages-tab'
                    ),
                    'tab_file_editor.twig' => array(
                        'name' => 'File Editor',
                        'id' => 'file-editor-tab'
                    ),
                    'tab_feed.twig' => array(
                        'name' => 'Feed',
                        'id' => 'feed-tab'
                    ),
                    'tab_faq.twig' => array(
                        'name' => 'Documentation',
                        'id' => 'faq-tab'
                    ),
                    'tab_support.twig' => array(
                        'name' => 'Support',
                        'id' => 'isense-support'
                    )
                );
                break;
            case 'urls_linking':
                $name_map = array(
                    'urls_linking_tab/tab_customurls.twig' => array(
                        'name' => 'Custom Redirects',
                        'id' => 'tab-customredirections'
                    ),
                    'urls_linking_tab/tab_autolinks.twig' => array(
                        'name' => 'Auto-Links',
                        'id' => 'tab-autolinks'
                    ),
                    'urls_linking_tab/tab_canonicals.twig' => array(
                        'name' => 'Canonicals',
                        'id' => 'tab-canonicals'
                    ),
					'urls_linking_tab/tab_advanced.twig' => array(
                        'name' => 'Advanced Settings',
                        'id' => 'tab-advanced-settings'
                    )
                );
                break;
            case 'missing_pages':
                $name_map = array(
                    'missing_pages_tab/tab_detected_pages.twig' => array(
                        'name' => 'Detected Missing pages',
                        'id' => 'tab-missing-pages'
                    ),
                    'missing_pages_tab/tab_redirects.twig' => array(
                        'name' => '404 Redirects',
                        'id' => 'tab-redirects'
                    )
                );
                break;
            default:
                $name_map = array();
                break;
        }

        if (!function_exists('modification_vqmod')) {
            function modification_vqmod($file) {
                if (class_exists('VQMod')) {
                    return VQMod::modCheck(modification($file), $file);
                } else {
                    return modification($file);
                }
            }
        }

        foreach ($name_map as $file => $info) {
            $result[] = array(
                'file' => modification_vqmod($dir . $file),
                'name' => $info['name'],
                'id' => $info['id']
            );
        }

        return $result;
    }
    
    public function save_settings() {
        $settings       = $this->request->post;
        $json           = array();

        if (!empty($settings)) {
            $this->setupEvent();

            if (isset($settings['htaccess'])) {
                $settings['htaccess'] = trim(html_entity_decode($settings['htaccess'], ENT_QUOTES, 'UTF-8'));
                if (!empty($settings['htaccess'])) {
                    $file_path = dirname(DIR_SYSTEM).'/.htaccess';
                    
                    if (@file_put_contents($file_path, $settings['htaccess'])) {
                        $json['success'] = true;
                        $json['message'] = $this->data['success_saved_settings'];
                    } else {
                        $json['success'] = true;
                        $json['message'] = $this->data['error_unexpected'] . 'ERR_HTPM';
                    }
                } else {
                   $json['success'] = true;
                   $json['message'] = $this->data['text_empty_file']; 
                }
            } else if (isset($settings['robots_txt'])) {
                $settings['robots_txt'] = trim(html_entity_decode($settings['robots_txt'], ENT_QUOTES, 'UTF-8'));
                if (!empty($settings['robots_txt'])) {
                    $file_path = dirname(DIR_SYSTEM).'/robots.txt';
                    
                    if (@file_put_contents($file_path, $settings['robots_txt'])) {
                        $json['success'] = true;
                        $json['message'] = $this->data['success_saved_settings'];
                    } else {
                        $json['success'] = true;
                        $json['message'] = $this->data['error_unexpected'] . 'ERR_RBPM';
                    }
                } else {
                   $json['success'] = true;
                   $json['message'] = $this->data['text_empty_file_robots']; 
                }
            } else {
                foreach ($settings as $key => $value) {
                    if (!empty($key) && !is_null($value)) {
                        if (is_array($value)) {
                            $value = json_encode($value);
                        }

                        $this->moduleModel->saveSetting($key, $value, $this->storeId);
                    }
                }
                $json['success'] = true;
                $json['message'] = $this->data['success_saved_settings'];
            }
            
        } else {
            $json['success'] = true;
            $json['message'] = $this->data['error_unexpected'] . 'ERR_SS';
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function fix_seo_issues() {
        $event_type     = $this->request->get['event_type'];
        $language_id    = isset($this->request->get['language_id']) ? $this->request->get['language_id'] : $this->config->get('config_language_id');
        $json           = array();

        switch($event_type) {
            case "config_seo_url":
                $result = $this->moduleModel->enableSEOUrls($this->storeId);
                if ($result) {
                    $json['message'] = $this->data['success_enable_seo_urls'];
                    $json['success'] = true;
                } else {
                    $this->error['warning'] = $this->data['error_unexpected'] . 'ERR_CSU';
                } 
                echo json_encode($json); exit;
                break;
            case "category_seo_urls":
                $result = $this->moduleModel->createSEOUrls('categories', $language_id, $this->storeId);
                if ($result) {
                    $json['message']    = $result['counter'].' category links were created!';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_CTGSU';       
                }
                echo json_encode($json); exit;
                break;   
            case "category_seo_urls_all":
                $result = $this->moduleModel->createSEOUrls('categories_all', $language_id, $this->storeId);
                if ($result) {
                    $json['message']    = $result['counter'].' category links were created!';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_CTGSUA';       
                }
                echo json_encode($json); exit;
                break; 
            case "category_fix_minus_urls":
                $result = $this->moduleModel->fixMinusSEOUrls('category', $language_id);
                if ($result) {
                    $json['success']    = true;
                    $json['reload']     = true;
                } else {
                    $json['error']      = 'No minus count found! ID:' . 'ERR_CTGFMU';       
                }
                echo json_encode($json); exit;
                break;
            case "product_seo_urls":
                $result = $this->moduleModel->createSEOUrls('products', $language_id, $this->storeId);
                if ($result) {
                    $json['message']    = $result['counter'].' product links were created!';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_PSU';       
                }
                echo json_encode($json); exit;
                break; 
            case "product_seo_urls_all":
                $result = $this->moduleModel->createSEOUrls('products_all', $language_id, $this->storeId);
                if ($result) {
                    $json['message']    = $result['counter'].' product links were created!';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_PSUA';       
                }
                echo json_encode($json); exit;
                break;
            case "product_fix_minus_urls":
                $result = $this->moduleModel->fixMinusSEOUrls('product', $language_id);
                if ($result) {
                    $json['success']    = true;
                    $json['reload']     = true;
                } else {
                    $json['error']      = 'No minus count found! ID:' . 'ERR_CTGFMU';       
                }
                echo json_encode($json); exit;
                break;
            case "manufacturer_seo_urls":
                $result = $this->moduleModel->createSEOUrls('manufacturers', $language_id, $this->storeId);
                if ($result) {
                    $json['message']    = $result['counter'].' manufacturer links were created!';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_MSU';       
                }
                echo json_encode($json); exit;
                break; 
            case "manufacturer_seo_urls_all":
                $result = $this->moduleModel->createSEOUrls('manufacturers_all', $language_id, $this->storeId);
                if ($result) {
                    $json['message']    = $result['counter'].' manufacturer links were created!';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_MSUA';       
                }
                echo json_encode($json); exit;
                break; 
            case "manufacturer_fix_minus_urls":
                $result = $this->moduleModel->fixMinusSEOUrls('manufacturer', $language_id);
                if ($result) {
                    $json['success']    = true;
                    $json['reload']     = true;
                } else {
                    $json['error']      = 'No minus count found! ID:' . 'ERR_CTGFMU';       
                }
                echo json_encode($json); exit;
                break;
            case "information_seo_urls":
                $result = $this->moduleModel->createSEOUrls('informations', $language_id, $this->storeId);
                if ($result) {
                    $json['message']    = $result['counter'].' information links were created!';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_ISU';       
                }
                echo json_encode($json); exit;
                break;   
            case "information_seo_urls_all":
                $result = $this->moduleModel->createSEOUrls('informations_all', $language_id, $this->storeId);
                if ($result) {
                    $json['message']    = $result['counter'].' information links were created!';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_ISUA';       
                }
                echo json_encode($json); exit;
                break;
            case "information_fix_minus_urls":
                $result = $this->moduleModel->fixMinusSEOUrls('information', $language_id);
                if ($result) {
                    $json['success']    = true;
                    $json['reload']     = true;
                } else {
                    $json['error']      = 'No minus count found! ID:' . 'ERR_CTGFMU';       
                }
                echo json_encode($json); exit;
                break;
            case "product_seo_titles":
                $result = $this->moduleModel->createSEOTitles('products', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' product meta titles were created!';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_PST';       
                }
                echo json_encode($json); exit;
                break; 
            case "product_seo_titles_all":
                $result = $this->moduleModel->createSEOTitles('products_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' product meta titles were created!';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_PSTA';       
                }
                echo json_encode($json); exit;
                break; 
            case "category_seo_titles":
                $result = $this->moduleModel->createSEOTitles('categories', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' category meta titles were created!';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_CST';       
                }
                echo json_encode($json); exit;
                break;
            case "category_seo_titles_all":
                $result = $this->moduleModel->createSEOTitles('categories_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' category meta titles were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_CSTA';       
                }
                echo json_encode($json); exit;
                break; 
            case "information_seo_titles":
                $result = $this->moduleModel->createSEOTitles('informations', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' information meta titles were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_IST';       
                }
                echo json_encode($json); exit;
                break;
            case "information_seo_titles_all":
                $result = $this->moduleModel->createSEOTitles('informations_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' information meta titles were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_ISTA';       
                }
                echo json_encode($json); exit;
                break;
            case "manufacturer_seo_titles":
                $result = $this->moduleModel->createSEOTitles('manufacturers', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' manufacturer meta titles were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_MST';       
                }
                echo json_encode($json); exit;
                break;
            case "manufacturer_seo_titles_all":
                $result = $this->moduleModel->createSEOTitles('manufacturers_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' manufacturer meta titles were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_MSTA';       
                }
                echo json_encode($json); exit;
                break;
            case "product_seo_descriptions":
                $result = $this->moduleModel->createSEODescriptions('products', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' product meta descriptions were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_PSD';       
                }
                echo json_encode($json); exit;
                break; 
            case "product_seo_descriptions_all":
                $result = $this->moduleModel->createSEODescriptions('products_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' product meta descriptions were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_PSDA';       
                }
                echo json_encode($json); exit;
                break; 
            case "category_seo_descriptions":
                $result = $this->moduleModel->createSEODescriptions('categories', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' category meta descriptions were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_CSD';       
                }
                echo json_encode($json); exit;
                break; 
            case "category_seo_descriptions_all":
                $result = $this->moduleModel->createSEODescriptions('categories_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' category meta descriptions were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_CSDA';       
                }
                echo json_encode($json); exit;
                break; 
            case "information_seo_descriptions":
                $result = $this->moduleModel->createSEODescriptions('informations', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' information meta descriptions were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_ISD';       
                }
                echo json_encode($json); exit;
                break;
            case "information_seo_descriptions_all":
                $result = $this->moduleModel->createSEODescriptions('informations_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' information meta descriptions were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_ISDA';       
                }
                echo json_encode($json); exit;
                break;
            case "manufacturer_seo_descriptions":
                $result = $this->moduleModel->createSEODescriptions('manufacturers', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' manufacturer meta descriptions were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_MSD';       
                }
                echo json_encode($json); exit;
                break;
            case "manufacturer_seo_descriptions_all":
                $result = $this->moduleModel->createSEODescriptions('manufacturers_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' manufacturer meta descriptions were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_MSDA';       
                }
                echo json_encode($json); exit;
                break;
            case "product_seo_keywords":
                $result = $this->moduleModel->createSEOKeywords('products', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' product meta keywords were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_PSK';       
                }
                echo json_encode($json); exit;
                break; 
            case "product_seo_keywords_all":
                $result = $this->moduleModel->createSEOKeywords('products_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' product meta keywords were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_PSKA';       
                }
                echo json_encode($json); exit;
                break;
            case "category_seo_keywords":
                $result = $this->moduleModel->createSEOKeywords('categories', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' category meta keywords were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_CSK';       
                }
                echo json_encode($json); exit;
                break; 
            case "category_seo_keywords_all":
                $result = $this->moduleModel->createSEOKeywords('categories_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' category meta keywords were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_CSKA';       
                }
                echo json_encode($json); exit;
                break; 
            case "information_seo_keywords":
                $result = $this->moduleModel->createSEOKeywords('informations', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' information meta keywords were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_ISK';       
                }
                echo json_encode($json); exit;
                break;
            case "information_seo_keywords_all":
                $result = $this->moduleModel->createSEOKeywords('informations_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' information meta keywords were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_ISKA';       
                }
                echo json_encode($json); exit;
                break;
            case "manufacturer_seo_keywords":
                $result = $this->moduleModel->createSEOKeywords('manufacturers', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' manufacturer meta keywords were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_MSK';       
                }
                echo json_encode($json); exit;
                break;
            case "manufacturer_seo_keywords_all":
                $result = $this->moduleModel->createSEOKeywords('manufacturers_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' manufacturer meta keywords were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_MSKA';       
                }
                echo json_encode($json); exit;
                break;
            case "richsnippets_product_data":
                if ($this->moduleModel->saveSetting('richsnippets_product_data', '1')) {
                    $json['message']    = 'Rich snippets for the product data is now enabled';
                    $json['success']    = true;
                } else  {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_RSPD'; 
                }
                echo json_encode($json); exit;
                break;
            case "richsnippets_product_breadcrumbs":
                if ($this->moduleModel->saveSetting('richsnippets_product_breadcrumbs', '1')) {
                    $json['message']    = 'Rich snippets for the product data is now enabled';
                    $json['success']    = true;
                } else  {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_RSPB'; 
                }
                echo json_encode($json); exit;
                break;
            case "richsnippets_company_info":
                if ($this->moduleModel->saveSetting('richsnippets_company_info', '1')) {
                    $json['message']    = 'Rich snippets for the store info is now enabled';
                    $json['success']    = true;
                } else  {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_RSSI'; 
                }
                echo json_encode($json); exit;
                break;   
                
            case "hreflang_products":
                if ($this->moduleModel->saveSetting('hreflang_products', '1')) {
                    $json['message']    = 'Hreflang tag for products is now enabled';
                    $json['success']    = true;
                } else  {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_HRPB'; 
                }
                echo json_encode($json); exit;
                break; 
            case "hreflang_categories":
                if ($this->moduleModel->saveSetting('hreflang_categories', '1')) {
                    $json['message']    = 'Hreflang tag for products is now enabled';
                    $json['success']    = true;
                } else  {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_HRPB'; 
                }
                echo json_encode($json); exit;
                break; 
            case "hreflang_manufacturers":
                if ($this->moduleModel->saveSetting('hreflang_manufacturers', '1')) {
                    $json['message']    = 'Hreflang tag for products is now enabled';
                    $json['success']    = true;
                } else  {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_HRPB'; 
                }
                echo json_encode($json); exit;
                break;
            case "hreflang_informations":
                if ($this->moduleModel->saveSetting('hreflang_informations', '1')) {
                    $json['message']    = 'Hreflang tag for products is now enabled';
                    $json['success']    = true;
                } else  {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_HRPB'; 
                }
                echo json_encode($json); exit;
                break;
            case "product_h1_tags":
                $result = $this->moduleModel->createProductHeadingTags('product_h1_tags', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' product H1 tags were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_MSK';       
                }
                echo json_encode($json); exit;
                break;
            case "product_h1_tags_all":
                $result = $this->moduleModel->createProductHeadingTags('product_h1_tags_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' product H1 tags were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_MSK';       
                }
                echo json_encode($json); exit;
                break;
            case "product_h2_tags":
                $result = $this->moduleModel->createProductHeadingTags('product_h2_tags', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' product H2 tags were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_MSK';       
                }
                echo json_encode($json); exit;
                break;
            case "product_h2_tags_all":
                $result = $this->moduleModel->createProductHeadingTags('product_h2_tags_all', $language_id);
                if ($result) {
                    $json['message']    = $result['counter'].' product H2 tags were created! Refresh the page to see the updated data.';
                    $json['items']      = $result['items'];
                    $json['success']    = true;
                } else {
                    $json['error']      = $this->data['error_unexpected'] . 'ERR_MSK';       
                }
                echo json_encode($json); exit;
                break;
            default:
                break;
        }
    }
    
    public function generate_image_names() {
        $rename_additional_images = $this->request->get['rename_additional_images'] == 'true' ? true : false;
        $result = $this->moduleModel->generateImageNames($rename_additional_images);
        $this->moduleModel->saveSetting('seo_image_titles_date', date('d-m-Y H:i'));
        $this->moduleModel->saveSetting('seo_image_last_activity', json_encode($result));
        
        $json               = array();
        $json['success']    = true;
        $json['redirect']   = $this->url->link($this->modulePath, '', 'SSL');
        
        echo json_encode($json); exit;
    }
    
    public function tab_titles() {
        $this->load->model('localisation/language');
		$this->data['languages']                = $this->model_localisation_language->getLanguages();
        $this->data['default_language_id']      = $this->config->get('config_language_id');
        
        $this->data['seo_data']                 = $this->moduleModel->checkSEOTitlesCount($this->storeId);
        
        $this->data['product_title_string']     = $this->moduleModel->getSetting('product_title_string');
        $this->data['category_title_string']    = $this->moduleModel->getSetting('category_title_string');
        $this->data['information_title_string'] = $this->moduleModel->getSetting('information_title_string');
        $this->data['manufacturer_title_string'] = $this->moduleModel->getSetting('manufacturer_title_string');
        
        $this->response->setOutput($this->load->view($this->modulePath.'/content_tab/tab_seo_titles', $this->data));
    }
    
    public function tab_descriptions() {
        $this->load->model('localisation/language');
		$this->data['languages']                = $this->model_localisation_language->getLanguages();
        $this->data['default_language_id']      = $this->config->get('config_language_id');
        
        $this->data['seo_data']                 = $this->moduleModel->checkSEODescriptionsCount($this->storeId);
        
        $this->data['product_description_string']     = $this->moduleModel->getSetting('product_description_string');
        $this->data['category_description_string']    = $this->moduleModel->getSetting('category_description_string');
        $this->data['information_description_string'] = $this->moduleModel->getSetting('information_description_string');
        $this->data['manufacturer_description_string'] = $this->moduleModel->getSetting('manufacturer_description_string');
        $this->data['meta_description_word_limit']    = $this->moduleModel->getSetting('meta_description_word_limit');
        
        $this->response->setOutput($this->load->view($this->modulePath.'/content_tab/tab_seo_descriptions', $this->data));
    }
    
    public function tab_keywords() {
        $this->load->model('localisation/language');
		$this->data['languages']                = $this->model_localisation_language->getLanguages();
        $this->data['default_language_id']      = $this->config->get('config_language_id');
        
        $this->data['seo_data']                 = $this->moduleModel->checkSEOKeywordsCount($this->storeId);
        
        $this->data['product_keyword_string']     = $this->moduleModel->getSetting('product_keyword_string');
        $this->data['category_keyword_string']    = $this->moduleModel->getSetting('category_keyword_string');
        $this->data['information_keyword_string'] = $this->moduleModel->getSetting('information_keyword_string');
        $this->data['manufacturer_keyword_string'] = $this->moduleModel->getSetting('manufacturer_keyword_string');
        
        $this->response->setOutput($this->load->view($this->modulePath.'/content_tab/tab_seo_keywords', $this->data));
    }
    
    public function tab_product_heading_tags() {
        $this->load->model('localisation/language');
        $this->data['languages']                = $this->model_localisation_language->getLanguages();
        $this->data['default_language_id']      = $this->config->get('config_language_id');
        
        $this->data['seo_data']                  = $this->moduleModel->checkProductHeadingTagsCount($this->storeId);
        
        $this->data['h1_heading_tags_string']     = $this->moduleModel->getSetting('h1_heading_tags_string');
        $this->data['h2_heading_tags_string']     = $this->moduleModel->getSetting('h2_heading_tags_string');
        
        $this->response->setOutput($this->load->view($this->modulePath.'/content_tab/tab_seo_product_heading_tags', $this->data));
    }

    public function tab_image_titles() {
        $this->data['seo_image_titles_date']       = $this->moduleModel->getSetting('seo_image_titles_date');
        $this->data['images_filename_string']      = $this->moduleModel->getSetting('images_filename_string');
        $last_activity_data                        = $this->moduleModel->getSetting('seo_image_last_activity');
        
        if (!empty($last_activity_data)) {
            $last_activities = json_decode($last_activity_data, true);
            $last_activities['products_with_no_image'] = array_filter($last_activities['products_with_no_image']);

            $this->data['seo_image_last_activity'] = $last_activities;
        } else {
            $this->data['seo_image_last_activity'] = $last_activity_data;
        }
        
        $this->response->setOutput($this->load->view($this->modulePath.'/tab_image_names_ajax', $this->data));
    }
    
    public function tab_seo_links() {
        $this->load->model('localisation/language');
		$this->data['languages']                = $this->model_localisation_language->getLanguages();
        $this->data['default_language_id']      = $this->config->get('config_language_id');
        
        $this->data['seo_link_data']            = $this->moduleModel->checkSEOUrlsCount($this->storeId);
        
        $this->data['product_url_string']       = $this->moduleModel->getSetting('product_url_string', $this->storeId);
        $this->data['category_url_string']      = $this->moduleModel->getSetting('category_url_string', $this->storeId);
        $this->data['manufacturer_url_string']  = $this->moduleModel->getSetting('manufacturer_url_string', $this->storeId);
        $this->data['information_url_string']   = $this->moduleModel->getSetting('information_url_string', $this->storeId);
        
        $this->response->setOutput($this->load->view($this->modulePath.'/urls_linking_tab/tab_seo_links', $this->data));
    }
    
    public function tab_home() {
        $this->data['seo_urls_enabled']         = $this->config->get('config_seo_url');
        
		$this->data['store']                    = $this->getCurrentStore($this->storeId);
        $this->data['seo_data']                 = $this->moduleModel->getSeoScore(true, $this->storeId);
        $this->data['seo_score']                = $this->moduleModel->getSetting('seo_score', $this->storeId);
        $this->data['seo_score_last_checked']   = $this->moduleModel->getSetting('seo_score_last_checked', $this->storeId);
        
        $this->data['fixes']                    = array();
        foreach ($this->data['seo_data']['fixes'] as $index => $fix) {
            $this->data['fixes'][] = array(
                'name' => $this->data['fix_'.$index],
                'event' => $index
            );
        }
        
        $this->data['fixed']                    = array();
        foreach ($this->data['seo_data']['fixed'] as $index => $fix) {
            $this->data['fixed'][] = array(
                'name' => $this->data['fix_'.$index],
                'event' => $index
            );
        }
        $this->data['show_more'] = count($this->data['fixed']) > 4 ? true : false;

        $this->response->setOutput($this->load->view($this->modulePath.'/tab_home', $this->data));
    }
    
    public function calculate_seo_score() {
        $json   = array();
        $data   = $this->moduleModel->getSeoScore(true, $this->storeId);       
        
        $json['score'] = $data['score'];
        
        echo json_encode($json); exit;
    }
    
    public function tab_autolinks() {
        if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
			$page = 1;	
		}
        
        $this->data['total']        = $this->moduleModel->getTotalAutoLinks($this->storeId);
        $this->data['limit']        = 10;
        
        $pagination					= new Pagination();
        $pagination->total			= $this->data['total'];
        $pagination->page			= $page;
        $pagination->limit			= $this->data['limit']; 
        $pagination->url			= $this->url->link($this->modulePath.'/tab_autolinks', $this->partTokenStoreId . '&page={page}', 'SSL');
        
        $this->data['page']         = $page;
		$this->data['pagination']   = $pagination->render();
        $this->data['sources']      = $this->moduleModel->getAutoLinks($page, $this->data['limit'], $this->storeId);

		$this->data['results']      = sprintf($this->language->get('text_pagination'), ($this->data['total']) ? (($page - 1) * $this->data['limit']) + 1 : 0, ((($page - 1) * $this->data['limit']) > ($this->data['total'] - $this->data['limit'])) ? $this->data['total'] : ((($page - 1) * $this->data['limit']) + $this->data['limit']), $this->data['total'], ceil($this->data['total'] / $this->data['limit']));
        
        $this->response->setOutput($this->load->view($this->modulePath.'/urls_linking_tab/autolinks_ajax', $this->data));
    }
    
    public function add_autolink() {
        $json       = array();
        
        $data = array(
            'keyword'   => $this->request->get['autolink_keyword'],
            'url'       => $this->request->get['autolink_url']
        );
        
        if ($this->moduleModel->addAutoLink($data, $this->storeId)) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function get_autolink() {
        $id         = $this->request->get['id'];
        $json       = array();
        $data       = $this->moduleModel->getAutoLink($id);
        if ($data != false) {
            $json['success'] = true;
            $json['message'] = '';
            $json['data']    = $data;
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function edit_autolink() {
        $json       = array();
        $id         = $this->request->get['id'];

        $data = array(
            'keyword'   => $this->request->get['autolink_keyword'],
            'url'       => $this->request->get['autolink_url']
        );
        
        if ($this->moduleModel->editAutoLink($data, $id, $this->storeId)) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function remove_autolink() {
        $id         = $this->request->get['id'];
        $json       = array();
        
        if ($this->moduleModel->deleteAutoLink($id)) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function remove_autolinks() {
        $ids        = isset($this->request->post['results']) ? $this->request->post['results'] : array();
        $json       = array();
        $flag       = true;
        
        foreach ($ids as $id) {
            if (!$this->moduleModel->deleteAutoLink($id['value'])) { 
                $flag = false;
            }
        }
        
        if ($flag) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function tab_richsnippets() {
        $this->data['richsnippets_product_data']        = $this->moduleModel->getSetting('richsnippets_product_data');
        $this->data['richsnippets_product_breadcrumbs'] = $this->moduleModel->getSetting('richsnippets_product_breadcrumbs');
        $this->data['richsnippets_company_info']        = $this->moduleModel->getSetting('richsnippets_company_info');
        $this->data['richsnippets_category_breadcrumbs']= $this->moduleModel->getSetting('richsnippets_category_breadcrumbs');
        
        $this->response->setOutput($this->load->view($this->modulePath.'/tab_structured_data_ajax', $this->data));
    }
    
    public function tab_sociallinks() {
        $this->data['facebook_open_graph']              = $this->moduleModel->getSetting('facebook_open_graph');
        $this->data['twitter_card']                     = $this->moduleModel->getSetting('twitter_card');
        $this->data['google_publisher']                 = $this->moduleModel->getSetting('google_publisher');
        $this->data['google_publisher_id']              = $this->moduleModel->getSetting('google_publisher_id');
        $this->data['twitter_card_username']            = $this->moduleModel->getSetting('twitter_card_username');
        $this->data['twitter_card_product_data']        = $this->moduleModel->getSetting('twitter_card_product_data');
        $this->data['facebook_open_graph_product_data'] = $this->moduleModel->getSetting('facebook_open_graph_product_data');
        $this->data['facebook_open_graph_app_id']       = $this->moduleModel->getSetting('facebook_open_graph_app_id');
        
        $this->data['hreflang_products']                = $this->moduleModel->getSetting('hreflang_products');
        $this->data['hreflang_categories']              = $this->moduleModel->getSetting('hreflang_categories');
        $this->data['hreflang_manufacturers']           = $this->moduleModel->getSetting('hreflang_manufacturers');
        $this->data['hreflang_informations']            = $this->moduleModel->getSetting('hreflang_informations');
        
        $this->response->setOutput($this->load->view($this->modulePath.'/tab_social_seo_ajax', $this->data));
    }
    
    public function tab_htaccess() {
        $file_path                                      = dirname(DIR_SYSTEM).'/.htaccess';
       
        if (file_exists($file_path)) {
            $file_contents                              = file_get_contents(dirname(DIR_SYSTEM).'/.htaccess');
        } else {
            $file_contents                              = '';
        }
        
        $this->data['file_contents']                    = $file_contents; 

        $this->response->setOutput($this->load->view($this->modulePath.'/file_editor_tab/tab_htaccess', $this->data));
    }
    
    public function tab_robots() {
        $file_path                                      = dirname(DIR_SYSTEM).'/robots.txt';
        
        if (file_exists($file_path)) {
            $file_contents                              = file_get_contents(dirname(DIR_SYSTEM).'/robots.txt');
        } else {
            $file_contents                              = '';
        }
        
        $this->data['file_contents']                    = $file_contents; 
        
        $this->response->setOutput($this->load->view($this->modulePath.'/file_editor_tab/tab_robots', $this->data));
    }
    
    public function tab_customurls() {
        if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
			$page = 1;	
		}
        
        $this->data['store']        = $this->getCurrentStore($this->storeId);
        $this->data['total']        = $this->moduleModel->getTotalCustomUrls($this->storeId);
        $this->data['limit']        = 10;
        $pagination					= new Pagination();
        $pagination->total			= $this->data['total'];
        $pagination->page			= $page;
        $pagination->limit			= $this->data['limit']; 
        $pagination->url			= $this->url->link($this->modulePath.'/tab_customurls', $this->partTokenStoreId . '&page={page}', 'SSL');

        $this->data['page']         = $page;
		$this->data['pagination']   = $pagination->render();
        $this->data['sources']      = $this->moduleModel->getCustomUrls($page, $this->data['limit'], $this->storeId);

		$this->data['results']      = sprintf($this->language->get('text_pagination'), ($this->data['total']) ? (($page - 1) * $this->data['limit']) + 1 : 0, ((($page - 1) * $this->data['limit']) > ($this->data['total'] - $this->data['limit'])) ? $this->data['total'] : ((($page - 1) * $this->data['limit']) + $this->data['limit']), $this->data['total'], ceil($this->data['total'] / $this->data['limit']));
        
        $this->response->setOutput($this->load->view($this->modulePath.'/urls_linking_tab/customurls_ajax', $this->data));
    }
    
    public function add_customurl() {
        $json       = array();
        
        $data = array(
            'keyword'   => $this->request->get['custom_keyword'],
            'query'     => $this->request->get['custom_query']
        );
        
        if ($this->moduleModel->addCustomUrl($data, $this->storeId)) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function get_customurl() {
        $query      = $this->request->get['query'];
        $json       = array();
        $data       = $this->moduleModel->getCustomUrl($query, $this->storeId);
        if ($data != false) {
            $json['success'] = true;
            $json['message'] = '';
            $json['data']    = $data;
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function remove_customurl() {
        $query      = $this->request->get['query'];
        $json       = array();
        
        if ($this->moduleModel->deleteCustomUrl($query, $this->storeId)) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function remove_customurls() {
        $queries    = isset($this->request->post['results']) ? $this->request->post['results'] : array();
        $json       = array();
        $flag       = true;
        
        foreach ($queries as $query) {
            if (!$this->moduleModel->deleteCustomUrl($query['value'], $this->storeId)) { 
                $flag = false;
            }
        }
        
        if ($flag) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function get_crawler_data() {
        require_once DIR_SYSTEM . '/library/vendor/isenselabs/isenselabs_seo/HtmlDom.php';
        
        $url = html_entity_decode($this->request->get['url'], ENT_QUOTES, 'UTF-8');
        
        $start_time = microtime(true);
        $response = null;
        
        $functionality_check = ini_get('allow_url_fopen') ? true : false;
        
        if ($functionality_check) {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 20);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
            curl_setopt ($ch, CURLOPT_FOLLOWLOCATION, true);
            // Only calling the head
            curl_setopt($ch, CURLOPT_HEADER, true); // header will be at output
            // curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'HEAD'); // HTTP request is 'HEAD'
            curl_setopt($ch, CURLOPT_NOBODY, true);
            $response = curl_exec ($ch);
            $error = curl_error($ch);
            if (strlen($error) > 0) {
                echo "<br>Error is : ". $error;
            }
            curl_close($ch);
            $end_time = microtime(true);
            $total_tffb_time = number_format($end_time - $start_time, 4);
        }
        
        $this->data['missing_functionality'] = false; 
        
        if (empty($response)) {
            if (!$functionality_check) {
                $this->data['missing_functionality'] = true; 
            }            
            
            $this->data['display_data'] = false; 
        } else {
            $fields_checker_values = array();
            
            function get_redirect_url($url){
                $redirect_url = null; 

                $url_parts = @parse_url($url);
                if (!$url_parts) return false;
                if (!isset($url_parts['host'])) return false; //can't process relative URLs
                if (!isset($url_parts['path'])) $url_parts['path'] = '/';

                $sock = fsockopen($url_parts['host'], (isset($url_parts['port']) ? (int)$url_parts['port'] : 80), $errno, $errstr, 30);
                if (!$sock) return false;

                $request = "HEAD " . $url_parts['path'] . (isset($url_parts['query']) ? '?'.$url_parts['query'] : '') . " HTTP/1.1\r\n"; 
                $request .= 'Host: ' . $url_parts['host'] . "\r\n"; 
                $request .= "Connection: Close\r\n\r\n"; 
                fwrite($sock, $request);
                $response = '';
                while(!feof($sock)) $response .= fread($sock, 8192);
                fclose($sock);

                if (preg_match('/^Location: (.+?)$/m', $response, $matches)){
                    if ( substr($matches[1], 0, 1) == "/" )
                        return $url_parts['scheme'] . "://" . $url_parts['host'] . trim($matches[1]);
                    else
                        return trim($matches[1]);

                } else {
                    return false;
                }

            }
            
            function get_all_redirects($url){
                $redirects = array();
                while ($newurl = get_redirect_url($url)){
                    if (in_array($newurl, $redirects)){
                        break;
                    }
                    $redirects[] = $newurl;
                    $url = $newurl;
                }
                return $redirects;
            }

            function get_final_url($url){
                $redirects = get_all_redirects($url);
                if (count($redirects)>0){
                    return array_pop($redirects);
                } else {
                    return $url;
                }
            }
            
            $ssl_check_url = get_final_url($url); 
                  
            if (false !== strpos($ssl_check_url, 'https')) {
                $fields_checker_values['ssl_enabled'] = true;
            } else {
                $fields_checker_values['ssl_enabled'] = false;
            }
            
            $start_time = microtime(true);
            
            $arrContextOptions=array(
                "ssl"=>array(
                    "verify_peer"=>false,
                    "verify_peer_name"=>false
                ),
            ); 
            
            if (!$site_contents = @file_get_contents($url, false, stream_context_create($arrContextOptions))) {
                $error = error_get_last();
                $this->data['display_data'] = false; 
                echo ($this->load->view($this->modulePath.'/tab_crawler_results', $this->data));
                exit;
            } 
            $end_time = microtime(true);
            $total_site_time = number_format($end_time - $start_time, 4);
            
            $fields_checker_values['ttfb_loading'] = $total_tffb_time;
            $fields_checker_values['site_loading'] = $total_site_time;

            $dom = HtmlDom::fromURL($url);
            
            if (function_exists('mb_strlen')) {
                $mb_strlen = true; 
            } else {
                $mb_strlen = false;
            }

            $fields_checker = array(
                'h1' => array(),
                'h2' => array(),
                'h3' => array(),
                'h4' => array(),
                'h5' => array(),
                'h6' => array(),
                'title' => array(),
                'meta[name="description"]' => array(),
                'link[rel="icon"]' => array(),
                'link[rel="canonical"]' => array(),
                'meta[property^="og"]' => array(),
                'meta[name^="twitter"]' => array(),
                'meta[name="viewport"]' => array()
            );

            foreach ($fields_checker as $selector => $data) {
                $fields_checker[$selector] = $dom->find($selector);
            }

            $heading_tags = array(
                'h1' => count($fields_checker['h1']),
                'h2' => count($fields_checker['h2']),
                'h3' => count($fields_checker['h3']),
                'h4' => count($fields_checker['h4']),
                'h5' => count($fields_checker['h5']),
                'h6' => count($fields_checker['h6'])
            );

            $small_long_headings = array();

            foreach ($fields_checker as $selector => $data) {

                // Find long or small headings
                if (in_array($selector, array_keys($heading_tags))) {
                    foreach ($data as $item) {
                        if ($mb_strlen) {
                            $string_length = mb_strlen($item->getInnerText());
                        } else {
                            $string_length = strlen($item->getInnerText()); 
                        }
                        if ($string_length < 15 || $string_length > 65) {
                            $small_long_headings[] = array(
                                'heading' => $selector,
                                'text' => $item->getInnerText()
                            );
                        }

                        $fields_checker_values[$selector][] = $item->getInnerText();
                    }
                }

                if ($selector == 'title') {
                    $data->rewind();
                    if ($data->current()) {
                        $fields_checker_values[$selector] = $data->current()->getInnerText();
                        
                        if ($mb_strlen) {
                            $fields_checker_values['title_length'] = mb_strlen($fields_checker_values[$selector]);
                        } else {
                            $fields_checker_values['title_length'] = strlen($fields_checker_values[$selector]);
                        }
                    }
                }

                if ($selector == 'meta[name="description"]') {
                    $data->rewind();
                    if ($data->current()) {
                        $fields_checker_values['meta_description'] = $data->current()->getAttribute('content')->value;

                        if ($mb_strlen) {
                            $fields_checker_values['meta_description_length'] = mb_strlen($fields_checker_values['meta_description']);
                        } else {
                            $fields_checker_values['meta_description_length'] = strlen($fields_checker_values['meta_description']);
                        }
                    }
                }

                if ($selector == 'link[rel="canonical"]' && count($data)>0) {
                    $data->rewind();
                    $fields_checker_values['canonical'] = $data->current()->getAttribute('href')->value;
                    $fields_checker_values['full_url'] = $url;
                }


                if ($selector == 'meta[property^="og"]') {
                    foreach ($data as $item) {
                        $fields_checker_values['og_tags'][] = array(
                            'name' => $data->current()->getAttribute('property')->value, 
                            'value' => $data->current()->getAttribute('content')->value
                        );
                    }
                }

                if ($selector == 'meta[name^="twitter"]') {
                    foreach ($data as $item) {
                        $fields_checker_values['twitter_tags'][] = array(
                            'name' => $data->current()->getAttribute('name')->value, 
                            'value' => $data->current()->getAttribute('content')->value
                        );
                    }
                }
            }

            if (!isset($fields_checker_values['canonical'])) $fields_checker_values['canonical'] = '';
            if (!isset($fields_checker_values['full_url'])) $fields_checker_values['full_url'] = $url;
            if (!isset($fields_checker_values['title'])) $fields_checker_values['title'] = '';
            if (!isset($fields_checker_values['meta_description'])) $fields_checker_values['meta_description'] = '';
            if (!isset($fields_checker_values['title_length'])) $fields_checker_values['title_length'] = 0;
            if (!isset($fields_checker_values['meta_description_length'])) $fields_checker_values['meta_description_length'] = 0;
            if (!isset($fields_checker_values['og_tags'])) $fields_checker_values['og_tags'] = array();
            if (!isset($fields_checker_values['twitter_tags'])) $fields_checker_values['twitter_tags'] = array();

            $this->data['heading_tags'] = $heading_tags;
            $this->data['small_long_headings'] = $small_long_headings;
            $this->data['small_long_headings_counter'] = count(array_map("count", $small_long_headings));
            $this->data['fields_checker'] = $fields_checker;
            $this->data['fields_checker_values'] = $fields_checker_values;
            $this->data['display_data'] = true;
        }    
    
        $this->response->setOutput($this->load->view($this->modulePath.'/tab_crawler_results', $this->data));
    }
    
    public function tab_seo_analysis() {
        $this->data['crawler_list'] = array(
            'All',
            'Googlebot',
            'Googlebot-Image',
            'Bingbot',
            'YandexBot',
            'YandexImages'
        );
        
        $filter_url = '';
        
        if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
			$page = 1;	
		}
        
        if (!empty($this->request->get['crawler'])) {
            $crawler = $this->request->get['crawler'];
            $filter_url .= '&crawler='.$crawler;
        } else {
            $crawler = 'All';
        }
        
        
        if (!empty($this->request->get['url'])) {
            $url = $this->request->get['url'];
            $filter_url .= '&url='.$url;
        } else {
            $url = '';
        }
        
        if (!empty($this->request->get['date_start'])) {
            $date_start = $this->request->get['date_start'];
            $filter_url .= '&date_start='.$date_start;
        } else {
            $date_start = '';
        }
        
         if (!empty($this->request->get['date_end'])) {
            $date_end = $this->request->get['date_end'];
            $filter_url .= '&date_end='.$date_end;
        } else {
            $date_end = '';
        }
        
        $this->data['total']        = $this->moduleModel->getTotalCrawledUrls($crawler, $url, $date_start, $date_end, $this->storeId);
        $this->data['limit']        = 15;
        $this->data['crawler']      = $crawler;
        $this->data['date_start']   = $date_start;
        $this->data['date_end']     = $date_end;
        $this->data['url']          = $url;
        
        $pagination					= new Pagination();
        $pagination->total			= $this->data['total'];
        $pagination->page			= $page;
        $pagination->limit			= $this->data['limit']; 
        $pagination->url			= $this->url->link($this->modulePath.'/tab_seo_analysis', $this->partTokenStoreId . '&page={page}'.$filter_url, 'SSL');

        $this->data['page']         = $page;
		$this->data['pagination']   = $pagination->render();
        $this->data['sources']      = $this->moduleModel->getCrawledUrls($page, $crawler, $url, $date_start, $date_end, $this->data['limit'], $this->storeId);

		$this->data['results']      = sprintf($this->language->get('text_pagination'), ($this->data['total']) ? (($page - 1) * $this->data['limit']) + 1 : 0, ((($page - 1) * $this->data['limit']) > ($this->data['total'] - $this->data['limit'])) ? $this->data['total'] : ((($page - 1) * $this->data['limit']) + $this->data['limit']), $this->data['total'], ceil($this->data['total'] / $this->data['limit']));
        
        $this->response->setOutput($this->load->view($this->modulePath.'/tab_seo_analysis_ajax', $this->data));
    }
    
    public function clear_seo_analysis() {
        $json       = array();
        
        if ($this->moduleModel->clearSeoAnalysisResults($this->storeId)) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function toggle_seo_analysis() {
        $setting = $this->moduleModel->getSetting('search_engine_analytics_enable');
        
        if ($setting == '1') {
           $this->moduleModel->saveSetting('search_engine_analytics_enable', '0'); 
        } else {
           $this->moduleModel->saveSetting('search_engine_analytics_enable', '1'); 
        }
        
        $this->response->redirect($this->url->link($this->modulePath, $this->partTokenStoreId, 'SSL'));
    }
    
    public function save_editor_field() {
        $json = array();
        
        if ($this->moduleModelEditor->saveField($this->request->post, $this->storeId)) {
            $json['success'] = true;
        } else {
            if (!empty($this->request->post['field']) && $this->request->post['field'] == 'url_alias') {
                $json['error']   = $this->data['error_unexpected_seo_url'];
            } else {
                $json['error']   = $this->data['error_unexpected'] . 'ERR_ADVEDIT';
            }
            
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function editor_products() {
        $this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
        
        $url = '';
        
        if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
			$page = 1;	
		}

        if (!empty($this->request->get['language_id'])) {
            $language_id = (int) $this->request->get['language_id'];
        } else {
			$language_id = $this->config->get('config_language_id');	
		}
        
        $url .= '&language_id=' . $language_id;
        
        if (!empty($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
            $url .= '&filter_name=' . $url;
        } else {
			$filter_name = '';	
		}
        
        if (!empty($this->request->get['filter_keyword'])) {
            $filter_keyword = $this->request->get['filter_keyword'];
            $url .= '&filter_keyword=' . $filter_keyword;
        } else {
			$filter_keyword = '';	
		}
        
        if (!empty($this->request->get['filter_meta_title'])) {
            $filter_meta_title = $this->request->get['filter_meta_title'];
            $url .= '&filter_meta_title=' . $filter_meta_title;
        } else {
			$filter_meta_title = '';	
		}
        
        if (!empty($this->request->get['filter_meta_description'])) {
            $filter_meta_description = $this->request->get['filter_meta_description'];
            $url .= '&filter_meta_description=' . $filter_meta_description;
        } else {
			$filter_meta_description = '';	
		}
        
        if (!empty($this->request->get['filter_meta_keywords'])) {
            $filter_meta_keywords = $this->request->get['filter_meta_keywords'];
            $url .= '&filter_meta_keywords=' . $filter_meta_keywords;
        } else {
			$filter_meta_keywords = '';	
		}
        
        if (!empty($this->request->get['filter_h1'])) {
            $filter_h1 = $this->request->get['filter_h1'];
            $url .= '&filter_h1=' . $filter_h1;
        } else {
			$filter_h1 = '';	
		}
        
        if (!empty($this->request->get['filter_h2'])) {
            $filter_h2 = $this->request->get['filter_h2'];
            $url .= '&filter_h2=' . $filter_h2;
        } else {
			$filter_h2 = '';	
		}
        
        if (!empty($this->request->get['filter_limit'])) {
            $filter_limit = $this->request->get['filter_limit'];
            $url .= '&filter_limit=' . $filter_limit;
        } else {
			$filter_limit = 10;	
		}
        
        $data = array(
            'language_id' => $language_id,
            'filter_name' => $filter_name,
            'filter_keyword' => $filter_keyword,
            'filter_meta_title' => $filter_meta_title,
            'filter_meta_description' => $filter_meta_description,
            'filter_meta_keywords' => $filter_meta_keywords,
            'filter_h1' => $filter_h1,
            'filter_h2' => $filter_h2,
            'filter_limit' => $filter_limit
        );
        
        $this->data['language_id']  = $language_id;
        $this->data['filter_name']  = $filter_name;
        $this->data['filter_keyword']  = $filter_keyword;
        $this->data['filter_meta_title']  = $filter_meta_title;
        $this->data['filter_meta_description']  = $filter_meta_description;
        $this->data['filter_meta_keywords']  = $filter_meta_keywords;
        $this->data['filter_h1']  = $filter_h1;
        $this->data['filter_h2']  = $filter_h2;
        $this->data['filter_limit']  = $filter_limit;
        
        $this->data['total']        = $this->moduleModelEditor->getTotalProducts($data, $this->storeId);
        $this->data['action_url']   = $this->url->link($this->modulePath.'/editor_products', $this->partTokenStoreId, 'SSL');
        
        $pagination					= new Pagination();
        $pagination->total			= $this->data['total'];
        $pagination->page			= $page;
        $pagination->limit			= $filter_limit; 
        $pagination->url			= $this->url->link($this->modulePath.'/editor_products', $this->partTokenStoreId . '&page={page}' . $url, 'SSL');
        
        $this->data['page']         = $page;
		$this->data['pagination']   = $pagination->render();
        $this->data['sources']      = $this->moduleModelEditor->getProducts($page, $data, $this->storeId);
        $this->data['limit']        = $filter_limit;

		$this->data['results']      = sprintf($this->language->get('text_pagination'), ($this->data['total']) ? (($page - 1) * $this->data['limit']) + 1 : 0, ((($page - 1) * $this->data['limit']) > ($this->data['total'] - $this->data['limit'])) ? $this->data['total'] : ((($page - 1) * $this->data['limit']) + $this->data['limit']), $this->data['total'], ceil($this->data['total'] / $this->data['limit']));
        
        $this->response->setOutput($this->load->view($this->modulePath.'/advanced_editor_tab/products_ajax', $this->data));
    }
    
    public function editor_categories() {
        $this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
        
        $url = '';
        
        if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
			$page = 1;	
		}
        
        if (!empty($this->request->get['language_id'])) {
            $language_id = (int) $this->request->get['language_id'];
        } else {
			$language_id = $this->config->get('config_language_id');	
		}
        
        $url .= '&language_id=' . $language_id;
        
        if (!empty($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
            $url .= '&filter_name=' . $url;
        } else {
			$filter_name = '';	
		}
        
        if (!empty($this->request->get['filter_keyword'])) {
            $filter_keyword = $this->request->get['filter_keyword'];
            $url .= '&filter_keyword=' . $filter_keyword;
        } else {
			$filter_keyword = '';	
		}
        
        if (!empty($this->request->get['filter_meta_title'])) {
            $filter_meta_title = $this->request->get['filter_meta_title'];
            $url .= '&filter_meta_title=' . $filter_meta_title;
        } else {
			$filter_meta_title = '';	
		}
        
        if (!empty($this->request->get['filter_meta_description'])) {
            $filter_meta_description = $this->request->get['filter_meta_description'];
            $url .= '&filter_meta_description=' . $filter_meta_description;
        } else {
			$filter_meta_description = '';	
		}
        
        if (!empty($this->request->get['filter_meta_keywords'])) {
            $filter_meta_keywords = $this->request->get['filter_meta_keywords'];
            $url .= '&filter_meta_keywords=' . $filter_meta_keywords;
        } else {
			$filter_meta_keywords = '';	
		}
        
        if (!empty($this->request->get['filter_limit'])) {
            $filter_limit = $this->request->get['filter_limit'];
            $url .= '&filter_limit=' . $filter_limit;
        } else {
			$filter_limit = 10;	
		}
        
        $data = array(
            'language_id' => $language_id,
            'filter_name' => $filter_name,
            'filter_keyword' => $filter_keyword,
            'filter_meta_title' => $filter_meta_title,
            'filter_meta_description' => $filter_meta_description,
            'filter_meta_keywords' => $filter_meta_keywords,
            'filter_limit' => $filter_limit
        );
        
        $this->data['language_id']  = $language_id;
        $this->data['filter_name']  = $filter_name;
        $this->data['filter_keyword']  = $filter_keyword;
        $this->data['filter_meta_title']  = $filter_meta_title;
        $this->data['filter_meta_description']  = $filter_meta_description;
        $this->data['filter_meta_keywords']  = $filter_meta_keywords;
        $this->data['filter_limit']  = $filter_limit;
        
        $this->data['total']        = $this->moduleModelEditor->getTotalCategories($data, $this->storeId);
        $this->data['language_id']  = $language_id;
        $this->data['action_url']   = $this->url->link($this->modulePath.'/editor_categories', $this->partTokenStoreId, 'SSL');
        
        $pagination					= new Pagination();
        $pagination->total			= $this->data['total'];
        $pagination->page			= $page;
        $pagination->limit			= $filter_limit; 
        $pagination->url			= $this->url->link($this->modulePath.'/editor_categories', $this->partTokenStoreId . '&page={page}' . $url, 'SSL');
        
        $this->data['page']         = $page;
		$this->data['pagination']   = $pagination->render();
        $this->data['sources']      = $this->moduleModelEditor->getCategories($page, $data, $this->storeId);
        $this->data['limit']        = $filter_limit;
        
		$this->data['results']      = sprintf($this->language->get('text_pagination'), ($this->data['total']) ? (($page - 1) * $this->data['limit']) + 1 : 0, ((($page - 1) * $this->data['limit']) > ($this->data['total'] - $this->data['limit'])) ? $this->data['total'] : ((($page - 1) * $this->data['limit']) + $this->data['limit']), $this->data['total'], ceil($this->data['total'] / $this->data['limit']));
        
        $this->response->setOutput($this->load->view($this->modulePath.'/advanced_editor_tab/categories_ajax', $this->data));
    }
    
    public function editor_informations() {
        $this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
        
        $url = '';
        
        if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
			$page = 1;	
		}
        
        if (!empty($this->request->get['language_id'])) {
            $language_id = (int) $this->request->get['language_id'];
        } else {
			$language_id = $this->config->get('config_language_id');	
		}
        
        $url .= '&language_id=' . $language_id;
        
        if (!empty($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
            $url .= '&filter_name=' . $url;
        } else {
			$filter_name = '';	
		}
        
        if (!empty($this->request->get['filter_keyword'])) {
            $filter_keyword = $this->request->get['filter_keyword'];
            $url .= '&filter_keyword=' . $filter_keyword;
        } else {
			$filter_keyword = '';	
		}
        
        if (!empty($this->request->get['filter_meta_title'])) {
            $filter_meta_title = $this->request->get['filter_meta_title'];
            $url .= '&filter_meta_title=' . $filter_meta_title;
        } else {
			$filter_meta_title = '';	
		}
        
        if (!empty($this->request->get['filter_meta_description'])) {
            $filter_meta_description = $this->request->get['filter_meta_description'];
            $url .= '&filter_meta_description=' . $filter_meta_description;
        } else {
			$filter_meta_description = '';	
		}
        
        if (!empty($this->request->get['filter_meta_keywords'])) {
            $filter_meta_keywords = $this->request->get['filter_meta_keywords'];
            $url .= '&filter_meta_keywords=' . $filter_meta_keywords;
        } else {
			$filter_meta_keywords = '';	
		}
        
        if (!empty($this->request->get['filter_limit'])) {
            $filter_limit = $this->request->get['filter_limit'];
            $url .= '&filter_limit=' . $filter_limit;
        } else {
			$filter_limit = 10;	
		}
        
        $data = array(
            'language_id' => $language_id,
            'filter_name' => $filter_name,
            'filter_keyword' => $filter_keyword,
            'filter_meta_title' => $filter_meta_title,
            'filter_meta_description' => $filter_meta_description,
            'filter_meta_keywords' => $filter_meta_keywords,
            'filter_limit' => $filter_limit
        );
        
        $this->data['language_id']  = $language_id;
        $this->data['filter_name']  = $filter_name;
        $this->data['filter_keyword']  = $filter_keyword;
        $this->data['filter_meta_title']  = $filter_meta_title;
        $this->data['filter_meta_description']  = $filter_meta_description;
        $this->data['filter_meta_keywords']  = $filter_meta_keywords;
        $this->data['filter_limit']  = $filter_limit;
        
        $this->data['total']        = $this->moduleModelEditor->getTotalInformations($data, $this->storeId);
        $this->data['language_id']  = $language_id;
        $this->data['action_url']   = $this->url->link($this->modulePath.'/editor_informations', $this->partTokenStoreId, 'SSL');
        
        $pagination					= new Pagination();
        $pagination->total			= $this->data['total'];
        $pagination->page			= $page;
        $pagination->limit			= $filter_limit; 
        $pagination->url			= $this->url->link($this->modulePath.'/editor_informations', $this->partTokenStoreId . '&page={page}' . $url, 'SSL');
        
        $this->data['page']         = $page;
		$this->data['pagination']   = $pagination->render();
        $this->data['sources']      = $this->moduleModelEditor->getInformations($page, $data, $this->storeId);
        $this->data['limit']        = $filter_limit;
        
		$this->data['results']      = sprintf($this->language->get('text_pagination'), ($this->data['total']) ? (($page - 1) * $this->data['limit']) + 1 : 0, ((($page - 1) * $this->data['limit']) > ($this->data['total'] - $this->data['limit'])) ? $this->data['total'] : ((($page - 1) * $this->data['limit']) + $this->data['limit']), $this->data['total'], ceil($this->data['total'] / $this->data['limit']));
        
        $this->response->setOutput($this->load->view($this->modulePath.'/advanced_editor_tab/informations_ajax', $this->data));
    }
    
    public function editor_manufacturers() {
        $this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
        
        $url = '';
        
        if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
			$page = 1;	
		}
        
        if (!empty($this->request->get['language_id'])) {
            $language_id = (int) $this->request->get['language_id'];
        } else {
			$language_id = $this->config->get('config_language_id');	
		}
        
        $url = '&language_id=' . $language_id;
        
        if (!empty($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
            $url .= '&filter_name=' . $url;
        } else {
			$filter_name = '';	
		}
        
        if (!empty($this->request->get['filter_keyword'])) {
            $filter_keyword = $this->request->get['filter_keyword'];
            $url .= '&filter_keyword=' . $filter_keyword;
        } else {
			$filter_keyword = '';	
		}
        
        if (!empty($this->request->get['filter_meta_title'])) {
            $filter_meta_title = $this->request->get['filter_meta_title'];
            $url .= '&filter_meta_title=' . $filter_meta_title;
        } else {
			$filter_meta_title = '';	
		}
        
        if (!empty($this->request->get['filter_meta_description'])) {
            $filter_meta_description = $this->request->get['filter_meta_description'];
            $url .= '&filter_meta_description=' . $filter_meta_description;
        } else {
			$filter_meta_description = '';	
		}
        
        if (!empty($this->request->get['filter_meta_keywords'])) {
            $filter_meta_keywords = $this->request->get['filter_meta_keywords'];
            $url .= '&filter_meta_keywords=' . $filter_meta_keywords;
        } else {
			$filter_meta_keywords = '';	
		}
        
        if (!empty($this->request->get['filter_limit'])) {
            $filter_limit = $this->request->get['filter_limit'];
            $url .= '&filter_limit=' . $filter_limit;
        } else {
			$filter_limit = 10;	
		}

        $data = array(
            'language_id' => $language_id,
            'filter_name' => $filter_name,
            'filter_keyword' => $filter_keyword,
            'filter_meta_title' => $filter_meta_title,
            'filter_meta_description' => $filter_meta_description,
            'filter_meta_keywords' => $filter_meta_keywords,
            'filter_limit' => $filter_limit
        );
        
        $this->data['language_id']  = $language_id;
        $this->data['filter_name']  = $filter_name;
        $this->data['filter_keyword']  = $filter_keyword;
        $this->data['filter_meta_title']  = $filter_meta_title;
        $this->data['filter_meta_description']  = $filter_meta_description;
        $this->data['filter_meta_keywords']  = $filter_meta_keywords;
        $this->data['filter_limit']  = $filter_limit;

        $this->data['total']        = $this->moduleModelEditor->getTotalManufacturers($data, $this->storeId);
        $this->data['language_id']  = $language_id;
        $this->data['action_url']   = $this->url->link($this->modulePath.'/editor_manufacturers', $this->partTokenStoreId, 'SSL');
        
        $pagination					= new Pagination();
        $pagination->total			= $this->data['total'];
        $pagination->page			= $page;
        $pagination->limit			= $filter_limit; 
        $pagination->url			= $this->url->link($this->modulePath.'/editor_manufacturers', $this->partTokenStoreId . '&page={page}' . $url, 'SSL');
        
        $this->data['page']         = $page;
		$this->data['pagination']   = $pagination->render();
        $this->data['sources']      = $this->moduleModelEditor->getManufacturers($page, $data, $this->storeId);
        $this->data['limit']        = $filter_limit;
        
		$this->data['results']      = sprintf($this->language->get('text_pagination'), ($this->data['total']) ? (($page - 1) * $this->data['limit']) + 1 : 0, ((($page - 1) * $this->data['limit']) > ($this->data['total'] - $this->data['limit'])) ? $this->data['total'] : ((($page - 1) * $this->data['limit']) + $this->data['limit']), $this->data['total'], ceil($this->data['total'] / $this->data['limit']));
        
        $this->response->setOutput($this->load->view($this->modulePath.'/advanced_editor_tab/manufacturers_ajax', $this->data));
    }
    
    public function tab_detected_missing_pages() {
        if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
			$page = 1;	
		}
        
        $filter_url = '';
        
        if (!empty($this->request->get['visits'])) {
            $visits = $this->request->get['visits'];
            $filter_url .= '&visits='.$visits;
        } else {
            $visits = '';
        }
        
        if (!empty($this->request->get['filter_route'])) {
            $filter_route = $this->request->get['filter_route'];
            $filter_url .= '&filter_route='.$filter_route;
        } else {
            $filter_route = '';
        }
        
        if (!empty($this->request->get['date_start'])) {
            $date_start = $this->request->get['date_start'];
            $filter_url .= '&date_start='.$date_start;
        } else {
            $date_start = '';
        }
        
        if (!empty($this->request->get['date_end'])) {
            $date_end = $this->request->get['date_end'];
            $filter_url .= '&date_end='.$date_end;
        } else {
            $date_end = '';
        }
        
        $this->data['total']        = $this->moduleModel->getTotalDetectedPages($filter_route, $visits, $date_start, $date_end, $this->storeId);
        $this->data['limit']        = 10;
        $this->data['filter_route'] = $filter_route;
        $this->data['date_start']   = $date_start;
        $this->data['date_end']     = $date_end;
        $this->data['visits']       = $visits;
        
        $pagination					= new Pagination();
        $pagination->total			= $this->data['total'];
        $pagination->page			= $page;
        $pagination->limit			= $this->data['limit']; 
        $pagination->url			= $this->url->link($this->modulePath.'/tab_detected_missing_pages', $this->partTokenStoreId . '&page={page}' . $filter_url, 'SSL');

        $this->data['page']         = $page;
		$this->data['pagination']   = $pagination->render();
        $this->data['sources']      = $this->moduleModel->getDetectedPages($page, $this->data['limit'], $filter_route, $visits, $date_start, $date_end, $this->storeId);

		$this->data['results']      = sprintf($this->language->get('text_pagination'), ($this->data['total']) ? (($page - 1) * $this->data['limit']) + 1 : 0, ((($page - 1) * $this->data['limit']) > ($this->data['total'] - $this->data['limit'])) ? $this->data['total'] : ((($page - 1) * $this->data['limit']) + $this->data['limit']), $this->data['total'], ceil($this->data['total'] / $this->data['limit']));
         
        $this->response->setOutput($this->load->view($this->modulePath.'/missing_pages_tab/detected_pages_ajax', $this->data));
    }
    
    public function remove_detected_page() {
        $id         = $this->request->get['id'];
        $json       = array();
        
        if ($this->moduleModel->deleteDetectedPage($id, $this->storeId)) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function remove_detected_pages() {
        $ids        = isset($this->request->post['results']) ? $this->request->post['results'] : array();
        $json       = array();
        $flag       = true;
        
        foreach ($ids as $id) {
            if (!$this->moduleModel->deleteDetectedPage($id['value'], $this->storeId)) { 
                $flag = false;
            }
        }
        
        if ($flag) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function clear_missing_pages() {
        $json       = array();
        
        if ($this->moduleModel->clearMissingPagesResults($this->storeId)) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function toggle_missing_pages_detection() {
        $setting = $this->moduleModel->getSetting('404_pages_gathering');
        
        if ($setting == '1') {
           $this->moduleModel->saveSetting('404_pages_gathering', '0'); 
        } else {
           $this->moduleModel->saveSetting('404_pages_gathering', '1'); 
        }
        
        $this->response->redirect($this->url->link($this->modulePath, $this->partTokenStoreId, 'SSL'));
    }
    
    public function add_missing_page_redirect() {
        $json       = array();
        
        $data = array(
            'route_from'   => $this->request->get['route_from'],
            'route_to'     => $this->request->get['route_to']
        );
        
        if ($this->moduleModel->addMissingPageRedirect($data, $this->storeId)) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function tab_redirects() {
     	if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
			$page = 1;	
		}
        
        $filter_url = '';
        
        if (!empty($this->request->get['route_from'])) {
            $route_from = $this->request->get['route_from'];
            $filter_url .= '&route_from='.$route_from;
        } else {
            $route_from = '';
        }
        
        if (!empty($this->request->get['route_to'])) {
            $route_to = $this->request->get['route_to'];
            $filter_url .= '&route_to='.$route_to;
        } else {
            $route_to = '';
        }
        
        $this->data['total']        = $this->moduleModel->getTotalRedirects($route_from, $route_to, $this->storeId);
        $this->data['limit']        = 10;
        $this->data['route_from']   = $route_from;
        $this->data['route_to']     = $route_to;
        
        $pagination					= new Pagination();
        $pagination->total			= $this->data['total'];
        $pagination->page			= $page;
        $pagination->limit			= $this->data['limit']; 
        $pagination->url			= $this->url->link($this->modulePath.'/tab_redirects', $this->partTokenStoreId . '&page={page}' . $filter_url, 'SSL');

        $this->data['page']         = $page;
		$this->data['pagination']   = $pagination->render();
        $this->data['sources']      = $this->moduleModel->getRedirects($page, $this->data['limit'], $route_from, $route_to, $this->storeId);

		$this->data['results']      = sprintf($this->language->get('text_pagination'), ($this->data['total']) ? (($page - 1) * $this->data['limit']) + 1 : 0, ((($page - 1) * $this->data['limit']) > ($this->data['total'] - $this->data['limit'])) ? $this->data['total'] : ((($page - 1) * $this->data['limit']) + $this->data['limit']), $this->data['total'], ceil($this->data['total'] / $this->data['limit']));
             
        $this->response->setOutput($this->load->view($this->modulePath.'/missing_pages_tab/redirects_ajax', $this->data));
    }
    
    public function remove_redirect() {
        $id         = $this->request->get['id'];
        $json       = array();
        
        if ($this->moduleModel->deleteRedirect($id, $this->storeId)) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function remove_redirects() {
        $ids        = isset($this->request->post['results']) ? $this->request->post['results'] : array();
        $json       = array();
        $flag       = true;
        
        foreach ($ids as $id) {
            if (!$this->moduleModel->deleteRedirect($id['value'], $this->storeId)) { 
                $flag = false;
            }
        }
        
        if ($flag) {
            $json['success'] = true;
            $json['message'] = '';
        } else {
            $json['error']   = $this->data['error_unexpected'];
        }
        
        echo json_encode($json);
        exit;
    }
    
    public function install() {
        /* Database Checks */
        $this->moduleModel->initDb($this->storeId);
        
        $this->setupEvent();
    }
    
    public function uninstall() {
        $this->load->model("setting/event");
        $this->model_setting_event->deleteEventByCode($this->eventGroup);
    }

    public function setupEvent() {
        $this->load->model('setting/event');

        $this->model_setting_event->deleteEventByCode($this->eventGroup);

        /* Add Events */
        $this->model_setting_event->addEvent($this->eventGroup, "catalog/view/common/header/before", $this->modulePath . "/canonicalManager");
        $this->model_setting_event->addEvent($this->eventGroup, "catalog/view/common/header/before", $this->modulePath . "/hreflangControllerManager");
        $this->model_setting_event->addEvent($this->eventGroup, "catalog/view/common/header/after", $this->modulePath . "/hreflangViewManager");
        $this->model_setting_event->addEvent($this->eventGroup, "catalog/controller/common/header/after", $this->modulePath . "/searchEngineAnalytics");
        $this->model_setting_event->addEvent($this->eventGroup, "catalog/controller/product/manufacturer/info/before", $this->modulePath . "/manufacturerMetaData");
        $this->model_setting_event->addEvent($this->eventGroup, "catalog/controller/error/not_found/before", $this->modulePath . "/customUrlFunctionality", 1, 0);
        $this->model_setting_event->addEvent($this->eventGroup, "catalog/controller/error/not_found/before", $this->modulePath . "/notFoundPageHandler", 1, 1);
        $this->model_setting_event->addEvent($this->eventGroup, "catalog/controller/common/language/language/before", $this->modulePath . "/seoUrlLanguageSwitch");
        $this->model_setting_event->addEvent($this->eventGroup, "catalog/view/product/product/before", $this->modulePath . "/productAutoLinksH1H2Tags");
        $this->model_setting_event->addEvent($this->eventGroup, "catalog/view/product/category/before", $this->modulePath . "/categoryAutoLinks");
        $this->model_setting_event->addEvent($this->eventGroup, "catalog/*/before", $this->modulePath . "/customUrlFunctionalityRewrite");
        $this->model_setting_event->addEvent($this->eventGroup, "catalog/view/common/header/before", $this->modulePath . "/structuredData");
        $this->model_setting_event->addEvent($this->eventGroup, "catalog/view/common/header/after", $this->modulePath . "/structuredDataView");
    }

	protected function validate() {
		if (!$this->user->hasPermission('modify', $this->modulePath)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
    
    // Get current store
	private function getCurrentStore($store_id) {  
        $this->load->model("setting/store");
        
        if($store_id && $store_id != 0) {
            $store = $this->model_setting_store->getStore($store_id);
        } else {
            $store['store_id'] = 0;
            $store['name'] = $this->config->get('config_name');
            $store['url'] = $this->getCatalogURL();
        }
        return $store;
    }
    
    // Gets catalog url
	private function getCatalogURL() {
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTPS_CATALOG;
        } else {
            $storeURL = HTTP_CATALOG;
        } 
        return $storeURL;
    }
}
