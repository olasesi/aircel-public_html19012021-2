<?php
class ControllerExtensionShippingPurpletreeShipping extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/shipping/purpletree_shipping');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('shipping_purpletree_shipping', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=shipping', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		
		$data['entry_store_flat_rate_shipping'] = $this->language->get('entry_store_flat_rate_shipping');
		$data['entry_store_matrix_shipping'] = $this->language->get('entry_store_matrix_shipping');
		$data['entry_store_flexible_shipping'] = $this->language->get('entry_store_flexible_shipping');
		$data['entry_storeshipping'] = $this->language->get('entry_storeshipping');
		$data['entry_storeshipping_charge'] = $this->language->get('entry_storeshipping_charge');
		$data['entry_storeshipping_type'] = $this->language->get('entry_storeshipping_type');
        $data['entry_order_wise'] = $this->language->get('entry_order_wise');
		$data['entry_product_wise'] = $this->language->get('entry_product_wise');

		$data['onlyforadminproducts'] = $this->language->get('onlyforadminproducts');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		if (isset($this->error['shipping_purpletree_shipping_chargeerror'])) {
			$data['error_storecharge'] = $this->error['shipping_purpletree_shipping_chargeerror'];
		} else {
			$data['error_storecharge'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=shipping', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/shipping/purpletree_shipping', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/shipping/purpletree_shipping', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=shipping', true);

		if (isset($this->request->post['shipping_purpletree_shipping_status'])) {
			$data['shipping_purpletree_shipping_status'] = $this->request->post['shipping_purpletree_shipping_status'];
		} else {
			$data['shipping_purpletree_shipping_status'] = $this->config->get('shipping_purpletree_shipping_status');
		}

		if (isset($this->request->post['shipping_purpletree_shipping_sort_order'])) {
			$data['shipping_purpletree_shipping_sort_order'] = $this->request->post['shipping_purpletree_shipping_sort_order'];
		} else {
			$data['shipping_purpletree_shipping_sort_order'] = $this->config->get('shipping_purpletree_shipping_sort_order');
		}
				if (isset($this->request->post['shipping_purpletree_shipping_charge'])) {
			$data['shipping_purpletree_shipping_charge'] = $this->request->post['shipping_purpletree_shipping_charge'];
		} elseif(null !== $this->config->get('shipping_purpletree_shipping_charge')) {
			$data['shipping_purpletree_shipping_charge'] = $this->config->get('shipping_purpletree_shipping_charge');
		} else {
			$data['shipping_purpletree_shipping_charge'] = '0';
		}
		if (isset($this->request->post['shipping_purpletree_shipping_type'])) {
			$data['shipping_purpletree_shipping_type'] = $this->request->post['shipping_purpletree_shipping_type'];
		} elseif(null !== $this->config->get('shipping_purpletree_shipping_type')) {
			$data['shipping_purpletree_shipping_type'] = $this->config->get('shipping_purpletree_shipping_type');
		} else {
			$data['shipping_purpletree_shipping_type'] = 'pts_flat_rate_shipping';
		}	
       if (isset($this->request->post['shipping_purpletree_shipping_order_type'])) {
			$data['shipping_purpletree_shipping_order_type'] = $this->request->post['shipping_purpletree_shipping_order_type'];
		} elseif(null !== $this->config->get('shipping_purpletree_shipping_order_type')) {
			$data['shipping_purpletree_shipping_order_type'] = $this->config->get('shipping_purpletree_shipping_order_type');
		} else {
			$data['shipping_purpletree_shipping_order_type'] = 'pts_product_wise';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/shipping/purpletree_shipping', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/shipping/purpletree_shipping')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if( ! filter_var($this->request->post['shipping_purpletree_shipping_charge'], FILTER_VALIDATE_FLOAT) && $this->request->post['shipping_purpletree_shipping_charge'] != '0') {
			$this->error['shipping_purpletree_shipping_chargeerror'] = $this->language->get('error_storeshippingcharge');
		}
		if(utf8_strlen($this->request->post['shipping_purpletree_shipping_charge']) < 1){
			$this->error['shipping_purpletree_shipping_chargeerror'] = $this->language->get('error_storeshippingcharge');
		}

		return !$this->error;
	}
}