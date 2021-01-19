<?php
class ControllerExtensionModuleSocialChat extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/social_chat');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('module_social_chat', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true));
		}

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
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/social_chat', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/module/social_chat', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true);

		if (isset($this->request->post['module_social_chat_status'])) {
			$data['module_social_chat_status'] = $this->request->post['module_social_chat_status'];
		} else {
			$data['module_social_chat_status'] = $this->config->get('module_social_chat_status');
		}

		if (isset($this->request->post['module_social_chat_facebook'])) {
			$data['module_social_chat_facebook'] = $this->request->post['module_social_chat_facebook'];
		} else {
			$data['module_social_chat_facebook'] = $this->config->get('module_social_chat_facebook');
		}

		if (isset($this->request->post['module_social_chat_whatsapp'])) {
			$data['module_social_chat_whatsapp'] = $this->request->post['module_social_chat_whatsapp'];
		} else {
			$data['module_social_chat_whatsapp'] = $this->config->get('module_social_chat_whatsapp');
		}

		if (isset($this->request->post['module_social_chat_email'])) {
			$data['module_social_chat_email'] = $this->request->post['module_social_chat_email'];
		} else {
			$data['module_social_chat_email'] = $this->config->get('module_social_chat_email');
		}

		if (isset($this->request->post['module_social_chat_call'])) {
			$data['module_social_chat_call'] = $this->request->post['module_social_chat_call'];
		} else {
			$data['module_social_chat_call'] = $this->config->get('module_social_chat_call');
		}

		if (isset($this->request->post['module_social_chat_call_to_action'])) {
			$data['module_social_chat_call_to_action'] = $this->request->post['module_social_chat_call_to_action'];
		} else {
			$data['module_social_chat_call_to_action'] = $this->config->get('module_social_chat_call_to_action');
		}

		if (isset($this->request->post['module_social_chat_button_color'])) {
			$data['module_social_chat_button_color'] = $this->request->post['module_social_chat_button_color'];
		} else {
			$data['module_social_chat_button_color'] = $this->config->get('module_social_chat_button_color');
		}

		if (isset($this->request->post['module_social_chat_position'])) {
			$data['module_social_chat_position'] = $this->request->post['module_social_chat_position'];
		} else {
			$data['module_social_chat_position'] = $this->config->get('module_social_chat_position');
		}

		if (isset($this->request->post['module_social_chat_order'])) {
			$data['module_social_chat_order'] = $this->request->post['module_social_chat_order'];
		} else {
			$data['module_social_chat_order'] = $this->config->get('module_social_chat_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/social_chat', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/social_chat')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
