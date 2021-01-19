<?php
class ControllerExtensionPaymentPPAdaptive extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/payment/pp_adaptive');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('payment_pp_adaptive', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}
		
			if (isset($this->error['username'])) {
			$data['error_username'] = $this->error['username'];
		} else {
			$data['error_username'] = '';
		}
		
			if (isset($this->error['password'])) {
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
		}
		
			if (isset($this->error['signature'])) {
			$data['error_signature'] = $this->error['signature'];
		} else {
			$data['error_signature'] = '';
		}
		
			if (isset($this->error['appid'])) {
			$data['error_appid'] = $this->error['appid'];
		} else {
			$data['error_appid'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/payment/pp_adaptive', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/payment/pp_adaptive', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true);

		if (isset($this->request->post['payment_pp_adaptive_admin_email'])) {
			$data['payment_pp_adaptive_admin_email'] = $this->request->post['payment_pp_adaptive_admin_email'];
		} else {
			$data['payment_pp_adaptive_admin_email'] = $this->config->get('payment_pp_adaptive_admin_email');
		}
		
		if (isset($this->request->post['payment_pp_adaptive_admin_username'])) {
			$data['payment_pp_adaptive_admin_username'] = $this->request->post['payment_pp_adaptive_admin_username'];
		} else {
			$data['payment_pp_adaptive_admin_username'] = $this->config->get('payment_pp_adaptive_admin_username');
		}
		
		if (isset($this->request->post['payment_pp_adaptive_admin_password'])) {
			$data['payment_pp_adaptive_admin_password'] = $this->request->post['payment_pp_adaptive_admin_password'];
		} else {
			$data['payment_pp_adaptive_admin_password'] = $this->config->get('payment_pp_adaptive_admin_password');
		}
		
		if (isset($this->request->post['payment_pp_adaptive_admin_signature'])) {
			$data['payment_pp_adaptive_admin_signature'] = $this->request->post['payment_pp_adaptive_admin_signature'];
		} else {
			$data['payment_pp_adaptive_admin_signature'] = $this->config->get('payment_pp_adaptive_admin_signature');
		}
		
		if (isset($this->request->post['payment_pp_adaptive_admin_appid'])) {
			$data['payment_pp_adaptive_admin_appid'] = $this->request->post['payment_pp_adaptive_admin_appid'];
		} else {
			$data['payment_pp_adaptive_admin_appid'] = $this->config->get('payment_pp_adaptive_admin_appid');
		}

		if (isset($this->request->post['payment_pp_adaptive_test'])) {
			$data['payment_pp_adaptive_test'] = $this->request->post['payment_pp_adaptive_test'];
		} else {
			$data['payment_pp_adaptive_test'] = $this->config->get('payment_pp_adaptive_test');
		}

		
		if (isset($this->request->post['payment_pp_adaptive_debug'])) {
			$data['payment_pp_adaptive_debug'] = $this->request->post['payment_pp_adaptive_debug'];
		} else {
			$data['payment_pp_adaptive_debug'] = $this->config->get('payment_pp_adaptive_debug');
		}

		if (isset($this->request->post['payment_pp_adaptive_total'])) {
			$data['payment_pp_adaptive_total'] = $this->request->post['payment_pp_adaptive_total'];
		} else {
			$data['payment_pp_adaptive_total'] = $this->config->get('payment_pp_adaptive_total');
		}

		if (isset($this->request->post['payment_pp_adaptive_order_status_id'])) {
			$data['payment_pp_adaptive_order_status_id'] = $this->request->post['payment_pp_adaptive_order_status_id'];
		} else {
			$data['payment_pp_adaptive_order_status_id'] = $this->config->get('payment_pp_adaptive_order_status_id');
		}

		if (isset($this->request->post['payment_pp_adaptive_pending_status_id'])) {
			$data['payment_pp_adaptive_pending_status_id'] = $this->request->post['payment_pp_adaptive_pending_status_id'];
		} else {
			$data['payment_pp_adaptive_pending_status_id'] = $this->config->get('payment_pp_adaptive_pending_status_id');
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['payment_pp_adaptive_geo_zone_id'])) {
			$data['payment_pp_adaptive_geo_zone_id'] = $this->request->post['payment_pp_adaptive_geo_zone_id'];
		} else {
			$data['payment_pp_adaptive_geo_zone_id'] = $this->config->get('payment_pp_adaptive_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['payment_pp_adaptive_status'])) {
			$data['payment_pp_adaptive_status'] = $this->request->post['payment_pp_adaptive_status'];
		} else {
			$data['payment_pp_adaptive_status'] = $this->config->get('payment_pp_adaptive_status');
		}

		if (isset($this->request->post['payment_pp_adaptive_sort_order'])) {
			$data['payment_pp_adaptive_sort_order'] = $this->request->post['payment_pp_adaptive_sort_order'];
		} else {
			$data['payment_pp_adaptive_sort_order'] = $this->config->get('payment_pp_adaptive_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/payment/pp_adaptive', $data));
	}

	private function validate() {

		if (!$this->user->hasPermission('modify', 'extension/payment/pp_adaptive')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['payment_pp_adaptive_admin_email']) {
			$this->error['email'] = $this->language->get('error_email');
		}
		
		if (!$this->request->post['payment_pp_adaptive_admin_username']) {
			$this->error['username'] = $this->language->get('error_username');
		}
		
		if (!$this->request->post['payment_pp_adaptive_admin_password']) {
			$this->error['password'] = $this->language->get('error_password');
		}
		
		if (!$this->request->post['payment_pp_adaptive_admin_signature']) {
			$this->error['signature'] = $this->language->get('error_signature');
		}
		
		if (!$this->request->post['payment_pp_adaptive_admin_appid']) {
			$this->error['appid'] = $this->language->get('error_appid');
		}

		return !$this->error;
	}
}