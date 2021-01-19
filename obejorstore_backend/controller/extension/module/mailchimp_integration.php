<?php
//==============================================================================
// MailChimp Integration v303.1
// 
// Author: Clear Thinking, LLC
// E-mail: johnathan@getclearthinking.com
// Website: http://www.getclearthinking.com
// 
// All code within this file is copyright Clear Thinking, LLC.
// You may not copy or reuse code within this file without written permission.
//==============================================================================

class ControllerExtensionModuleMailchimpIntegration extends Controller {
	private $type = 'module';
	private $name = 'mailchimp_integration';
	
	public function index() {
		$data = array(
			'type'			=> $this->type,
			'name'			=> $this->name,
			'autobackup'	=> false,
			'save_type'		=> 'keepediting',
			'permission'	=> $this->hasPermission('modify'),
		);
		
		$this->loadSettings($data);
		
		// extension-specific
		if (version_compare(VERSION, '2.1', '<')) $this->load->library($this->name);
		$mailchimp_integration = new MailChimp_Integration($this->registry);
		
		$lists = $mailchimp_integration->getLists();
		
		unset($this->session->data['mailchimp_interest_groups']);
		unset($this->session->data['mailchimp_interests']);
		setcookie($this->name . '_popup', '', -1, '/');
		
		//------------------------------------------------------------------------------
		// Data Arrays
		//------------------------------------------------------------------------------
		$data['customer_group_array'] = array(0 => $data['text_guests']);
		$this->load->model((version_compare(VERSION, '2.1', '<') ? 'sale' : 'customer') . '/customer_group');
		foreach ($this->{'model_' . (version_compare(VERSION, '2.1', '<') ? 'sale' : 'customer') . '_customer_group'}->getCustomerGroups() as $customer_group) {
			$data['customer_group_array'][$customer_group['customer_group_id']] = $customer_group['name'];
		}
		
		$data['language_array'] = array($this->config->get('config_language') => '');
		$data['language_flags'] = array();
		$this->load->model('localisation/language');
		foreach ($this->model_localisation_language->getLanguages() as $language) {
			$data['language_array'][$language['code']] = $language['name'];
			$data['language_flags'][$language['code']] = (version_compare(VERSION, '2.2', '<')) ? 'view/image/flags/' . $language['image'] : 'language/' . $language['code'] . '/' . $language['code'] . '.png';
		}
		
		if (!empty($data['saved']['apikey'])) {
			$data['mailchimp_lists'] = array(0 => $data['standard_select']);
			foreach ($lists as $list) {
				$data['mailchimp_lists'][$list['id']] = $list['name'];
			}
		}
		if (empty($data['saved']['apikey']) || !empty($data['mailchimp_lists']['error'])) {
			$data['mailchimp_lists'] = array(0 => $data['text_enter_an_api_key']);
		}
		
		$module_layouts = array();
		$layout_modules = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_module lm LEFT JOIN " . DB_PREFIX . "layout l ON (l.layout_id = lm.layout_id) WHERE lm.code = '" . $this->db->escape($this->name) . "'")->rows;
		foreach ($layout_modules as $layout_module) {
			$module_layouts[] = '<a href="index.php?route=design/layout/edit&layout_id=' . $layout_module['layout_id'] . '&token=' . $data['token'] . '">' . $layout_module['name'] . '</a>';
		}
		
		//------------------------------------------------------------------------------
		// Extension Settings
		//------------------------------------------------------------------------------
		$data['settings'] = array();
		
		if (empty($data['saved'])) {
			$data['save_type'] = 'reload';
			$data['settings'][] = array(
				'type'		=> 'html',
				'content'	=> '
					<div id="apikey-modal" class="modal fade" data-backdrop="static">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">' . $data['entry_apikey'] . '</h4>
								</div>
								<div class="modal-body">
									<input type="text" class="form-control " name="apikey" style="width: 300px !important">
								</div>
								<div class="modal-footer">
									<a id="save-button" onclick="saveSettings($(this))" class="btn btn-primary" style="color: white"><i class="fa fa-floppy-o pad-right-sm"></i> ' . $data['button_save'] . '</a>
								</div>
							</div>
						</div>
					</div>
					<script>
						$(document).ready(function(){
							$("#apikey-modal").modal("show");
						});
					</script>
				',
			);
		}
		
		$data['settings'][] = array(
			'type'		=> 'html',
			'content'	=> '
				<div id="syncing">' . $data['text_syncing'] . '</div>
				
				<style type="text/css">
					#syncing {
						display: none;
						background: #000;
						opacity: 0.5;
						color: #FFF;
						font-size: 100px;
						text-align: center;
						position: fixed;
						top: 0;
						left: 0;
						height: 100%;
						width: 100%;
						padding-top: 10%;
						z-index: 10000;
					}
				</style>
				
				<script>
					$.get("index.php?route=extension/' . $this->type . '/' . $this->name . '/generateBackgroundData&token=' . $data['token'] . '", function(data) {
						console.log(data);
					});
				</script>
			',
		);
		
		$data['settings'][] = array(
			'type'		=> 'tabs',
			'tabs'		=> array('extension_settings', 'list_settings', 'merge_tags', 'module_settings', 'testing_mode'),
		);
		$data['settings'][] = array(
			'type'		=> 'html',
			'content'	=> '<div class="text-info text-center">' . $data['help_extension_settings'] . '</div>',
		);
		$data['settings'][] = array(
			'key'		=> 'extension_settings',
			'type'		=> 'heading',
		);
		$data['settings'][] = array(
			'key'		=> 'status',
			'type'		=> 'select',
			'options'	=> array(1 => $data['text_enabled'], 0 => $data['text_disabled']),
		);
		if (!empty($data['saved'])) {
			$data['settings'][] = array(
				'key'		=> 'apikey',
				'type'		=> 'text',
				'attributes'=> array('style' => 'width: 300px !important'),
			);
		}
		$data['settings'][] = array(
			'key'		=> 'double_optin',
			'type'		=> 'select',
			'options'	=> array(1 => $data['text_enabled'], 0 => $data['text_disabled']),
			'default'	=> 1,
		);
		$data['settings'][] = array(
			'key'		=> 'webhooks',
			'type'		=> 'checkboxes',
			'options'	=> array(
				'subscribe'		=> $data['text_subscribes'],
				'unsubscribe'	=> $data['text_unsubscribes'],
				'profile'		=> $data['text_profile_updates'],
				'cleaned'		=> $data['text_cleaned_addresses'],
			),
		);
		
		$customer_groups = $data['customer_group_array'];
		$customer_groups[0] = $data['text_no_change'];
		$data['settings'][] = array(
			'key'		=> 'subscribed_group',
			'type'		=> 'select',
			'options'	=> $customer_groups,
		);
		$data['settings'][] = array(
			'key'		=> 'unsubscribed_group',
			'type'		=> 'select',
			'options'	=> $customer_groups,
		);
		
		$data['settings'][] = array(
			'key'		=> 'manual_sync',
			'type'		=> 'html',
			'content'	=> '
				' . $data['text_starting_customer_id'] . ' <input type="text" id="starting-customer-id" class="form-control medium" style="margin-bottom: 5px" /><br />
				' . $data['text_ending_customer_id'] . ' <input type="text" id="ending-customer-id" class="form-control medium" style="margin-bottom: 5px" /><br />
				<a class="btn btn-primary" onclick="sync()">' . $data['button_sync_subscribers'] . '</a>
				<script type="text/javascript">
					function sync() {
						if (confirm("' . $data['text_sync_note'] . '")) {
							$("#syncing").fadeIn();
							$.ajax({
								url: "index.php?route=extension/' . $this->type . '/' . $this->name . '/sync&token=' . $data['token'] . '&start=" + $("#starting-customer-id").val() + "&end=" + $("#ending-customer-id").val(),
								success: function(data) {
									alert(data);
									$("#syncing").fadeOut();
								},
								error: function(xhr, status, error) {
									alert(xhr.responseText ? xhr.responseText : error);
									$("#syncing").fadeOut();
								}
							});
						}
					}
				</script>
			',
		);
		
		//------------------------------------------------------------------------------
		// Customer Creation Settings
		//------------------------------------------------------------------------------
		$data['settings'][] = array(
			'key'		=> 'customer_creation_settings',
			'type'		=> 'heading',
		);
		$data['settings'][] = array(
			'key'		=> 'autocreate',
			'type'		=> 'select',
			'options'	=> array(0 => $data['text_no'], 1 => $data['text_yes_disabled'], 2 => $data['text_yes_enabled']),
			'default'	=> 0,
		);
		$data['settings'][] = array(
			'key'		=> 'email_password',
			'type'		=> 'select',
			'options'	=> array(1 => $data['text_yes'], 0 => $data['text_no']),
			'default'	=> 0,
		);
		$data['settings'][] = array(
			'key'		=> 'emailtext_subject',
			'type'		=> 'multilingual_text',
			'default'	=> '[store]: Customer Account Created',
		);
		$data['settings'][] = array(
			'key'		=> 'emailtext_body',
			'type'		=> 'multilingual_textarea',
			'default'	=> "Your customer account has been successfully created. Your new password is:\n<br /><br />\n[password]\n<br /><br />\nThanks for choosing [store]!",
			'attributes'=> array('style' => 'height: 120px !important'),
		);
		
		//------------------------------------------------------------------------------
		// List Settings
		//------------------------------------------------------------------------------
		$data['settings'][] = array(
			'key'		=> 'list_settings',
			'type'		=> 'tab',
		);
		$data['settings'][] = array(
			'key'		=> 'list_settings',
			'type'		=> 'heading',
		);
		$data['settings'][] = array(
			'key'		=> 'listid',
			'type'		=> 'select',
			'options'	=> $data['mailchimp_lists'],
		);
		$data['settings'][] = array(
			'key'		=> 'list_mapping',
			'type'		=> 'heading',
		);
		$data['settings'][] = array(
			'type'		=> 'html',
			'content'	=> '<div class="text-info text-center" style="padding-bottom: 20px">' . $data['help_list_mapping'] . '</div>',
		);
		
		//------------------------------------------------------------------------------
		// Merge Tags
		//------------------------------------------------------------------------------
		$data['settings'][] = array(
			'key'		=> 'merge_tags',
			'type'		=> 'tab',
		);
		$data['settings'][] = array(
			'key'		=> 'merge_tags',
			'type'		=> 'heading',
		);
		$data['settings'][] = array(
			'type'		=> 'html',
			'content'	=> '<div class="text-info" style="padding-bottom: 20px">' . $data['help_merge_tags'] . '</div>',
		);
		if (empty($data['mailchimp_lists']['error'])) {
			foreach ($data['mailchimp_lists'] as $list_id => $list_name) {
				if (!$list_id) continue;
				$data['settings'][] = array(
					'key'		=> $list_id . '_FNAME',
					'type'		=> 'hidden',
					'default'	=> 'customer:firstname',
				);
				$data['settings'][] = array(
					'key'		=> $list_id . '_LNAME',
					'type'		=> 'hidden',
					'default'	=> 'customer:lastname',
				);
				$data['settings'][] = array(
					'key'		=> $list_id . '_ADDRESS',
					'type'		=> 'hidden',
					'default'	=> 'customer:address_id',
				);
				$data['settings'][] = array(
					'key'		=> $list_id . '_PHONE',
					'type'		=> 'hidden',
					'default'	=> 'customer:telephone',
				);
			}
		}
		
		//------------------------------------------------------------------------------
		// Module Settings
		//------------------------------------------------------------------------------
		$data['settings'][] = array(
			'key'		=> 'module_settings',
			'type'		=> 'tab',
		);
		$data['settings'][] = array(
			'type'		=> 'html',
			'content'	=> '<div class="text-info text-center">' . $data['help_module_settings'] . '</div>',
		);
		$data['settings'][] = array(
			'key'		=> 'module_settings',
			'type'		=> 'heading',
		);
		foreach (array('firstname', 'lastname') as $field) {
			$data['settings'][] = array(
				'key'		=> 'modules_' . $field,
				'type'		=> 'select',
				'options'	=> array('hide' => $data['text_hide'], 'optional' => $data['text_optional'], 'required' => $data['text_required']),
			);
		}
		
		$data['settings'][] = array(
			'key'		=> 'modules_redirect',
			'type'		=> 'text',
		);
		$data['settings'][] = array(
			'key'		=> 'modules_popup',
			'type'		=> 'select',
			'options'	=> array(0 => $data['text_no'], 'manual' => $data['text_yes_trigger_manually'], 'auto' => $data['text_yes_trigger_automatically']),
			'default'	=> 0,
		);
		
		$data['settings'][] = array(
			'key'		=> 'module_text',
			'type'		=> 'heading',
		);
		$data['settings'][] = array(
			'key'		=> 'moduletext_heading',
			'type'		=> 'multilingual_text',
			'default'	=> 'Newsletter',
		);
		$data['settings'][] = array(
			'key'		=> 'moduletext_top',
			'type'		=> 'multilingual_text',
		);
		$data['settings'][] = array(
			'key'		=> 'moduletext_button',
			'type'		=> 'multilingual_text',
			'default'	=> 'Subscribe',
		);
		$data['settings'][] = array(
			'key'		=> 'moduletext_emptyfield',
			'type'		=> 'multilingual_text',
			'default'	=> 'Please fill in the required fields!',
		);
		$data['settings'][] = array(
			'key'		=> 'moduletext_invalidemail',
			'type'		=> 'multilingual_text',
			'default'	=> 'Please use a valid email address!',
		);
		$data['settings'][] = array(
			'key'		=> 'moduletext_success',
			'type'		=> 'multilingual_text',
			'default'	=> 'Success! Please click the confirmation link in the e-mail sent to you.',
		);
		$data['settings'][] = array(
			'key'		=> 'moduletext_error',
			'type'		=> 'multilingual_text',
		);
		$data['settings'][] = array(
			'key'		=> 'moduletext_subscribed',
			'type'		=> 'multilingual_text',
			'default'	=> 'You are subscribed as [email]. Edit your newsletter preferences <a href="index.php?route=account/newsletter">here</a>.',
		);
		
		//------------------------------------------------------------------------------
		// Module Locations
		//------------------------------------------------------------------------------
		$data['settings'][] = array(
			'key'		=> 'module_locations',
			'type'		=> 'heading',
		);
		$data['settings'][] = array(
			'type'		=> 'html',
			'title'		=> $data['entry_module_locations'],
			'content'	=> '
				<div style="margin-top: -7px">' . $data['help_module_locations'] . ' <a href="index.php?route=design/layout&token=' . $data['token'] . '">' . (version_compare(VERSION, '2.1', '<') ? ' System >' : '') . ' Design > Layouts</a>
				<br /><br />
				' . $data['help_assigned_layouts'] . ' ' . implode(', ', $module_layouts) . '</div>
			',
		);
		
		//------------------------------------------------------------------------------
		// Testing Mode
		//------------------------------------------------------------------------------
		$data['settings'][] = array(
			'key'		=> 'testing_mode',
			'type'		=> 'tab',
		);
		$data['settings'][] = array(
			'type'		=> 'html',
			'content'	=> '<div class="text-info text-center pad-bottom">' . $data['testing_mode_help'] . '</div>',
		);
		
		$filepath = DIR_LOGS . $this->name . '.messages';
		$testing_mode_log = '';
		$refresh_or_download_button = '<a class="btn btn-info" onclick="refreshLog()"><i class="fa fa-refresh pad-right-sm"></i> ' . $data['button_refresh_log'] . '</a>';
		
		if (file_exists($filepath)) {
			$filesize = filesize($filepath);
			
			if ($filesize > 50000000) {
				file_put_contents($filepath, '');
				$filesize = 0;
			}
			
			if ($filesize > 999999) {
				$testing_mode_log = $data['standard_testing_mode'];
				$refresh_or_download_button = '<a class="btn btn-info" href="index.php?route=extension/' . $this->type . '/' . $this->name . '/downloadLog&token=' . $data['token'] . '"><i class="fa fa-download pad-right-sm"></i> ' . $data['button_download_log'] . ' (' . round($filesize / 1000000, 1) . ' MB)</a>';
			} else {
				$testing_mode_log = html_entity_decode(file_get_contents($filepath), ENT_QUOTES, 'UTF-8');
			}
		}
		
		$data['settings'][] = array(
			'key'		=> 'testing_mode',
			'type'		=> 'heading',
			'buttons'	=> $refresh_or_download_button . ' <a class="btn btn-danger" onclick="clearLog()"><i class="fa fa-trash-o pad-right-sm"></i> ' . $data['button_clear_log'] . '</a>',
		);
		$data['settings'][] = array(
			'key'		=> 'testing_mode',
			'type'		=> 'select',
			'options'	=> array(0 => $data['text_disabled'], 1 => $data['text_enabled'], 'debug' => $data['text_enabled_with_full_logging']),
		);
		$data['settings'][] = array(
			'key'		=> 'testing_messages',
			'type'		=> 'textarea',
			'class'		=> 'nosave',
			'attributes'=> array('style' => 'width: 100% !important; height: 400px; font-size: 12px !important'),
			'default'	=> htmlentities($testing_mode_log),
		);
		
		//------------------------------------------------------------------------------
		// end settings
		//------------------------------------------------------------------------------
		
		$this->document->setTitle($data['heading_title']);
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$template_file = DIR_TEMPLATE . 'extension/' . $this->type . '/' . $this->name . '.twig';

		if (is_file($template_file)) {
			extract($data);
			
			ob_start();
			require(class_exists('VQMod') ? VQMod::modCheck(modification($template_file)) : modification($template_file));
			$output = ob_get_clean();
			
			if (version_compare(VERSION, '3.0', '>=')) {
				$output = str_replace('&token=', '&user_token=', $output);
			}
			
			echo $output;
		} else {
			echo 'Error loading template file';
		}
	}
	
	//==============================================================================
	// Helper functions
	//==============================================================================
	private function hasPermission($permission) {
		return ($this->user->hasPermission($permission, $this->type . '/' . $this->name) || $this->user->hasPermission($permission, 'extension/' . $this->type . '/' . $this->name));
	}
	
	private function loadLanguage($path) {
		$_ = array();
		$language = array();
		$admin_language = (version_compare(VERSION, '2.2', '<')) ? $this->db->query("SELECT * FROM " . DB_PREFIX . "language WHERE `code` = '" . $this->db->escape($this->config->get('config_admin_language')) . "'")->row['directory'] : $this->config->get('config_admin_language');
		foreach (array('english', 'en-gb', $admin_language) as $directory) {
			$file = DIR_LANGUAGE . $directory . '/' . $directory . '.php';
			if (file_exists($file)) require($file);
			$file = DIR_LANGUAGE . $directory . '/default.php';
			if (file_exists($file)) require($file);
			$file = DIR_LANGUAGE . $directory . '/' . $path . '.php';
			if (file_exists($file)) require($file);
			$file = DIR_LANGUAGE . $directory . '/extension/' . $path . '.php';
			if (file_exists($file)) require($file);
			$language = array_merge($language, $_);
		}
		return $language;
	}
	
	private function getTableRowNumbers(&$data, $table, $sorting) {
		$groups = array();
		$rules = array();
		
		foreach ($data['saved'] as $key => $setting) {
			if (preg_match('/' . $table . '_(\d+)_' . $sorting . '/', $key, $matches)) {
				$groups[$setting][] = $matches[1];
			}
			if (preg_match('/' . $table . '_(\d+)_rule_(\d+)_type/', $key, $matches)) {
				$rules[$matches[1]][] = $matches[2];
			}
		}
		
		if (empty($groups)) $groups = array('' => array('1'));
		ksort($groups, defined('SORT_NATURAL') ? SORT_NATURAL : SORT_REGULAR);
		
		foreach ($rules as $key => $rule) {
			ksort($rules[$key], defined('SORT_NATURAL') ? SORT_NATURAL : SORT_REGULAR);
		}
		
		$data['used_rows'][$table] = array();
		$rows = array();
		foreach ($groups as $group) {
			foreach ($group as $num) {
				$data['used_rows'][preg_replace('/module_(\d+)_/', '', $table)][] = $num;
				$rows[$num] = (empty($rules[$num])) ? array() : $rules[$num];
			}
		}
		sort($data['used_rows'][$table]);
		
		return $rows;
	}
	
	//==============================================================================
	// Setting functions
	//==============================================================================
	private $encryption_key = '';
	
	public function loadSettings(&$data) {
		$backup_type = (empty($data)) ? 'manual' : 'auto';
		if ($backup_type == 'manual' && !$this->hasPermission('modify')) {
			return;
		}
		
		$this->cache->delete($this->name);
		unset($this->session->data[$this->name]);
		$code = (version_compare(VERSION, '3.0', '<') ? '' : $this->type . '_') . $this->name;
		
		// Set exit URL
		$data['token'] = $this->session->data[version_compare(VERSION, '3.0', '<') ? 'token' : 'user_token'];
		$data['exit'] = $this->url->link((version_compare(VERSION, '3.0', '<') ? 'extension' : 'marketplace') . '/' . (version_compare(VERSION, '2.3', '<') ? '' : 'extension&type=') . $this->type . '&token=' . $data['token'], '', 'SSL');
		
		// Load saved settings
		$data['saved'] = array();
		$settings_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `code` = '" . $this->db->escape($code) . "' ORDER BY `key` ASC");
		
		foreach ($settings_query->rows as $setting) {
			$key = str_replace($code . '_', '', $setting['key']);
			$value = $setting['value'];
			if ($setting['serialized']) {
				$value = (version_compare(VERSION, '2.1', '<')) ? unserialize($setting['value']) : json_decode($setting['value'], true);
			}
			
			$data['saved'][$key] = $value;
			
			if (is_array($value)) {
				foreach ($value as $num => $value_array) {
					foreach ($value_array as $k => $v) {
						$data['saved'][$key . '_' . $num . '_' . $k] = $v;
					}
				}
			}
		}
		
		// Load language and run standard checks
		$data = array_merge($data, $this->loadLanguage($this->type . '/' . $this->name));
		
		if (ini_get('max_input_vars') && ((ini_get('max_input_vars') - count($data['saved'])) < 50)) {
			$data['warning'] = $data['standard_max_input_vars'];
		}
		
		// Modify files according to OpenCart version
		if ($this->type == 'total' && version_compare(VERSION, '2.2', '<')) {
			file_put_contents(DIR_CATALOG . 'model/' . $this->type . '/' . $this->name . '.php', str_replace('public function getTotal($total) {', 'public function getTotal(&$total_data, &$order_total, &$taxes) {' . "\n\t\t" . '$total = array("totals" => &$total_data, "total" => &$order_total, "taxes" => &$taxes);', file_get_contents(DIR_CATALOG . 'model/' . $this->type . '/' . $this->name . '.php')));
		}
		
		if (version_compare(VERSION, '2.3', '>=')) {
			$filepaths = array(
				DIR_APPLICATION . 'controller/' . $this->type . '/' . $this->name . '.php',
				DIR_CATALOG . 'controller/' . $this->type . '/' . $this->name . '.php',
				DIR_CATALOG . 'model/' . $this->type . '/' . $this->name . '.php',
			);
			foreach ($filepaths as $filepath) {
				if (file_exists($filepath)) {
					rename($filepath, str_replace('.php', '.php-OLD', $filepath));
				}
			}
		}
		
		// Set save type and skip auto-backup if not needed
		if (!empty($data['saved']['autosave'])) {
			$data['save_type'] = 'auto';
		}
		
		if ($backup_type == 'auto' && empty($data['autobackup'])) {
			return;
		}
		
		// Create settings auto-backup file
		$manual_filepath = DIR_LOGS . $this->name . $this->encryption_key . '.backup';
		$auto_filepath = DIR_LOGS . $this->name . $this->encryption_key . '.autobackup';
		$filepath = ($backup_type == 'auto') ? $auto_filepath : $manual_filepath;
		if (file_exists($filepath)) unlink($filepath);
		
		file_put_contents($filepath, 'SETTING	NUMBER	SUB-SETTING	SUB-NUMBER	SUB-SUB-SETTING	VALUE' . "\n", FILE_APPEND|LOCK_EX);
		
		foreach ($data['saved'] as $key => $value) {
			if (is_array($value)) continue;
			
			$parts = explode('|', preg_replace(array('/_(\d+)_/', '/_(\d+)/'), array('|$1|', '|$1'), $key));
			
			$line = '';
			for ($i = 0; $i < 5; $i++) {
				$line .= (isset($parts[$i]) ? $parts[$i] : '') . "\t";
			}
			$line .= str_replace(array("\t", "\n"), array('    ', '\n'), $value) . "\n";
			
			file_put_contents($filepath, $line, FILE_APPEND|LOCK_EX);
		}
		
		$data['autobackup_time'] = date('Y-M-d @ g:i a');
		$data['backup_time'] = (file_exists($manual_filepath)) ? date('Y-M-d @ g:i a', filemtime($manual_filepath)) : '';
		
		if ($backup_type == 'manual') {
			echo $data['autobackup_time'];
		}
	}
	
	public function saveSettings() {
		if (!$this->hasPermission('modify')) {
			echo 'PermissionError';
			return;
		}
		
		$this->cache->delete($this->name);
		unset($this->session->data[$this->name]);
		$code = (version_compare(VERSION, '3.0', '<') ? '' : $this->type . '_') . $this->name;
		
		if ($this->request->get['saving'] == 'manual') {
			$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `code` = '" . $this->db->escape($code) . "' AND `key` != '" . $this->db->escape($this->name . '_module') . "'");
		}
		
		$module_id = 0;
		$modules = array();
		$module_instance = false;
		
		foreach ($this->request->post as $key => $value) {
			if (strpos($key, 'module_') === 0) {
				$parts = explode('_', $key, 3);
				$module_id = $parts[1];
				$modules[$parts[1]][$parts[2]] = $value;
				if ($parts[2] == 'module_id') $module_instance = true;
			} else {
				$key = (version_compare(VERSION, '3.0', '<') ? '' : $this->type . '_') . $this->name . '_' . $key;
				
				if ($this->request->get['saving'] == 'auto') {
					$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `code` = '" . $this->db->escape($code) . "' AND `key` = '" . $this->db->escape($key) . "'");
				}
				
				$this->db->query("
					INSERT INTO " . DB_PREFIX . "setting SET
					`store_id` = 0,
					`code` = '" . $this->db->escape($code) . "',
					`key` = '" . $this->db->escape($key) . "',
					`value` = '" . $this->db->escape(stripslashes(is_array($value) ? implode(';', $value) : $value)) . "',
					`serialized` = 0
				");
			}
		}
		
		foreach ($modules as $module_id => $module) {
			if (!$module_id) {
				$this->db->query("
					INSERT INTO " . DB_PREFIX . "module SET
					`name` = '" . $this->db->escape($module['name']) . "',
					`code` = '" . $this->db->escape($this->name) . "',
					`setting` = ''
				");
				$module_id = $this->db->getLastId();
				$module['module_id'] = $module_id;
			}
			$module_settings = (version_compare(VERSION, '2.1', '<')) ? serialize($module) : json_encode($module);
			$this->db->query("
				UPDATE " . DB_PREFIX . "module SET
				`name` = '" . $this->db->escape($module['name']) . "',
				`code` = '" . $this->db->escape($this->name) . "',
				`setting` = '" . $this->db->escape($module_settings) . "'
				WHERE module_id = " . (int)$module_id . "
			");
		}
	}
	
	public function deleteSetting() {
		if (!$this->hasPermission('modify')) {
			echo 'PermissionError';
			return;
		}
		$prefix = (version_compare(VERSION, '3.0', '<')) ? '' : $this->type . '_';
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `code` = '" . $this->db->escape($prefix . $this->name) . "' AND `key` = '" . $this->db->escape($prefix . $this->name . '_' . str_replace('[]', '', $this->request->get['setting'])) . "'");
	}
	
	//==============================================================================
	// Log functions
	//==============================================================================
	public function refreshLog() {
		$data = $this->loadLanguage($this->type . '/' . $this->name);
		
		if (!$this->hasPermission('modify')) {
			echo $data['standard_error'];
			return;
		}
		
		$filepath = DIR_LOGS . $this->name . '.messages';
		
		if (file_exists($filepath)) {
			if (filesize($filepath) > 999999) {
				echo $data['standard_testing_mode'];
			} else {
				echo html_entity_decode(file_get_contents($filepath), ENT_QUOTES, 'UTF-8');
			}
		}
	}
	
	public function downloadLog() {
		$file = DIR_LOGS . $this->name . '.messages';
		if (!file_exists($file) || !$this->hasPermission('access')) {
			return;
		}
		header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
		header('Content-Description: File Transfer');
		header('Content-Disposition: attachment; filename=' . $this->name . '.' . date('Y-n-d') . '.log');
		header('Content-Length: ' . filesize($file));
		header('Content-Transfer-Encoding: binary');
		header('Content-Type: text/plain');
		header('Expires: 0');
		header('Pragma: public');
		readfile($file);
	}
	
	public function clearLog() {
		$data = $this->loadLanguage($this->type . '/' . $this->name);
		
		if (!$this->hasPermission('modify')) {
			echo $data['standard_error'];
			return;
		}
		
		file_put_contents(DIR_LOGS . $this->name . '.messages', '');
	}
	
	//==============================================================================
	// Custom functions
	//==============================================================================
	public function generateBackgroundData() {
		$prefix = (version_compare(VERSION, '3.0', '<')) ? '' : $this->type . '_';
		if (!$this->hasPermission('modify') || !$this->config->get($prefix . $this->name . '_apikey')) {
			return;
		}
		
		if (version_compare(VERSION, '2.1', '<')) $this->load->library($this->name);
		$mailchimp_integration = new MailChimp_Integration($this->registry);
		
		$lists = $mailchimp_integration->getLists();
		$mailchimp_integration->createWebhooks($lists);
	}
	
	public function sync() {
		if (!$this->hasPermission('modify')) {
			echo 'PermissionError';
			return;
		}
		
		$prefix = (version_compare(VERSION, '3.0', '<')) ? '' : $this->type . '_';
		
		if (!$this->config->get($prefix . $this->name . '_apikey') || !$this->config->get($prefix . $this->name . '_listid')) {
			$language = $this->loadLanguage($this->type . '/' . $this->name);
			echo $language['text_sync_error'];
			return;
		}
		
		if (version_compare(VERSION, '2.1', '<')) $this->load->library($this->name);
		$mailchimp_integration = new MailChimp_Integration($this->registry);
		echo $mailchimp_integration->sync($this->request->get['start'], $this->request->get['end']);
	}
}
?>