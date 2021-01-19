<?php 
class ControllerExtensionPurpletreeMultivendorSellerpayment extends Controller{
	public function index(){
		if (!$this->customer->validateSeller()) {
			$this->session->data['error_warning'] = $this->language->get('error_license');
			$this->response->redirect($this->url->link('extension/purpletree_multivendor/stores', 'user_token=' . $this->session->data['user_token'], true));
		}
		$this->load->language('purpletree_multivendor/sellerpayment');
			
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('extension/purpletree_multivendor/sellerpayment');
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_payment'] = $this->language->get('text_payment');
		$data['text_trnasaction'] = $this->language->get('text_trnasaction');
		$data['text_amount'] = $this->language->get('text_amount');
		$data['text_payment_mode'] = $this->language->get('text_payment_mode');
		$data['text_status'] = $this->language->get('text_status');
		$data['text_created_at'] = $this->language->get('text_created_at');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_list'] = $this->language->get('text_list');
		
		$data['entry_date_from'] = $this->language->get('entry_date_from');
		$data['entry_date_to'] = $this->language->get('entry_date_to');
		$data['button_filter'] = $this->language->get('button_filter');
		
		if (isset($this->request->get['filter_date_from'])) {
			$filter_date_from = $this->request->get['filter_date_from'];
		} else {
			$end_date = date('Y-m-d', strtotime("-30 days"));
			$filter_date_from = $end_date;
		}

		if (isset($this->request->get['filter_date_to'])) {
			$filter_date_to = $this->request->get['filter_date_to'];
		} else {
			$end_date = date('Y-m-d');
			$filter_date_to = $end_date;
		}
		$url = '';
		if (isset($this->request->get['filter_date_from'])) {
			$url .= '&filter_date_from=' . $this->request->get['filter_date_from'];
		}

		if (isset($this->request->get['filter_date_to'])) {
			$url .= '&filter_date_to=' . $this->request->get['filter_date_to'];
		}
		if (isset($this->request->get['seller_id'])) {
			$url .= '&seller_id=' . $this->request->get['seller_id'];
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_payment'),
			'href' => $this->url->link('extension/purpletree_multivendor/sellerpayment', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		if (isset($this->request->get['seller_id'])) {
			$seller_id = $this->request->get['seller_id'];
		} else {
			$seller_id = 0;
		}
		
		$data['seller_id'] = (isset($this->request->get['seller_id'])?$this->request->get['seller_id']:'');
		
		$filter_data = array(
			'filter_date_from'    => $filter_date_from,
			'filter_date_to' => $filter_date_to,
			'start'                => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                => $this->config->get('config_limit_admin'),
			'seller_id'				=>$seller_id
		);
		
		$data['seller_payments'] = array();
		
		$seller_payments = $this->model_extension_purpletree_multivendor_sellerpayment->getPayments($filter_data);
		
		$total_payments = $this->model_extension_purpletree_multivendor_sellerpayment->getTotalPayments($filter_data);
		
		$curency = $this->config->get('config_currency');
		
		$currency_detail = $this->model_extension_purpletree_multivendor_sellerpayment->getCurrencySymbol($curency);
		
		if($seller_payments){
			foreach($seller_payments as $seller_payment){
				$data['seller_payments'][] = array(
					'transaction_id' => $seller_payment['transaction_id'],
					'amount' => $this->currency->format($seller_payment['amount'], $currency_detail['code'], $currency_detail['value']),
					'payment_mode' => $seller_payment['payment_mode'],
					'status' => $seller_payment['status'],
					'created_at' => date($this->language->get('date_format_short'), strtotime($seller_payment['created_at']))
				);
			}
		}
		
		$data['user_token'] = $this->session->data['user_token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$pagination = new Pagination();
		$pagination->total = $total_payments;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/purpletree_multivendor/sellerpayment', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total_payments) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_payments - $this->config->get('config_limit_admin'))) ? $total_payments : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_payments, ceil($total_payments / $this->config->get('config_limit_admin')));

		$data['filter_date_from'] = $filter_date_from;
		$data['filter_date_to'] = $filter_date_to;
		$data['ver']=VERSION;
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/payment_list', $data));
	}
}
?>