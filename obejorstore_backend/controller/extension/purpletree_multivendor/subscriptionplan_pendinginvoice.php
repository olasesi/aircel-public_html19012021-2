<?php
class ControllerExtensionPurpletreeMultivendorSubscriptionplanPendinginvoice extends Controller {
	private $error = array();

	public function index() {
		
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');				
		}
		$this->load->language('purpletree_multivendor/subscriptionplan_pendinginvoice');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/subscriptionplanpendinginvoice');
		$this->load->model('extension/purpletree_multivendor/managesubscriptionplan');

		$this->getList();
	}
	public function getList() {
		
		$url = '';

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/purpletree_multivendor/subscriptionplan_pendinginvoice', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		$filter_data = array(
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
		);$url = '';
		$subs_invoice_total=$this->model_extension_purpletree_multivendor_subscriptionplanpendinginvoice->getTotalSellerInvoice($filter_data);
		$results = $this->model_extension_purpletree_multivendor_subscriptionplanpendinginvoice->getSellerInvoiceList($filter_data);
		if(!empty($results)){
		foreach ($results as $result) {
		
		/* $invoice_status = $this->model_extension_purpletree_multivendor_subscriptionplanpendinginvoice->getInvoiceStatus($result['invoice_id']); */
		$subscription_status='';
		$s_status=$this->model_extension_purpletree_multivendor_subscriptionplanpendinginvoice->getSubscriptionBySellerId($result['seller_id']);
		if($s_status==1){
		$subscription_status="Enable";	
		}else{
		$subscription_status="Disable";
		}
		
			$data['subscriptions'][] = array(
				'id'        => $result['id'],
				'plan_name'        => $result['plan_name'],
				'seller_name'        => $result['seller_name'],
				'subscription_status'  => $subscription_status,
				'invoice_status'  => $result['status'],
				'start_date'  => ($result['start_date']!='0000-00-00 00:00:00')?date('d/m/Y',strtotime($result['start_date'])):'',
				'end_date'    => ($result['end_date']!='0000-00-00 00:00:00')?date('d/m/Y',strtotime($result['end_date'])):'',
				'created_date'  =>($result['created_date']!='0000-00-00 00:00:00')?date('d/m/Y',strtotime($result['created_date'])):'',
				'modified_date'  =>($result['modified_date']!='0000-00-00 00:00:00')?date('d/m/Y',strtotime($result['modified_date'])):'',
				'add_history'  => $this->url->link('extension/purpletree_multivendor/SubscriptionplanInvoice/add', 'user_token=' . $this->session->data['user_token'] .'&invoice_id='. $result['invoice_id'] .'', true),
				'view_invoice'  => $this->url->link('extension/purpletree_multivendor/SubscriptionplanInvoice/view', 'user_token=' . $this->session->data['user_token'] .'&invoice_id='. $result['invoice_id'] .'', true)
				);
		}
	}
	
		$data['heading_title'] = $this->language->get('heading_title');
		$data['update_subscription_status'] = $this->language->get('update_subscription_status');
		$data['column_Enabled'] = $this->language->get('column_Enabled');
		$data['column_Disabled'] = $this->language->get('column_Disabled');
		$data['button_update'] = $this->language->get('button_update');
		$data['subscription_details'] = $this->language->get('subscription_details');
		$data['column_seller_name'] = $this->language->get('column_seller_name');
		$data['column_allowed_products'] = $this->language->get('column_allowed_products');
		$data['column_used_products'] = $this->language->get('column_used_products');
		$data['column_Start_date'] = $this->language->get('column_Start_date');
		$data['column_End_date'] = $this->language->get('column_End_date');
		$data['column_subscription_status'] = $this->language->get('column_subscription_status');
		$data['text_seller_plan_history'] = $this->language->get('text_seller_plan_history');
		$data['column_id'] = $this->language->get('column_id');
		$data['column_plan'] = $this->language->get('column_plan');
		$data['column_sl'] = $this->language->get('column_sl');
		$data['column_reminder'] = $this->language->get('column_reminder');
		$data['column_sellername'] = $this->language->get('column_sellername');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_invoice_status'] = $this->language->get('column_invoice_status');
		$data['column_Start_date'] = $this->language->get('column_Start_date');
		$data['column_End_date'] = $this->language->get('column_End_date');
		$data['column_Created_Date'] = $this->language->get('column_Created_Date');
		$data['button_view_invoicw'] = $this->language->get('button_view_invoicw'); 
		$data['column_No_Records_Found'] = $this->language->get('column_No_Records_Found');
		$data['column_action'] = $this->language->get('column_action');
		$data['button_assign_new_plan'] = $this->language->get('button_assign_new_plan');
		$data['button_Add_Payment_History'] = $this->language->get('button_Add_Payment_History');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['column_plan_name'] = $this->language->get('column_plan_name');
		
		$data['text_featured_products'] = $this->language->get('text_featured_products');
		$data['text_featured_store'] = $this->language->get('text_featured_store');
        $data['text_category_featured_products'] = $this->language->get('text_category_featured_products');
        $data['text_disabled_all_products'] = $this->language->get('text_disabled_all_products');
        $data['text_enabled_all_products'] = $this->language->get('text_enabled_all_products');
        $data['column_subscription_status'] = $this->language->get('column_subscription_status');
        $data['column_invoice_status'] = $this->language->get('column_invoice_status');
        $data['column_action'] = $this->language->get('column_action');
        $data['column_start_date'] = $this->language->get('column_start_date');
        $data['column_End_date'] = $this->language->get('column_End_date');
        $data['column_create_date'] = $this->language->get('column_create_date');
		// echo "<Pre>";
		// print_r($this->config->get('config_limit_admin'));
		// die;

		$pagination = new Pagination();
		$pagination->total = $subs_invoice_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/purpletree_multivendor/subscriptionplan_pendinginvoice', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();
		
		 $data['results'] = sprintf($this->language->get('text_pagination'), ($subs_invoice_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($subs_invoice_total - $this->config->get('config_limit_admin'))) ? $subs_invoice_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $subs_invoice_total, ceil($subs_invoice_total / $this->config->get('config_limit_admin'))); 

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} elseif(isset($this->session->data['error_warning'])){
			$data['error_warning'] = $this->session->data['error_warning'];
			unset($this->session->data['error_warning']);
		} else{
			$data['error_warning'] = '';
		}
				if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/subscriptionplan_pendinginvoice', $data));
	}

}
