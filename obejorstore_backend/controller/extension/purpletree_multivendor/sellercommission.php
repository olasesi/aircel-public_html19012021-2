<?php 
class ControllerExtensionPurpletreeMultivendorSellercommission extends Controller{
	public function index(){
		if (!$this->customer->validateSeller()) {
			$this->load->language('purpletree_multivendor/ptsmultivendor');
			$this->session->data['error_warning'] = $this->language->get('error_license');
			
		}
		$this->load->language('purpletree_multivendor/sellercommission');
		
		$this->load->model('extension/purpletree_multivendor/sellercommission');

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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/purpletree_multivendor/sellercommission', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);
		$this->document->setTitle($this->language->get('heading_title'));
		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_total_sale'] = $this->language->get('text_total_sale');
		$data['text_total_commission'] = $this->language->get('text_total_commission');
		$data['text_recvd_amt'] = $this->language->get('text_recvd_amt');
		$data['text_pending_amt'] = $this->language->get('text_pending_amt');
		$data['text_order_id'] = $this->language->get('text_order_id');
		$data['text_product_id'] = $this->language->get('text_product_id');
		$data['text_status'] = $this->language->get('text_status');
		$data['text_created_at'] = $this->language->get('text_created_at');
		/////commission invoice////
		$data['text_commission_percent'] = $this->language->get('text_commission_percent');
		$data['generate_invoice'] = $this->language->get('generate_invoice');
		$data['text_commission_fixed'] = $this->language->get('text_commission_fixed');
		$data['text_commission_shipping'] = $this->language->get('text_commission_shipping');	
		/////End commission invoice////
		$data['text_commission'] = $this->language->get('text_commission');		
		$data['text_product_price'] = $this->language->get('text_product_price');
		$data['text_no_results'] = $this->language->get('text_empty');
		$data['help_Invoice'] = $this->language->get('help_Invoice');
		$data['help_store'] = $this->language->get('help_store');
		
		$data['entry_date_from'] = $this->language->get('entry_date_from');
		$data['entry_date_to'] = $this->language->get('entry_date_to');
		
		$data['button_filter'] = $this->language->get('button_filter');
		
		//$url = '';
		
		if (isset($this->request->get['seller_id'])) {
			$url .= '&seller_id=' . $this->request->get['seller_id'];
		}
		
		$data['seller_commissions'] = array();
		$data['seller_id'] = (isset($this->request->get['seller_id'])?$this->request->get['seller_id']:'');
		$filter_data = array(
			'filter_date_from'    => $filter_date_from,
			'filter_date_to' => $filter_date_to,
			'start'                => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                => $this->config->get('config_limit_admin'),
			'seller_id'				=> $seller_id,
			'order_status' => $this->config->get('module_purpletree_multivendor_commission_status'),
		);
		
		$total_sale = $this->model_extension_purpletree_multivendor_sellercommission->getTotalsale($filter_data);
		
		$seller_commissions = $this->model_extension_purpletree_multivendor_sellercommission->getCommissions($filter_data);
		
		$total_commissions = $this->model_extension_purpletree_multivendor_sellercommission->getTotalCommissions($filter_data);
		
		$this->load->model('extension/purpletree_multivendor/sellerpayment');
		$curency = $this->config->get('config_currency');
		
		$currency_detail = $this->model_extension_purpletree_multivendor_sellerpayment->getCurrencySymbol($curency);
        $data['seller_commissions'] = array();		
		if($seller_commissions){
			foreach($seller_commissions as $seller_commission1){
				$seller_commissions2 = $this->model_extension_purpletree_multivendor_sellercommission->getCommissions11($seller_commission1['order_id']);
				foreach($seller_commissions2 as $seller_commission){
				$data['seller_commissions'][] = array(
					'id' => $seller_commission['id'],
					'order_id' => $seller_commission['order_id'],
					'product_name' => $seller_commission['name'],					
					'invoice_status' => $seller_commission['invoice_status'],					
					'commission_fixed' =>$this->currency->format($seller_commission['commission_fixed'], $currency_detail['code'], $currency_detail['value']),
					'commission_percent' => $this->currency->format((($seller_commission['commission_percent']/100)*$seller_commission['total_price']), $currency_detail['code'], $currency_detail['value']),
					'commission_shipping' => $this->currency->format($seller_commission['commission_shipping'], $currency_detail['code'], $currency_detail['value']),
					'price' => $this->currency->format($seller_commission['total_price'], $currency_detail['code'], $currency_detail['value']),
					'commission' => $this->currency->format($seller_commission['commission'], $currency_detail['code'], $currency_detail['value']),
					'created_at' => date($this->language->get('date_format_short'), strtotime($seller_commission['created_at']))
				);
							}
			}
		}		
		
		
		$data['user_token'] = $this->session->data['user_token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		}elseif (isset($this->session->data['error_warning'])) {
			$data['error_warning'] = $this->session->data['error_warning'];

			unset($this->session->data['error_warning']);
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
		$pagination->total = $total_commissions;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/purpletree_multivendor/sellercommission', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total_commissions) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_commissions - $this->config->get('config_limit_admin'))) ? $total_commissions : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_commissions, ceil($total_commissions / $this->config->get('config_limit_admin')));
		
		$data['seller_stores'] = $this->model_extension_purpletree_multivendor_sellercommission->getSellerstore();

		$data['filter_date_from'] = $filter_date_from;
		$data['filter_date_to'] = $filter_date_to;
		$data['ver']=VERSION;
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
        $data['commission_invoice'] = $this->url->link('extension/purpletree_multivendor/sellercommission/generate', 'user_token=' . $this->session->data['user_token'] . $url, true);
		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/commission_list', $data));
	}
	public function generate(){
				if (!$this->customer->validateSeller()) {
			$this->load->language('purpletree_multivendor/ptsmultivendor');
			$this->session->data['error_warning'] = $this->language->get('error_license');
			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellercommission', 'user_token=' . $this->session->data['user_token'], true));
		}
		$this->load->language('purpletree_multivendor/sellercommission');
		
		$this->load->model('extension/purpletree_multivendor/sellercommission');
		$this->load->model('extension/purpletree_multivendor/commissioninvoice');
		if (isset($this->request->post['selected'])) {
			$commisionss = $this->request->post['selected'];
			try {
				$commisioninvoiceids = array();
				$so_id = array();
				$uniqueSoId=array();
				$total_price =0;
				$total_commission=0;
				if(!empty($commisionss)) {
				foreach ($commisionss as $commisionid => $order_id) {
					$commisionssss = $this->model_extension_purpletree_multivendor_sellercommission->getCommissionsforinvoide($commisionid);
						$so_id[] = array('seller_id'=> $commisionssss['seller_id'],
											'order_id'=> $commisionssss['order_id']
									    );
					$total_commission+=$commisionssss['commission'];
					}
					$uniqueSoId=array_unique($so_id,SORT_REGULAR);
					foreach($uniqueSoId as $vvvv){
					$total_price += $this->model_extension_purpletree_multivendor_commissioninvoice->getCommissionTotal($vvvv['order_id'],$vvvv['seller_id']);
					}
					$total_pay_amount=$total_price-$total_commission;
					
					$linkid = $this->model_extension_purpletree_multivendor_commissioninvoice->savelinkid($total_price,$total_commission,$total_pay_amount);

				foreach ($commisionss as $commisionid => $order_id) {
					$commisionsss = $this->model_extension_purpletree_multivendor_sellercommission->getCommissionsforinvoide($commisionid);
				
					 if(!empty($commisionsss)) {
						if($commisionsss['order_id'] == $order_id && $commisionsss['invoice_status'] == 0) {
							$this->model_extension_purpletree_multivendor_commissioninvoice->saveCommisionInvoice($commisionsss,$linkid);
							
							$this->session->data['success'] = "#".$linkid." ".$this->language->get('success_message'); 
						}
					} 
				}
				}
			} catch (Exception $e) {
				$this->error['warning'] = $e->getMessage();
			}
				if(isset($linkid)){
			$this->response->redirect($this->url->link('extension/purpletree_multivendor/commissioninvoice/commissionInvoice', 'user_token=' . $this->session->data['user_token'].'&commision_view_id='.$linkid , true));
			}
		}
		$seller_id ='';
		if (isset($this->request->get['seller_id'])) {
			$seller_id = '&seller_id='.$this->request->get['seller_id'];
		}
		$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellercommission', 'user_token=' . $this->session->data['user_token'].$seller_id , true));
		
		}
}
?>