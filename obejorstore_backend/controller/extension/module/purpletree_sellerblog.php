<?php
class ControllerExtensionModulePurpletreeSellerblog extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/purpletree_sellerblog');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->model_setting_setting->editSetting('module_purpletree_sellerblog', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}

		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/purpletree_sellerblog', 'user_token=' . $this->session->data['user_token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/purpletree_sellerblog', 'user_token=' . $this->session->data['user_token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		$data['action'] = $this->url->link('extension/module/purpletree_sellerblog', 'user_token=' . $this->session->data['user_token'], true);
		
		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true);

		if (isset($this->request->post['module_purpletree_sellerblog_status'])) {
			$data['module_purpletree_sellerblog_status'] = $this->request->post['module_purpletree_sellerblog_status'];
		} else {
			$data['module_purpletree_sellerblog_status'] = $this->config->get('module_purpletree_sellerblog_status');
		}
		
		if (isset($this->request->post['module_purpletree_sellerblog_name'])) {
			$data['module_purpletree_sellerblog_name'] = $this->request->post['module_purpletree_sellerblog_name'];
		}
		else {
			$data['module_purpletree_sellerblog_name'] = $this->config->get('module_purpletree_sellerblog_name');
		}
		
		if (isset($this->request->post['module_purpletree_sellerblog_limit'])) {
			$data['module_purpletree_sellerblog_limit'] = $this->request->post['module_purpletree_sellerblog_limit'];
		}
		elseif(!empty($data['module_purpletree_sellerblog_name'])) {
			$data['module_purpletree_sellerblog_limit'] = $this->config->get('module_purpletree_sellerblog_limit');
		}
		else {
			$data['module_purpletree_sellerblog_limit'] = 4;
		}
		
		if (isset($this->request->post['module_purpletree_sellerblog_width'])) {
			$data['module_purpletree_sellerblog_width'] = $this->request->post['module_purpletree_sellerblog_width'];
		}
		elseif(!empty($data['module_purpletree_sellerblog_name'])) {
			$data['module_purpletree_sellerblog_width'] = $this->config->get('module_purpletree_sellerblog_width');
		}
		else {
			$data['module_purpletree_sellerblog_width'] = 150;
		}
		
		if (isset($this->request->post['module_purpletree_sellerblog_height'])) {
			$data['module_purpletree_sellerblog_height'] = $this->request->post['module_purpletree_sellerblog_height'];
		}
		elseif(!empty($data['module_purpletree_sellerblog_name'])) {
			$data['module_purpletree_sellerblog_height'] = $this->config->get('module_purpletree_sellerblog_height');
		}
		else {
			$data['module_purpletree_sellerblog_height'] = 150;
		}
		//echo"<pre>";print_r($data);die;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		

		$this->response->setOutput($this->load->view('extension/module/purpletree_sellerblog', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/purpletree_sellerblog')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['module_purpletree_sellerblog_name']) < 3) || (utf8_strlen($this->request->post['module_purpletree_sellerblog_name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!$this->request->post['module_purpletree_sellerblog_width']) {
			$this->error['width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['module_purpletree_sellerblog_height']) {
			$this->error['height'] = $this->language->get('error_height');
		}

		return !$this->error;
	}
}
