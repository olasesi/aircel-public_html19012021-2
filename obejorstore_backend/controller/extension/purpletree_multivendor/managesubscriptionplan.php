<?php
class ControllerExtensionPurpletreeMultivendorManagesubscriptionplan extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->validateSeller()) {
			$this->load->language('purpletree_multivendor/ptsmultivendor');
			$this->session->data['error_warning'] = $this->language->get('error_license');
		}
		
		$this->load->language('purpletree_multivendor/managesubscriptionplan');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('extension/purpletree_multivendor/managesubscriptionplan');
		$this->getList();
	}

	public function add() {
		
		if (!$this->customer->validateSeller()) {
		$this->load->language('purpletree_multivendor/ptsmultivendor');
		$this->session->data['error_warning'] = $this->language->get('error_license');
		$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true));
	}
		unset($this->session->data['plan_id']);
		unset($this->session->data['start_date']);
		if (!isset($this->request->get['seller_id']) || $this->request->get['seller_id'] == '') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}
		$this->load->language('purpletree_multivendor/managesubscriptionplan');
		$seller_id = $this->request->get['seller_id'];
		$this->load->model('extension/purpletree_multivendor/managesubscriptionplan');
		$this->document->setTitle($this->language->get('heading_title'));
		
		 if (($this->request->server['REQUEST_METHOD'] == 'POST')) {

			if (isset($this->request->post['new_plan_id']) && $this->request->post['new_plan_id'] != '') {
				$plan_id   		= $this->request->post['new_plan_id'];
				$existing   	= isset($this->request->post['existing'])?$this->request->post['existing']:'';
				$status   		= isset($this->request->post['subscription_status'])?$this->request->post['subscription_status']:'0';
				$start_date   		= isset($this->request->post['start_date'])?$this->request->post['start_date']:'0';
				
		$invoice_status=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getInvoiceStatusfromSeller($seller_id);
		//echo $invoice_status; die;
			if(isset($invoice_status)){
			if($invoice_status!=2){
				$this->session->data['error_warning'] = $this->language->get('error_subscriptionplan_pending');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/add', 'user_token=' . $this->session->data['user_token'].'&seller_id='.$this->request->get['seller_id'] , true));
			}
			}
			$total_seller_assign_product = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getTotalSellerPorduct($seller_id);
			$getnewplanProducts = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getnewplanProducts($plan_id);
			if($getnewplanProducts < $total_seller_assign_product) {
				$this->session->data['error_warning'] = 'Seller has already been assigned more products than in new plan';
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/add', 'user_token=' . $this->session->data['user_token'].'&seller_id='.$this->request->get['seller_id'] , true));
			}
				$this->session->data['plan_id'] 	= $plan_id;
				$this->session->data['start_date']  = $start_date;
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/plan_confirm', 'user_token=' . $this->session->data['user_token'] .'&seller_id='. $seller_id .'&plan_id='.$plan_id.'&start_date='.$start_date.'&status='.$status.'&existing='.$existing.'&action='.$this->request->get['action'], true));
			} else {
				$this->error['error_select_plan']= $this->language->get('error_please_select_seller');
			}
		} 
				$data['heading_title']=$this->language->get('heading_title');
			
		$this->getForm();
	}
	public function edit() {
		if (!$this->customer->validateSeller()) {
		$this->load->language('purpletree_multivendor/ptsmultivendor');
		$this->session->data['error_warning'] = $this->language->get('error_license');
		$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true));
	}
		unset($this->session->data['plan_id']);
		unset($this->session->data['start_date']);
		if (!isset($this->request->get['seller_id']) || $this->request->get['seller_id'] == '') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}
		if (!isset($this->request->get['status']) || $this->request->get['status'] == '') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}
		if (!isset($this->request->get['plan_id']) || $this->request->get['plan_id'] == '') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}
		$this->load->language('purpletree_multivendor/managesubscriptionplan');
		$seller_id = $this->request->get['seller_id'];
		$plan_id = $this->request->get['plan_id'];
		
		if ($this->request->get['status']=='Active' || $this->request->get['status'] == 'Inactive') {
			$data['plan_status']=$this->request->get['status'];
		}else {
			$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));	
		}

		$this->load->model('extension/purpletree_multivendor/managesubscriptionplan');
		
		$this->document->setTitle($this->language->get('heading_title'));

		

		 if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			if (isset($this->request->post['new_plan_id']) && $this->request->post['new_plan_id'] != '') {
				$plan_id   		= $this->request->post['new_plan_id'];
				$existing   	= isset($this->request->post['existing'])?$this->request->post['existing']:'';
				$status   		= isset($this->request->post['subscription_status'])?$this->request->post['subscription_status']:'0';
				$start_date   		= isset($this->request->post['start_date'])?$this->request->post['start_date']:'0';
				
		$invoice_status=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getInvoiceStatusfromSeller($seller_id);
		//echo $invoice_status; die;
			if(isset($invoice_status)){
			if($invoice_status!=2){
				$this->session->data['error_warning'] = $this->language->get('error_subscriptionplan_pending');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/add', 'user_token=' . $this->session->data['user_token'].'&seller_id='.$this->request->get['seller_id'] , true));
			}
			}
			$total_seller_assign_product = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getTotalSellerPorduct($seller_id);
			$getnewplanProducts = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getnewplanProducts($plan_id);
			if($getnewplanProducts < $total_seller_assign_product) {
				$this->session->data['error_warning'] = 'Seller has already been assigned more products than in new plan';
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/add', 'user_token=' . $this->session->data['user_token'].'&seller_id='.$this->request->get['seller_id'] , true));
			}
				$this->session->data['plan_id'] 	= $plan_id;
				$this->session->data['start_date']  = $start_date;
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/plan_confirm', 'user_token=' . $this->session->data['user_token'] .'&seller_id='. $seller_id .'&plan_id='.$plan_id.'&start_date='.$start_date.'&status='.$status.'&existing='.$existing, true));
			} else {
				$this->error['error_select_plan']= $this->language->get('error_please_select_seller');
			}
		} 
				$data['heading_title']=$this->language->get('heading_title');
		$this->getForm();
	}
	public function active() {

		if (!$this->customer->validateSeller()) {
		$this->load->language('purpletree_multivendor/ptsmultivendor');
		$this->session->data['error_warning'] = $this->language->get('error_license');
		$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true));
	}

		if (!isset($this->request->get['id']) || $this->request->get['id'] == '') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}	
		$this->request->get['seller_id']=3;
		if (!isset($this->request->get['seller_id']) || $this->request->get['seller_id'] == '') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}
		$id= $this->request->get['id'];
		$seller_id= $this->request->get['seller_id'];

		$this->load->model('extension/purpletree_multivendor/managesubscriptionplan');
		if($id && $seller_id){
			$this->model_extension_purpletree_multivendor_managesubscriptionplan->active($id);
		}
		$this->load->language('purpletree_multivendor/managesubscriptionplan');
		$this->session->data['success'] = $this->language->get('text_plan_activated');
		$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/viewallplan', 'user_token=' . $this->session->data['user_token'].'&seller_id='.$seller_id, true));
		
	}

	public function addNewPlan() {

		if (!$this->customer->validateSeller()) {
		$this->load->language('purpletree_multivendor/ptsmultivendor');
		$this->session->data['error_warning'] = $this->language->get('error_license');
		$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true));
	    }
	
		if (!isset($this->request->get['seller_id']) || $this->request->get['seller_id'] == '') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}
		$seller_id = $this->request->get['seller_id'];
		$this->load->language('purpletree_multivendor/managesubscriptionplan');
		$this->load->model('extension/purpletree_multivendor/managesubscriptionplan');
		
		$this->document->setTitle($this->language->get('heading_title'));

	 if($this->config->get('module_purpletree_multivendor_subscription_plans')!=1){
					$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/view', 'user_token=' . $this->session->data['user_token'], true));
				} 
				
				$data=array();
				// for new seller 
				
				if(isset($this->request->post['plan_id'])){ 
				
					$plan_id=$this->request->post['plan_id'];
					$seller_id=$this->request->post['seller_id'];
				}
				$startt_when =$this->request->post['start_date'];
				$data['plan_id']=$plan_id;
				$data['seller_id']=$seller_id;
				$data['startt_when']=$startt_when;
			
				$current_plan=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getPlanBySeller($seller_id);
                $result=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getSubscribePlan($plan_id);
				if($startt_when == 1) {

				$current_plan_start_date=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getCurrentPlanByPlanId($seller_id,$plan_id);
				if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
				
				$current_plan_end_date=($current_plan_start_date['new_end_date']!='0000-00-00 00:00:00')?date('m/d/Y H:i:s',strtotime($current_plan_start_date['new_end_date'])):date('m/d/Y H:i:s', strtotime($current_plan_start_date['start_date']. ' + '.$result['validity'].' days'));
				} else {				
				$current_plan_end_date=($current_plan_start_date['end_date']!='0000-00-00 00:00:00')?date('m/d/Y H:i:s',strtotime($current_plan_start_date['end_date'])):date('m/d/Y H:i:s', strtotime($current_plan_start_date['start_date']. ' + '.$result['validity'].' days'));
				}
					
				$data['start_date'] =date('Y-m-d H:i:s',strtotime($current_plan_end_date));
					
					/*  ($current_plan['end_date']!='0000-00-00 00:00:00')?date('Y-m-d H:i:s',strtotime($current_plan['end_date'])):date('Y-m-d H:i:s', strtotime($current_plan['start_date']. ' + '.$current_plan['validity'].' days')); */
					
				} else {
					$data['start_date'] = date('Y-m-d H:i:s');
				}
				$data['current_date'] = date('Y-m-d H:i:s');
				$data['end_date']='';
				$old_invoice_id=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getInvoiceId($seller_id);			

				$currentplan=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getCurrentPlan($seller_id);
			
				if($this->config->get("module_purpletree_multivendor_tax_name")){
					$tax_name=$this->config->get("module_purpletree_multivendor_tax_name");		
				} else {
					$tax_name='';	
				}
				if($this->config->get("module_purpletree_multivendor_tax_value")){
					$tax=$this->config->get("module_purpletree_multivendor_tax_value");		
				} else {
					$tax=0;	
				}
			
				$current_invoice=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getSellerCurrentPlan($seller_id);
				

				$curr_invoice=array();
				if(!empty($current_invoice)){
					foreach($current_invoice as $value){
						$curr_invoice[$value['code']]=$value['price'];
					}
				}

				if($this->config->get("module_purpletree_multivendor_joining_fees")){
					$joining_fee=$result['joining_fee'];
				} else {
					$joining_fee=0;	
				}
	
				if($this->config->get("module_purpletree_multivendor_subscription_price")){
					$subscription_price=$result['subscription_price'];	
				} else {
					$subscription_price=0;	
				}
				$data['totals']['plan']=array();

				$data['totals']['plan'][]=array(
					'sort_order'=>0,
					'code'=>'subscription_price',
					'title'=>'Subscription Price',
					'value'=>$subscription_price
				);
if($this->config->get("module_purpletree_multivendor_subscription_price")){
if($startt_when!=1){
	$data['totals']['plan'][]=array(
					'sort_order'=>1,
					'code'=>'joining_fee',
					'title'=>'Joining Fee',
					'value'=>$joining_fee
				);
	
} else {
$joining_fee=0;	
}

}else {
				$data['totals']['plan'][]=array(
					'sort_order'=>1,
					'code'=>'joining_fee',
					'title'=>'Joining Fee',
					'value'=>$joining_fee
				);
}	

				$a_joiningfee = $joining_fee;
				if(isset($currentplan)){
		if(!$this->config->get("module_purpletree_multivendor_subscription_price")){					
					$a_joiningfee=$joining_fee-	$current_plan['joining_fee'];
					$data['totals']['plan'][]=array(
						'sort_order'=>2,
						'code'=>'adjustment_Joining_fee',
						'title'=>'Adjustment Joining fee',
						'value'=>$a_joiningfee
					);	
		}
		if(!$this->config->get("module_purpletree_multivendor_subscription_price")){
					$subscription_price=$subscription_price-$this->remindPrice($current_plan['start_date'],$current_plan['validity'],$current_plan['subscription_price'],$startt_when);
				
					$data['totals']['plan'][]=array(
						'sort_order'=>3,
						'code'=>'adjustment_subscription_price',
						'title'=>'Adjustment Subscription Price',
						'value'=>$subscription_price
					);
		}
					$previous_balance=0;
					if($subscription_price<0){
						$previous_balance=$subscription_price;
					}

				}
				$subscription_price=$a_joiningfee+$subscription_price ;
			
				$total_amount= $subscription_price;
				$cal_tax=($total_amount*$tax)/100;
				
				$data['totals']['plan'][]=array(
					'sort_order'=>4,
					'code'=>'tax',
					'title'=>$tax_name.' ('.$tax.'%)',
					'value'=>$cal_tax
				);
				$current_invo=0;
		if(!$this->config->get("module_purpletree_multivendor_subscription_price")){		
				if(isset($currentplan)){
					if(isset($curr_invoice['previous_balance'])){
					$current_invo=$curr_invoice['previous_balance'];	
					}				
				}
				$total=$total_amount+$cal_tax+$current_invo;
				$invoice_bal=0;
				if($total<0){
					$invoice_bal=$total;	
				}
			
				$data['totals']['plan'][]=array(
					'sort_order'=>5,
					'code'=>'previous_balance',
					'title'=>'Previous Balance',
					'value'=>$invoice_bal
				 );
		}
				$total=$total_amount+$cal_tax+$current_invo;
	//if plan free or grand total less then zero
				$data['vendor_invoice_status']=1;
				if($total<=0){
				$data['vendor_invoice_status']=2;
					
				}
				//end
				$invoice_mail=array();
				foreach($data['totals']['plan'] as $resultPlan){
					if($resultPlan['code']!='previous_balance'){
						 $invoice_mail['mail'][]=array(
							'title'=>$resultPlan['title'],
							'price'=>$resultPlan['value']
						);
					} else {
						$invoice_mail['mail'][]=array(
							'title'=>$resultPlan['title'],
							'price'=>$current_invo
						);
					}
				}
			
				$start=date('d/m/Y H:i:s', strtotime($data['start_date']));
				$end=date('d/m/Y H:i:s', strtotime($data['start_date']. ' + '.$result['validity'].' days'));
				$customer = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getCustomer($seller_id);

				$message='';
				$message.='Seller Name- '.$customer['firstname'].' '.$customer['lastname'].'<br>';
				$message.='Email Id- '.$customer['email'].'<br>';
				$message.='Plan Name- '.$result['plan_name'].'<br>';
				$message.='No Of Product- '.$result['no_of_product'].'<br>';
				$message.='Validity- '.$result['validity'].'<br>';
				$message.='Start Date- '.$start.'<br>';
				$message.='End Date- '.$end.'<br>';
				
				foreach($invoice_mail['mail'] as $msg){
					$message.=$msg['title'].'- '.$msg['price'].'<br>';	
				}
				$message.='Grand Total- '.$total.'<br>';
		// end new seller 

				if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
				$invoice_id=$this->model_extension_purpletree_multivendor_managesubscriptionplan->addMultipleSellerPlan($data);				
					$sellerExist=$this->model_extension_purpletree_multivendor_managesubscriptionplan->SellerExist($seller_id);
					$email_subject= $this->language->get('email_subject');
					if(!$sellerExist){
						$sellerExist=$this->model_extension_purpletree_multivendor_managesubscriptionplan->addFirstSellerPlan($seller_id);	
						$email_subject = $this->language->get('email_first_subject');
					}
					
					//if plan free or grand total less then zero
					if($total<=0){
					$this->model_extension_purpletree_multivendor_managesubscriptionplan->enableSellerSubscription($seller_id);
					}
					//end
					
					// Mail 		
					$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
					$mail->smtp_username = $this->config->get('config_mail_smtp_username');
					$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
					$mail->smtp_port = $this->config->get('config_mail_smtp_port');
					$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
					$mail->setTo($customer['email']);
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender(html_entity_decode('Seller Name', ENT_QUOTES, 'UTF-8'));
					$mail->setSubject(html_entity_decode(sprintf( $email_subject , $customer['firstname']), ENT_QUOTES, 'UTF-8'));
					$mail->setHtml($message);
					$mail->send();
					//end mail
					$this->session->data['success'] = $this->language->get('text_success');

					$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/view', 'user_token=' . $this->session->data['user_token'] , true));
				}

			
	}

	public function plan_confirm() {
		
	
		$url = '';
		if (!isset($this->request->get['seller_id']) || $this->request->get['seller_id'] == '') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] , true));
		} 

		if (!isset($this->request->get['plan_id']) || $this->request->get['plan_id'] == '') {
			$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/add', 'user_token=' . $this->session->data['user_token'].'&seller_id='.$this->request->get['seller_id'] , true));
		}
		
		if (!isset($this->request->get['start_date']) || $this->request->get['start_date'] == '') {
			$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/add', 'user_token=' . $this->session->data['user_token'].'&seller_id='.$this->request->get['seller_id'] , true));
		}
				
		$seller_id = $this->request->get['seller_id'];
		$plan_id   = $this->request->get['plan_id'];
		$start_date = $this->request->get['start_date'];
		$this->load->language('purpletree_multivendor/managesubscriptionplan');
		$this->load->language('purpletree_multivendor/subcriptionplan');
		$this->load->model('extension/purpletree_multivendor/managesubscriptionplan');
		$invoice_status=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getInvoiceStatuss($seller_id);
			 $curency = $this->config->get('config_currency');			 
             $this->load->model('extension/purpletree_multivendor/sellerpayment');
             $currency_detail = $this->model_extension_purpletree_multivendor_sellerpayment->getCurrencySymbol($curency);

		if(isset($invoice_status)){
			if($invoice_status!=2){
				$this->session->data['error_warning'] = $this->language->get('error_subscription_pending');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/view', '', true));
			}
			} 
		

		
		$this->document->setTitle($this->language->get('heading_title'));
	
		 if (isset($this->session->data['error_warning'])) {
			$data['error_warning'] = $this->session->data['error_warning'];

			unset($this->session->data['error_warning']);
		} else {
			$data['error_warning'] = '';
		}
		 
		 $url ='';		
		 $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] , true)
		);
		
		//language
		
		$data['heading_title']=$this->language->get('heading_title');
		$data['column_seller_plan_confirmation']=$this->language->get('column_seller_plan_confirmation');
		$data['entry_short_discription']=$this->language->get('entry_short_discription');
		$data['column_seller_name']=$this->language->get('column_seller_name');
		$data['heading_current_plan']=$this->language->get('heading_current_plan');
		$data['column_started_date']=$this->language->get('column_started_date');
		$data['column_end_date']=$this->language->get('column_end_date');
		$data['column_validity']=$this->language->get('column_validity');
		$data['column_new_plan']=$this->language->get('column_new_plan');
		$data['save_and_generate_invoice']=$this->language->get('save_and_generate_invoice');
		
		$currentplan=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getCurrentPlan($seller_id);			
		
		$result=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getSubscribePlan($plan_id);		
		$current_plan=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getPlanBySeller($seller_id);
		
		if($this->config->get("module_purpletree_multivendor_tax_name")){
			$tax_name=$this->config->get("module_purpletree_multivendor_tax_name");		
			} else {
			$tax_name='';	
			}
			if($this->config->get("module_purpletree_multivendor_tax_value")){
			$tax=$this->config->get("module_purpletree_multivendor_tax_value");		
			} else {
			$tax=0;	
			}
			$current_invoice=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getSellerCurrentPlan($seller_id);
			
			$curr_invoice=array();
			if(!empty($current_invoice)){
			foreach($current_invoice as $value){

			$curr_invoice[$value['code']]=$value['price'];
	
			}
			}

			if($this->config->get("module_purpletree_multivendor_joining_fees")){
			$joining_fee=$result['joining_fee'];
	
			} else {
			$joining_fee=0;	
			}
	
			if($this->config->get("module_purpletree_multivendor_subscription_price")){
			$subscription_price=$result['subscription_price'];	
			
			} else {
			$subscription_price=0;	
			}
			$data['totals']['plan']=array();
			
			$data['subscription_price']=$this->currency->format($subscription_price, $currency_detail['code'], $currency_detail['value']);
	if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){	
	if($start_date!=1){		
			$data['totals']['plan'][]=array(
			'sort_order'=>1,
			'code'=>'joining_fee',
			'title'=>'Joining Fee',
			'value'=>$this->currency->format($joining_fee, $currency_detail['code'], $currency_detail['value'])
			);
	} else { 
	$joining_fee=0;
	}
	} else {

			$data['totals']['plan'][]=array(
			'sort_order'=>1,
			'code'=>'joining_fee',
			'title'=>'Joining Fee',
			'value'=>$this->currency->format($joining_fee, $currency_detail['code'], $currency_detail['value'])
			);
	}	
			  $a_joiningfee = $joining_fee;

			if(isset($currentplan)){
if(!$this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
				$a_joiningfee=$joining_fee-	$current_plan['joining_fee'];
				$data['totals']['plan'][]=array(
				'code'=>'adjustment_Joining_fee',
				'title'=>'Adjustment Joining fee',
				'value'=>$this->currency->format($a_joiningfee, $currency_detail['code'], $currency_detail['value'])
				);	

}

		if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){

			$data['totals']['plan'][]=array(
			'code'=>'subscription_price',
			'title'=>'Subscription Price',
			'value'=>$this->currency->format($subscription_price, $currency_detail['code'], $currency_detail['value'])
			);
			
		} else {
			$subscription_price=$subscription_price-$this->remindPrice($current_plan['start_date'],$current_plan['validity'],$current_plan['subscription_price'],$start_date);
		
			$data['totals']['plan'][]=array(
			'code'=>'adjustment_subscription_price',
			'title'=>'Adjustment Subscription Price',
			'value'=>$this->currency->format($subscription_price, $currency_detail['code'], $currency_detail['value'])
			);

		}		
			$previous_balance=0;
				if($subscription_price<0){
					$previous_balance=$subscription_price;
				}

			}
			$subscription_price=$a_joiningfee+$subscription_price ;
			
			$total_amount= $subscription_price;
			$data['totals']['plan'][]=array(
			'sort_order'=>2,
			'code'=>'sub_total',
			'title'=>'Sub-Total',
			'value'=>$this->currency->format($total_amount, $currency_detail['code'], $currency_detail['value'])
			);	

			$cal_tax=($total_amount*$tax)/100;
			
			$data['totals']['plan'][]=array(
			'sort_order'=>3,
			'code'=>'tax',
			'title'=>$tax_name.' ('.$tax.'%)',
			'value'=>$this->currency->format($cal_tax, $currency_detail['code'], $currency_detail['value'])
			);
			
				$current_invo=0;
	if(!$this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){			
			if(isset($currentplan)){
				if(isset($curr_invoice['previous_balance'])){
				$current_invo=$curr_invoice['previous_balance'];	
				$data['totals']['plan'][]=array(
				'sort_order'=>4,
				'code'=>'previous_balance',
				'title'=>'Previous Balance',
				'value'=>$this->currency->format($current_invo
			, $currency_detail['code'], $currency_detail['value'])
			);
				}
				
			}
	}
		$total=$total_amount+$cal_tax+$current_invo;
			
			$data['totals']['plan'][]=array(
			'sort_order'=>4,
			'code'=>'total',
			'title'=>$this->language->get('text_grand_total'),
			'value'=>$this->currency->format($total, $currency_detail['code'], $currency_detail['value'])
			);
		if(!empty($result)){
			
		$pts_start_date=date('m/d/Y H:i:s');			
 		if($start_date==1){		
		$current_plan_start_date=$this->model_extension_purpletree_multivendor_managesubscriptionplan->getCurrentPlanByPlanId($seller_id,$plan_id);
		if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
		$current_plan_end_date=($current_plan_start_date['new_end_date']!='0000-00-00 00:00:00')?date('m/d/Y H:i:s',strtotime($current_plan_start_date['new_end_date'])):date('m/d/Y H:i:s', strtotime($current_plan_start_date['start_date']. ' + '.$result['validity'].' days'));
		} else {
		$current_plan_end_date=($current_plan_start_date['end_date']!='0000-00-00 00:00:00')?date('m/d/Y H:i:s',strtotime($current_plan_start_date['end_date'])):date('m/d/Y H:i:s', strtotime($current_plan_start_date['start_date']. ' + '.$result['validity'].' days'));	
		}
		$pts_start_date=$current_plan_end_date;
		} 

			$data['newplan'] = array(
				'plan_id'        => $result['plan_id'],
				'plan_name'        => $result['plan_name'],
				'plan_description'  => html_entity_decode($result['plan_description'], ENT_QUOTES, 'UTF-8'),
				'plan_short_description'  => strip_tags(html_entity_decode($result['plan_short_description'], ENT_QUOTES, 'UTF-8')),
				'no_of_product'  => $result['no_of_product'],
				'joining_fee'  => $this->currency->format($result['joining_fee'], $currency_detail['code'], $currency_detail['value']),
				'subscription_price'  =>$this->currency->format($result['subscription_price'], $currency_detail['code'], $currency_detail['value']),
				'price'  =>$result['subscription_price'],
				'validity'  => $result['validity'],
				'start_date'  => date('d/m/Y H:i:s',strtotime($pts_start_date)),
				'end_date'  => date('d/m/Y H:i:s', strtotime($pts_start_date. ' + '.$result['validity'].' days'))
			
			);	
		}
		$data['start_date']=$start_date;
		
		$c_joining_fee = $data['newplan']['joining_fee'];			
		$c_subscription_price = $data['newplan']['subscription_price'];					
						
		$n_joining_fee = $data['newplan']['joining_fee'];			
		$n_subscription_price = $data['newplan']['subscription_price'];

		$data['action'] = $this->url->link('extension/purpletree_multivendor/managesubscriptionplan/addNewPlan', 'user_token=' . $this->session->data['user_token'] . '&seller_id=' . $this->request->get['seller_id'] . $url, true);
		
		$data['seller_id'] = $seller_id;
		$data['plan_id'] = $plan_id;
		$data['start_date'] = $start_date;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/plan_confirm', $data));
	}
	
		public function viewAllPlan() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}
		
		if (!isset($this->request->get['seller_id']) || $this->request->get['seller_id'] == '') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}
		$seller_id = $this->request->get['seller_id'];
		$this->load->language('purpletree_multivendor/managesubscriptionplan');
		$this->load->model('extension/purpletree_multivendor/managesubscriptionplan');
		 $subscribed = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getSubscriptionplan($this->request->get['seller_id']);

		 if ($subscribed == 'none') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}
	
		$this->document->setTitle($this->language->get('heading_title'));
		 if (($this->request->server['REQUEST_METHOD'] == 'POST')  /* && $this->validateForm() */ ) {
				if(isset($this->request->post['subscription_status'])) {			
					$this->model_extension_purpletree_multivendor_managesubscriptionplan->changeSubscription($this->request->post['subscription_status'],$seller_id);
					if(isset($this->request->post['subscription_disable']))
					{
					$this->model_extension_purpletree_multivendor_managesubscriptionplan->changeStatus($this->request->post['subscription_disable'],$seller_id);		
					}
					
					$this->session->data['success'] = $this->language->get('success_subscription_status_changed');
				}
		 }
		  $subscribed = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getSubscriptionplan($this->request->get['seller_id']);
		 if ($subscribed == 'none') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}
		 	$data['subscriptions_status'] = ($subscribed == '1')?"Enabled":"Disabled";
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		$url = '';

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} elseif(isset($this->session->data['error_warning'])){
			$data['error_warning'] = $this->session->data['error_warning'];
			unset($this->session->data['error_warning']);
		} else{
			$data['error_warning'] = '';
		}
		$data['add'] = $this->url->link('extension/purpletree_multivendor/managesubscriptionplan/add', 'user_token=' . $this->session->data['user_token'] .'&seller_id='. $seller_id .'&action=add', true);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$total_featured_product = $this->model_extension_purpletree_multivendor_managesubscriptionplan->sellerTotalFeaturedProduct($seller_id);
		
		$total_category_featured_product = $this->model_extension_purpletree_multivendor_managesubscriptionplan->sellerTotalCategpryFeaturedProduct($seller_id);
		$total_seller_featured_product=0;
		if($total_featured_product!=NULL){
		$total_seller_featured_product=$total_featured_product;
		}	
		$total_seller_category_featured_product=0;
		if($total_category_featured_product!=NULL){
		$total_seller_category_featured_product=$total_category_featured_product;
		}
		$used_products=0;
		if($this->model_extension_purpletree_multivendor_managesubscriptionplan->getsellerProducts($seller_id)){
		$used_products = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getsellerProducts($seller_id);
		}
		
		$data['current_plan'] = array();
		$current_plan=array();
		$current_plan_detail=array();
		
		if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
		$current_plan=array();
		$current_plan = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getCurrentMultiplePlan($seller_id);
		$current_plan_detail = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getCurrentSellerMultiplePlan($seller_id);
		}  else {
		$current_plan = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getCurrentPlan1($seller_id);
		$current_plan_detail = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getCurrentSellerPlan($seller_id);
			
		}
		$data['current_plan']=$current_plan_detail;
		$data['current_plan']['total_featured_product']=$total_seller_featured_product;
		$data['current_plan']['total_category_featured_product']=$total_seller_category_featured_product;
		$data['current_plan']['used_products']=$used_products;

	if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
		$planiddd = array();
		$current_plan_list = array();
		foreach($current_plan as $vvv){
			if($vvv['new_status'] == 1){
				$planiddd[] = $vvv['plan_id'];
				$current_plan_list[] = $vvv;
			}
		}
		$sdsd = array();
		foreach($current_plan as $vvv1){
			if(!in_array($vvv1['plan_id'],$planiddd)) {
				$planiddd[] = $vvv1['plan_id'];
					$current_plan_list[] = $vvv1;
			}
		}
	} else {
		
		$planiddd = array();
		$current_plan_list = array();
		foreach($current_plan as $vvv){
			if($vvv['status'] == 1){
				$planiddd[] = $vvv['plan_id'];
				$current_plan_list[] = $vvv;
			}
		}
		$sdsd = array();
		foreach($current_plan as $vvv1){
			if(!in_array($vvv1['plan_id'],$planiddd)) {
				$planiddd[] = $vvv1['plan_id'];
					$current_plan_list[] = $vvv1;
			}
		}
			
	}
		$currentPlan=array();
		$current_plan=array();
		$current_plan=$current_plan_list;
		$featured_store='No';
		if(!empty($current_plan)){
		foreach($current_plan as $current_key=>$current_value){
		if($current_value['featured_store']){
		$featured_store=$current_value['featured_store']?'Yes':'No';	
		}			
		if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
		$start_date = date('d-m-Y H:i:s', strtotime($current_value['start_date']));
			if($current_value['new_end_date'] == '0000-00-00 00:00:00') {
				$startDate = $current_value['start_date'];
				$validity = $current_value['validity'];
				$end_date = date('d-m-Y H:i:s', strtotime($startDate. ' + '.$validity.' days'));
			} else {
			$end_date=date('d-m-Y H:i:s',strtotime($current_value['new_end_date']));	
			}
		} else {
			$start_date = date('d-m-Y H:i:s', strtotime($current_value['start_date']));
			if($current_value['end_date'] == '0000-00-00 00:00:00') {
				$startDate = $current_value['start_date'];
				$validity = $current_value['validity'];
				$end_date = date('d-m-Y H:i:s', strtotime($startDate. ' + '.$validity.' days'));
			} else {
			$end_date=date('d-m-Y H:i:s',strtotime($current_value['end_date']));	
			}
		}		
			if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
			$status=$current_value['new_status'];					
			} else {
			$status=$current_value['status'];		
			}

			if($status){
			$status='Active';	
			}else {
			$status='Inactive';	
			}
		$invoice_status = $this->model_extension_purpletree_multivendor_managesubscriptionplan->invoice_status($current_value['seller_id'],$current_value['plan_id']);

		$sDate=strtotime($start_date);
		$eDate=strtotime($end_date);
		$cDate=strtotime(date("d-m-Y H:i:s"));
		$activeButton=0;
		if(($sDate <= $cDate && $cDate <= $eDate) && ($status=='Inactive') && ($invoice_status=='Complete')){
			$activeButton=1;
		}

		$data['currentPlans'][]=array(
		'id'=>$current_value['id'],
		'plan_name'=>$current_value['plan_name'],
		'invoice_status'=>$invoice_status,
		'featured_store'=>$featured_store,
		'no_of_product'=>$current_value['no_of_product'],
		'start_date'=>$start_date,
		'end_date'=>$end_date,
		'status'=>$status,
		'no_of_featured_product'=>$current_value['no_of_featured_product'],
		'no_of_category_featured_product'=>$current_value['no_of_category_featured_product'],
		'validity'=>$current_value['validity'],
		'view_plan'  => $this->url->link('extension/purpletree_multivendor/managesubscriptionplan/view', 'user_token=' . $this->session->data['user_token'] .'&seller_id='. $current_value['seller_id'].'&plan_id='.$current_value['plan_id'], true),
		'edit_plan'  => $this->url->link('extension/purpletree_multivendor/managesubscriptionplan/edit', 'user_token=' . $this->session->data['user_token'] .'&seller_id='. $current_value['seller_id'].'&plan_id='.$current_value['plan_id'].'&action=edit&status='.$status, true),
		'active_plan'  => $this->url->link('extension/purpletree_multivendor/managesubscriptionplan/active', 'user_token=' . $this->session->data['user_token'] .'&id='. $current_value['id'].'&seller_id='. $current_value['seller_id'], true),
		'activeButton'=>$activeButton
		);	

			
		}
	} 
	
	$resultsTotal=count($data['currentPlans']);

		$data['subscription_status'] = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getSubscriptionStatus($seller_id);
		$filter_data = array(
			'seller_id'  => $seller_id,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);
		 $results=array();
		 
		 if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
		 $results = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getSellerMultiplePlansList($filter_data);
		 } else {
		$results = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getSellerPlansList($filter_data); 
		 }

		 $data['subscriptions'] = array();
		if(!empty($results)){
		foreach ($results as $result) { 
			$invoice_status = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getInvoiceStatus($result['invoice_id'] );
			
			if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
			if($result['new_status']){
			$status='Active';	
			}else {
			$status='Inactive';	
			}
			} else {
			if($result['status']){
			$status='Active';	
			}else {
			$status='Inactive';	
			}
			}	
		if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
			$enddate=	($result['new_end_date']!='0000-00-00 00:00:00')?date('d/m/Y H:i:s',strtotime($result['new_end_date'])):date('d/m/Y H:i:s', strtotime($result['start_date']. ' + '.$result['validity'].' days'));
		} else {
		$enddate=	($result['end_date']!='0000-00-00 00:00:00')?date('d/m/Y H:i:s',strtotime($result['end_date'])):date('d/m/Y H:i:s', strtotime($result['start_date']. ' + '.$result['validity'].' days'));
		}
		
	/* 	$sDate=strtotime(($result['start_date']!='0000-00-00 00:00:00')?date('d-m-Y',strtotime($result['start_date'])):'');
		$eDate=strtotime(str_replace('/', '-', $enddate));
		$cDate=strtotime(date("d-m-Y"));
		$activeButton=0;
		if(($sDate <= $cDate && $cDate <= $eDate) && ($result['status']=='0') ){
			$activeButton=1;
		} */
			
/* 		
		$sDate=date_create(($result['start_date']!='0000-00-00 00:00:00')?date('d-m-Y',strtotime($result['start_date'])):'');
		$eDate=date_create(str_replace('/', '-', $enddate));
		$cDate=date_create(date("d-m-Y"));
		
		$diff1=date_diff($sDate,$cDate);
		$diff2=date_diff($eDate,$cDate);
		
		$sDiff=$diff1->format("%R%a"); 
		$eDiff= $diff2->format("%R%a"); 
 */
			$data['subscriptions'][] = array(
				'id'        => $result['id'],
				'plan_name'        => $result['plan_name'],
				'reminder'  => $result['reminder'],
				'status'  => $status,
				'invoice_status'  => $invoice_status,
				'start_date'  => ($result['start_date']!='0000-00-00 00:00:00')?date('d/m/Y H:i:s',strtotime($result['start_date'])):'',
				'end_date'        => $enddate,
				'created_date'  =>($result['created_date']!='0000-00-00 00:00:00')?date('d/m/Y H:i:s',strtotime($result['created_date'])):'',
				'modified_date'  =>($result['modified_date']!='0000-00-00 00:00:00')?date('d/m/Y H:i:s',strtotime($result['modified_date'])):'',
				'add_history'  => $this->url->link('extension/purpletree_multivendor/SubscriptionplanInvoice/add', 'user_token=' . $this->session->data['user_token'] .'&invoice_id='. $result['invoice_id'] .'', true),
				'view_invoice'  => $this->url->link('extension/purpletree_multivendor/SubscriptionplanInvoice/view', 'user_token=' . $this->session->data['user_token'] .'&invoice_id='. $result['invoice_id'] .'', true)
				);	
		}  
		}

		$url = '';
		$pagination = new Pagination();
		$pagination->total = $resultsTotal;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/purpletree_multivendor/managesubscriptionplan/view', 'user_token=' . $this->session->data['user_token'] .'&seller_id=' . $this->request->get['seller_id']. $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($resultsTotal) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($resultsTotal - $this->config->get('config_limit_admin'))) ? $resultsTotal : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $resultsTotal, ceil($resultsTotal / $this->config->get('config_limit_admin'))); 
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_list_Seller_Plan_View'] = $this->language->get('text_list_Seller_Plan_View');
		$data['update_subscription_status'] = $this->language->get('update_subscription_status');
		$data['column_Enabled'] = $this->language->get('column_Enabled');
		$data['column_Disabled'] = $this->language->get('column_Disabled');
		$data['button_update'] = $this->language->get('button_update');
		$data['subscription_details'] = $this->language->get('subscription_details');
		$data['column_seller_name'] = $this->language->get('column_seller_name');
		$data['column_plan'] = $this->language->get('column_plan');
		$data['column_allowed_products'] = $this->language->get('column_allowed_products');
		$data['column_used_products'] = $this->language->get('column_used_products');
		$data['column_Start_date'] = $this->language->get('column_Start_date');
		$data['column_End_date'] = $this->language->get('column_End_date');
		$data['column_subscription_status'] = $this->language->get('column_subscription_status');
		$data['text_seller_plan_history'] = $this->language->get('text_seller_plan_history');
		$data['column_id'] = $this->language->get('column_id');
		$data['column_plan'] = $this->language->get('column_plan');
		$data['column_reminder'] = $this->language->get('column_reminder');
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
		$data['text_subscription_plans'] = $this->language->get('text_subscription_plans');
		$data['column_invoice_status'] = $this->language->get('column_invoice_status');
        $data['text_no_results'] = $this->language->get('text_no_results');
		
		$data['text_featured_products'] = $this->language->get('text_featured_products');
		$data['text_featured_store'] = $this->language->get('text_featured_store');
        $data['text_category_featured_products'] = $this->language->get('text_category_featured_products');
        $data['text_disabled_all_products'] = $this->language->get('text_disabled_all_products');
        $data['text_enabled_all_products'] = $this->language->get('text_enabled_all_products');
        $data['button_renewplan'] = $this->language->get('button_renewplan');
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		
		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/subscriptionplan_all', $data));
	}
	
	public function view() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}
		
		if (!isset($this->request->get['seller_id']) || $this->request->get['seller_id'] == '') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}
		if (!isset($this->request->get['plan_id']) || $this->request->get['plan_id'] == '') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}
		$seller_id = $this->request->get['seller_id'];
		$plan_id = $this->request->get['plan_id'];
		$this->load->language('purpletree_multivendor/managesubscriptionplan');
		$this->load->model('extension/purpletree_multivendor/managesubscriptionplan');
		 $subscribed = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getSubscriptionplan($this->request->get['seller_id']);
		 if ($subscribed == 'none') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}
	
		$this->document->setTitle($this->language->get('heading_title'));
		 if (($this->request->server['REQUEST_METHOD'] == 'POST')  /* && $this->validateForm() */ ) {
				if(isset($this->request->post['subscription_status'])) {			
					$this->model_extension_purpletree_multivendor_managesubscriptionplan->changeSubscription($this->request->post['subscription_status'],$seller_id);
					if(isset($this->request->post['subscription_disable']))
					{
					$this->model_extension_purpletree_multivendor_managesubscriptionplan->changeStatus($this->request->post['subscription_disable'],$seller_id);		
					}
					
					$this->session->data['success'] = $this->language->get('success_subscription_status_changed');
				}
		 }
		  $subscribed = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getSubscriptionplan($this->request->get['seller_id']);
		 if ($subscribed == 'none') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'], true));
		}
		 	$data['subscriptions_status'] = ($subscribed == '1')?"Enabled":"Disabled";
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		$url = '';

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} elseif(isset($this->session->data['error_warning'])){
			$data['error_warning'] = $this->session->data['error_warning'];
			unset($this->session->data['error_warning']);
		} else{
			$data['error_warning'] = '';
		}
		$data['add'] = $this->url->link('extension/purpletree_multivendor/managesubscriptionplan/add', 'user_token=' . $this->session->data['user_token'] .'&seller_id='. $seller_id .'', true);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$total_featured_product = $this->model_extension_purpletree_multivendor_managesubscriptionplan->sellerTotalFeaturedProduct($seller_id);
		
		$total_category_featured_product = $this->model_extension_purpletree_multivendor_managesubscriptionplan->sellerTotalCategpryFeaturedProduct($seller_id);
		$total_seller_featured_product=0;
		if($total_featured_product!=NULL){
		$total_seller_featured_product=$total_featured_product;
		}	
		$total_seller_category_featured_product=0;
		if($total_category_featured_product!=NULL){
		$total_seller_category_featured_product=$total_category_featured_product;
		}
		
		$data['current_plan'] = array();
		//$current_plan=array();
		$current_plan = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getCurrentPlan($seller_id);
		/* if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
			$current_plan=array();
		$current_plan = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getCurrentMultiplePlan($seller_id);
		} 
 		$currentPlan=array();
		if(!empty($current_plan)){
		foreach($current_plan as $current_key=>$current_value){
		if($current_value['featured_store']){
		$featured_store=$current_value['featured_store']?'Yes':'No';	
		}			
		$used_products = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getsellerProducts($seller_id);

		$start_date = date('d-m-Y', strtotime($current_value['start_date']));
			if($current_value['end_date'] == '0000-00-00 00:00:00') {
				$startDate = $current_value['start_date'];
				$validity = $current_value['validity'];
				$end_date = date('d-m-Y', strtotime($startDate. ' + '.$validity.' days'));
			} else {
			$end_date=date('d-m-Y',strtotime($current_value['end_date']));	
			}
			
		$data['currentPlan'][]=array(
		'plan_name'=>$current_value['plan_name'],
		'featured_store'=>$featured_store,
		'no_of_product'=>$current_value['no_of_product'],
		'start_date'=>$start_date,
		'end_date'=>$end_date,
		'no_of_featured_product'=>$current_value['no_of_featured_product'],
		'no_of_category_featured_product'=>$current_value['no_of_category_featured_product'],
		'validity'=>$current_value['validity'],
		);	
			
		}
	} */
/* $data['currentPlan']['total_featured_product']=$total_seller_featured_product;
		$data['currentPlan']['total_category_featured_product']=$total_seller_category_featured_product; */
// echo "<pre>";
// print_r($data['currentPlan']);
// die;
/* 		if($current_plan['featured_store']){
		$current_plan['featured_store']=$current_plan['featured_store']?'Yes':'No';	
		}
		
		if(!empty($current_plan)) {
		$current_plan['used_products'] = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getsellerProducts($seller_id);
				$current_plan['start_date'] = date('d-m-Y', strtotime($current_plan['start_date']));
			if($current_plan['end_date'] == '0000-00-00 00:00:00') {
				$startDate = $current_plan['start_date'];
				$validity = $current_plan['validity'];
				$current_plan['end_date'] = date('d-m-Y', strtotime($startDate. ' + '.$validity.' days'));
			}
			$data['current_plan'] = $current_plan;
		}
		$data['current_plan']['total_featured_product']=$total_seller_featured_product;
		$data['current_plan']['total_category_featured_product']=$total_seller_category_featured_product; */
		
		$data['subscription_status'] = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getSubscriptionStatus($seller_id);
		$filter_data = array(
			'seller_id'  => $seller_id,
			'plan_id'  => $plan_id,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);
		 $results=array();
		 $results = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getSellerInvoiceList($filter_data);
		 $resultsTotal = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getTotalSellerPlansList($filter_data);
		 if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
		 $results=array();
		 $results = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getSellerInvoiceList2($filter_data);
		  $resultsTotal = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getSellerInvoiceList2pagin($filter_data);
		 }

		 $data['subscriptions'] = array();
		if(!empty($results)){
		foreach ($results as $result) { 
			$invoice_status = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getInvoiceStatus($result['invoice_id'] );
			
			if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
			if($result['new_status']){
			$status='Active';	
			}else {
			$status='Inactive';	
			}
			} else {
			if($result['status']){
			$status='Active';	
			}else {
			$status='Inactive';	
			}
			}			
			if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
			if($result['new_end_date']!='0000-00-00 00:00:00'){
			$end_date=	date('d/m/Y H:i:s',strtotime($result['new_end_date']));	
			} else {
			$end_date=date('d/m/Y H:i:s', strtotime($result['start_date']. ' + '.$result['validity'].' days'));
			}
			} else {
			if($result['end_date']!='0000-00-00 00:00:00'){
			$end_date=	date('d/m/Y H:i:s',strtotime($result['end_date']));	
			} else {
			$end_date=date('d/m/Y H:i:s', strtotime($result['start_date']. ' + '.$result['validity'].' days'));
			}	
			}
			$reminder=$result['reminder']+$result['reminder1']+$result['reminder2'];
			$data['subscriptions'][] = array(
				'id'        => $result['id'],
				'plan_name'        => $result['plan_name'],
				'reminder'  => $reminder,
				'status'  => $status,
				'invoice_status'  => $invoice_status,
				'start_date'  => ($result['start_date']!='0000-00-00 00:00:00')?date('d/m/Y H:i:s',strtotime($result['start_date'])):'',
				'end_date'        => $end_date,
				'created_date'  =>($result['created_date']!='0000-00-00 00:00:00')?date('d/m/Y H:i:s',strtotime($result['created_date'])):'',
				'modified_date'  =>($result['modified_date']!='0000-00-00 00:00:00')?date('d/m/Y H:i:s',strtotime($result['modified_date'])):'',
				'add_history'  => $this->url->link('extension/purpletree_multivendor/SubscriptionplanInvoice/add', 'user_token=' . $this->session->data['user_token'] .'&invoice_id='. $result['invoice_id'] .'', true),
				'view_invoice'  => $this->url->link('extension/purpletree_multivendor/SubscriptionplanInvoice/view', 'user_token=' . $this->session->data['user_token'] .'&invoice_id='. $result['invoice_id'] .'', true)
				);
		}  
		}
		//$resultsTotal=count($data['subscriptions']);
		$url = '';
		$pagination = new Pagination();
		$pagination->total = $resultsTotal;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/purpletree_multivendor/managesubscriptionplan/view', 'user_token=' . $this->session->data['user_token'] .'&seller_id=' . $this->request->get['seller_id'].'&plan_id=' . $this->request->get['plan_id']. $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($resultsTotal) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($resultsTotal - $this->config->get('config_limit_admin'))) ? $resultsTotal : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $resultsTotal, ceil($resultsTotal / $this->config->get('config_limit_admin'))); 
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_list_Seller_Plan_View'] = $this->language->get('text_list_Seller_Plan_View');
		$data['update_subscription_status'] = $this->language->get('update_subscription_status');
		$data['column_Enabled'] = $this->language->get('column_Enabled');
		$data['column_Disabled'] = $this->language->get('column_Disabled');
		$data['button_update'] = $this->language->get('button_update');
		$data['subscription_details'] = $this->language->get('subscription_details');
		$data['column_seller_name'] = $this->language->get('column_seller_name');
		$data['column_plan'] = $this->language->get('column_plan');
		$data['column_allowed_products'] = $this->language->get('column_allowed_products');
		$data['column_used_products'] = $this->language->get('column_used_products');
		$data['column_Start_date'] = $this->language->get('column_Start_date');
		$data['column_End_date'] = $this->language->get('column_End_date');
		$data['column_subscription_status'] = $this->language->get('column_subscription_status');
		$data['text_seller_plan_history'] = $this->language->get('text_seller_plan_history');
		$data['column_id'] = $this->language->get('column_id');
		$data['column_plan'] = $this->language->get('column_plan');
		$data['column_reminder'] = $this->language->get('column_reminder');
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
		
		$data['text_featured_products'] = $this->language->get('text_featured_products');
		$data['text_featured_store'] = $this->language->get('text_featured_store');
        $data['text_category_featured_products'] = $this->language->get('text_category_featured_products');
        $data['text_disabled_all_products'] = $this->language->get('text_disabled_all_products');
        $data['text_enabled_all_products'] = $this->language->get('text_enabled_all_products');
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		
		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/subsacriptionplan_view', $data));
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		$data['add'] = $this->url->link('extension/purpletree_multivendor/managesubscriptionplan/add', 'user_token=' . $this->session->data['user_token'] . $url, true);
		$data['subscription_plan'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		 $resultsTotal = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getManageSubscriptionPlanTotal($filter_data);
		 $results = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getManageSubscriptionPlan($filter_data);
		//echo"<pre>";print_r($results);die;
		if(!empty($results)){
		foreach ($results as $result) {
			$subscribed = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getSubscriptionplan($result['seller_id']);
			$customerStauts = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getCustomerStatus($result['seller_id']);
			if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
			$no_of_active_plan = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getNoOfActiveMultiplePlan($result['seller_id']);
			if(!$no_of_active_plan){
			$no_of_active_plan=0;	
			}
			} else {
			$no_of_active_plan = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getNoOfActivePlan($result['seller_id']);
			if(!$no_of_active_plan){
			$no_of_active_plan=0;	
			}
			}
			$data['subscriptions'][] = array(
			    'plan_id'         => $result['plan_id'],
				'store_name'  		=> $result['seller_name'],
				'no_of_active_plan' => $no_of_active_plan,
				'status'  			=> ($subscribed)?'Enabled':'Disabled',
				'customer_status'   => $customerStauts,
				'view'        		=> $this->url->link('extension/purpletree_multivendor/managesubscriptionplan/viewallplan', 'user_token=' . $this->session->data['user_token'] . '&seller_id=' . $result['seller_id'] . $url, true)
			);
		} 
		}
		
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

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] . '&sort=name' . $url, true);
		$data['sort_sort_order'] = $this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] . '&sort=sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $resultsTotal;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($resultsTotal) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($resultsTotal - $this->config->get('config_limit_admin'))) ? $resultsTotal : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $resultsTotal, ceil($resultsTotal / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;
        $data['heading_title'] = $this->language->get('heading_title');
		$data['text_list'] = $this->language->get('text_list');
		$data['column_seller_name'] = $this->language->get('column_seller_name');
		$data['entry_current_plan'] = $this->language->get('entry_current_plan');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_Start_date'] = $this->language->get('column_Start_date');
		$data['column_End_date'] = $this->language->get('column_End_date');
		$data['column_action'] = $this->language->get('column_action');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['column_no_of_active_plan'] = $this->language->get('column_no_of_active_plan');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/manage_subscription_plan_list', $data));
	}

	protected function getForm() {

		if (!isset($this->request->get['seller_id']) || $this->request->get['seller_id'] =='') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/viewallplan', 'user_token=' . $this->session->data['user_token'], true));
		}

		if (!isset($this->request->get['action']) || $this->request->get['action'] =='') {
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/viewallplan', 'user_token=' . $this->session->data['user_token'], true));
		}	

	if(isset($this->request->get['action'])){	
		if($this->request->get['action']=='edit'){
			if (!isset($this->request->get['status']) || $this->request->get['status'] =='') {
					$this->response->redirect($this->url->link('extension/purpletree_multivendor/managesubscriptionplan/viewallplan', 'user_token=' . $this->session->data['user_token'], true));
			}	
		}
	}
		$data['plan_status']='';
		if(isset($this->request->get['status'])){
		$data['plan_status']=$this->request->get['status'];		
		}
		
		$seller_id=$this->request->get['seller_id'];
		$data['seller_id']=$this->request->get['seller_id'];
		$plan_id='';
		if(isset($this->request->get['plan_id'])){
		$plan_id=$this->request->get['plan_id'];
			
		}
		$current_plan = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getPlanById($seller_id,$plan_id) ;
		
		$active_plan = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getActivePlan($seller_id,$plan_id) ;
		
		if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){
		$active_plan = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getMultipleActivePlan($seller_id,$plan_id) ;
		}

		if(!empty($current_plan)){
			foreach($current_plan AS $keydd=>$values){
			$data['current_plan_name'][$values['plan_id']]=$values['plan_name'];
			}
		}
		
if($this->request->get['action']=='add'){
	$data['current_plan_name']=array();
}

$data['action']=$this->request->get['action'];

		 $data['seller_name'] = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getSellerName($seller_id);
		//die;
		$data['text_form'] = !isset($this->request->get['plan_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		if (isset($this->error['error_select_plan'])) {
			$data['error_select_plan'] = $this->error['error_select_plan'];
		} else {
			$data['error_select_plan'] = '';
		}
		if (isset($this->session->data['error_warning'])) {
			$data['error_warning'] = $this->session->data['error_warning'];
			unset($this->session->data['error_warning']);
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/purpletree_multivendor/managesubscriptionplan', 'user_token=' . $this->session->data['user_token'] , true)
		);
		//Language 
		$data['heading_title']=$this->language->get('heading_title');
		$data['column_seller_name']=$this->language->get('column_seller_name');
		$data['entry_current_plan']=$this->language->get('entry_current_plan');
		$data['entry_select_plan']=$this->language->get('entry_select_plan');
		$data['entry_current_plan']=$this->language->get('entry_current_plan');
		$data['plan_name']=$this->language->get('plan_name');
		$data['entry_start_date']=$this->language->get('entry_start_date');
		$data['entry_start_now']=$this->language->get('entry_start_now');
		$data['start_at_end_of_current_plan']=$this->language->get('start_at_end_of_current_plan');
		$data['column_subscription_status']=$this->language->get('column_subscription_status');
		$data['text_disabled']=$this->language->get('text_disabled');
		$data['text_enabled']=$this->language->get('text_enabled');
		$data['button_save']=$this->language->get('button_save');
		$data['button_cancel']=$this->language->get('button_cancel');
		$this->load->language('purpletree_multivendor/managesubscriptionplan');
        $url='';
		
        $data['cancel'] = $this->url->link('extension/purpletree_multivendor/managesubscriptionplan/view','user_token=' . $this->session->data['user_token'] . '&seller_id=' . $this->request->get['seller_id'] . $url, true);
	
		$data['user_token'] = $this->session->data['user_token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/manage_subscription_plan_form', $data));
	}
	
	public function validateconfirm() {
			if (isset($this->request->get['plan_id']) && $this->request->get['plan_id'] != '' && isset($this->request->get['start_date']) && $this->request->get['start_date'] != '' && isset($this->request->get['status']) && $this->request->get['status'] != '') {
				
			}
			return true;
	}
	public function autocomplete() {

		$json = array();
		if (isset($this->request->get['filter_store_name'])) {
			$this->load->model('extension/purpletree_multivendor/managesubscriptionplan');

			$filter_data = array(
				'filter_store_name' => $this->request->get['filter_store_name'],
				'sort'        => 'store_name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getStoreName($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'seller_id' => $result['seller_id'],
					'store_name'        => strip_tags(html_entity_decode($result['store_name'], ENT_QUOTES, 'UTF-8'))
				);
			}
				$sort_order = array();

				foreach ($json as $key => $value) {
					$sort_order[$key] = $value['store_name'];
				}

				array_multisort($sort_order, SORT_ASC, $json);
			
				
		}
		$seller_id='';
		if(isset($this->request->get['seller_id'])){
		$seller_id=	$this->request->get['seller_id'];	
		}

		if (isset($this->request->get['filter_plan_name'])) {
			$this->load->model('extension/purpletree_multivendor/managesubscriptionplan');

			$filter_data = array(
				'filter_plan_name' => $this->request->get['filter_plan_name'],
				'seller_id' => $seller_id,
				'sort'        => 'plan_name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_extension_purpletree_multivendor_managesubscriptionplan->getPlanName($filter_data);
			if(!empty($results)){
			foreach ($results as $result) {
				$json[] = array(
					'plan_id' => $result['plan_id'],
					'plan_name'        => strip_tags(html_entity_decode($result['plan_name'], ENT_QUOTES, 'UTF-8'))
				);
			}
			}else {
				$json[] = array(
					'plan_id' => '',
					'plan_name'=> 'Plan not found'
				);	
			}
				$sort_order = array();

				foreach ($json as $key => $value) {
					$sort_order[$key] = $value['plan_name'];
				}
				

				array_multisort($sort_order, SORT_ASC, $json);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
		public function remindPrice($start_date,$validity,$s_price,$startt_when){
		$price=0;
		if($startt_when == '1') {
			return $price;
		}
		$date1=date_create(date('Y-m-d H:i:s'));
		$date2=date_create(date('Y-m-d H:i:s',strtotime($start_date)));
		$diff=date_diff($date2,$date1);
	
		$r_date=$validity-((int)$diff->format("%a"));
		if($r_date>=0){
		$price=($s_price*$r_date)/$validity;
		}
		return $price;
		}
}
