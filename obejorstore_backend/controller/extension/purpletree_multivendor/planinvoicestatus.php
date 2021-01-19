<?php
class ControllerExtensionPurpletreeMultivendorPlaninvoicestatus extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');				
			}
		$this->load->language('purpletree_multivendor/planinvoicestatus');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/planinvoicestatus');

		$this->getList();
		
	} 

	public function add() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/planinvoicestatus', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
		
		$this->load->language('purpletree_multivendor/planinvoicestatus');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/planinvoicestatus');
         
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()){
 		
			$this->model_extension_purpletree_multivendor_planinvoicestatus->addSubscriptionplaninvoicestatus($this->request->post);
           $this->session->data['success'] = $this->language->get('text_success_add');

			$url = '';
			$this->response->redirect($this->url->link('extension/purpletree_multivendor/planinvoicestatus', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}
     
		$this->getForm();
	}
	public function edit() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/planinvoicestatus', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
		$this->load->language('purpletree_multivendor/planinvoicestatus');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/planinvoicestatus');
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()){
			$this->model_extension_purpletree_multivendor_planinvoicestatus->editSubscriptionplaninvoicestatus($this->request->get['status_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			$this->response->redirect($this->url->link('extension/purpletree_multivendor/planinvoicestatus', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/planinvoicestatus', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}

		$this->load->language('purpletree_multivendor/planinvoicestatus');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/planinvoicestatus');   
		
		if (isset($this->request->post['selected'])){
			
			foreach ($this->request->post['selected'] as $status_id) {
					
				if ($status_id != 1 && $status_id != 2){
					$this->model_extension_purpletree_multivendor_planinvoicestatus->deleteSubscriptionplaninvoicestatus($status_id);
					$this->session->data['success'] = $this->language->get('text_success_delete');
				}	
			
			}
			$this->session->data['success'] = $this->language->get('text_success_delete');

			$url = '';

			$this->response->redirect($this->url->link('extension/purpletree_multivendor/planinvoicestatus', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getList();
	}	

	protected function getList() {	
		

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
			'href' => $this->url->link('extension/purpletree_multivendor/planinvoicestatus', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		$data['add'] = $this->url->link('extension/purpletree_multivendor/planinvoicestatus/add', 'user_token=' . $this->session->data['user_token'] . $url, true);
		$data['delete'] = $this->url->link('extension/purpletree_multivendor/planinvoicestatus/delete', 'user_token=' . $this->session->data['user_token'] . $url, true);	
        
        $invoice_data = array(				
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
		);
		
		$subscriptionplaninvoicestatus_total = $this->model_extension_purpletree_multivendor_planinvoicestatus->getTotalSubscriptionplaninvoicestatus();		
          $results = array();
          $data['planinvoice_statuss'] = array();
		  $results = $this->model_extension_purpletree_multivendor_planinvoicestatus->getSubscriptionplaninvoicestatus($invoice_data);
		  		  if(!empty($results)) {
		 foreach ($results as $result) {	
						
			$data['planinvoice_statuss'][] = array(
			    'status_id'    => $result['status_id'],		
				'created_date' => date($this->language->get('date_format_short'), strtotime($result['created_date'])),
				'modified_date' =>  date($this->language->get('date_format_short'), strtotime($result['modified_date'])),
				'invoice_status'         =>$result['invoice_status'] ,			
				'edit'           => $this->url->link('extension/purpletree_multivendor/planinvoicestatus/edit', 'user_token=' . $this->session->data['user_token'] . '&status_id=' . $result['status_id'] . $url, true)
			);
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

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
      
		$pagination = new Pagination();
		$pagination->total = $subscriptionplaninvoicestatus_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/purpletree_multivendor/planinvoicestatus', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($subscriptionplaninvoicestatus_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($subscriptionplaninvoicestatus_total - $this->config->get('config_limit_admin'))) ? $subscriptionplaninvoicestatus_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $subscriptionplaninvoicestatus_total, ceil($subscriptionplaninvoicestatus_total / $this->config->get('config_limit_admin')));
        
        $data['text_list'] = $this->language->get('text_list');
		$data['entry_status_name'] = $this->language->get('entry_status_name');
		$data['entry_created_date'] = $this->language->get('entry_created_date');
		$data['entry_modified_date'] = $this->language->get('entry_modified_date');
		$data['column_status_name'] = $this->language->get('column_status_name');
		$data['column_created_date'] = $this->language->get('column_created_date');
		$data['column_created_date'] = $this->language->get('column_created_date');
		$data['column_action'] = $this->language->get('column_action');		
		$data['button_filter'] = $this->language->get('button_filter'); 
		$data['button_add_new_status'] = $this->language->get('button_add_new_status');		
		$data['order'] = $order;        		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
        $this->response->setOutput($this->load->view('extension/purpletree_multivendor/planinvoicestatus_list', $data));
	}

	protected function getForm() {	
		
		$data['text_form'] = !isset($this->request->get['status_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		$data['user_token'] = $this->session->data['user_token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['error_invoice_status1'])) {
			$data['error_invoice_status'] = $this->error['error_invoice_status1'];
		} else {
			$data['error_invoice_status'] = array();
		}
		
		$url = '';

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/purpletree_multivendor/planinvoicestatus', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		if (!isset($this->request->get['status_id'])) {
			$data['action'] = $this->url->link('extension/purpletree_multivendor/planinvoicestatus/add', 'user_token=' . $this->session->data['user_token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('extension/purpletree_multivendor/planinvoicestatus/edit', 'user_token=' . $this->session->data['user_token'] . $url, true);
		}

		$data['cancel'] = $this->url->link('extension/purpletree_multivendor/planinvoicestatus', 'user_token=' . $this->session->data['user_token'] . $url, true);
		
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();
			
     		
      if (isset($this->request->post['subscriptionplan_invoice_status'])) {
			$data['subscriptionplan_invoice_status'] = $this->request->post['subscriptionplan_invoice_status'];
		} elseif (isset($this->request->get['status_id'])) {
			$data['subscriptionplan_invoice_status'] = $this->model_extension_purpletree_multivendor_planinvoicestatus->getInvoicestatus($this->request->get['status_id']);
		} else {
			$data['subscriptionplan_invoice_status'] = array();
		}
		
		$filter_data = array(
			'sort'  => 'cf.sort_order',
			'order' => 'ASC'
		);	
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/planinvoicestatus_form', $data));
	}

   protected function validateForm() {	
	
    foreach ($this->request->post['subscriptionplan_invoice_status'] as $language_id => $value) {
	
		if(utf8_strlen($value['invoice_status'])  < 1){
			$this->error['error_invoice_status1'][$language_id ] = $this->language->get('error_invoice_status');
			$this->error['warning'] = $this->language->get('error_warning');
			
		}  


   }	  
 
		return !$this->error;
	}
	

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'extension/purpletree_multivendor/planinvoicestatus')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	
	
}
	
?>
