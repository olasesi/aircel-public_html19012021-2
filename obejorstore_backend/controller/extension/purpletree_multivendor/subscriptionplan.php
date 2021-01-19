<?php
class ControllerExtensionPurpletreeMultivendorSubscriptionplan extends Controller {
	private $error = array();

	public function index() {		
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');				
			}
		
		$this->load->language('purpletree_multivendor/subcriptionplan');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/subcriptionplan');

		$this->getList();
	}

	public function add() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/subscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
			$this->load->language('purpletree_multivendor/subcriptionplan');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/subcriptionplan');
			
		 if (($this->request->server['REQUEST_METHOD'] == 'POST')  && $this->validateForm() ) {
			 
			 if(!isset($this->request->post['default_subscription_plan'])){
				$this->request->post['default_subscription_plan']=0;	
			}
	
			$this->model_extension_purpletree_multivendor_subcriptionplan->addSubscriptionPlan($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('extension/purpletree_multivendor/subscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true));
		} 
		$this->getForm();
	}

	public function edit() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/subscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
		$this->load->language('purpletree_multivendor/subcriptionplan');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/subcriptionplan');

		if (($this->request->server['REQUEST_METHOD'] == 'POST')  && $this->validateForm() ) {
			//echo "<pre>";
			//print_r($this->request->post); die;
			if(!isset($this->request->post['default_subscription_plan'])){
				$this->request->post['default_subscription_plan']=0;	
			}
			$this->model_extension_purpletree_multivendor_subcriptionplan->editSubscriptionPlan($this->request->get['plan_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('extension/purpletree_multivendor/subscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/subscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
		$this->load->language('purpletree_multivendor/subcriptionplan');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/subcriptionplan');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {

			$url = '';
			
		     foreach ($this->request->post['selected'] as $sub_plan_id) {
				
				$check_plan = $this->model_extension_purpletree_multivendor_subcriptionplan->checkSubscriptionPlan($sub_plan_id);
			
            if(!empty($check_plan)){
			  $this->session->data['error_warning'] = $this->language->get('error_permission');;
		    }else{
			try {     
				
				$this->model_extension_purpletree_multivendor_subcriptionplan->deleteSubscriptionPlan($sub_plan_id);		

			  $this->session->data['success'] = $this->language->get('text_success');
		    }
	       catch (Exception $e) {
			$this->session->data['error_warning'] = $e->getMessage();
		  }
			
		}
			 
	}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->response->redirect($this->url->link('extension/purpletree_multivendor/subscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getList();
	}
	protected function getList() {

		$url = '';

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/purpletree_multivendor/subscription_plan_list', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		$data['add'] = $this->url->link('extension/purpletree_multivendor/subscriptionplan/add', 'user_token=' . $this->session->data['user_token'] . $url, true);
		$data['delete'] = $this->url->link('extension/purpletree_multivendor/subscriptionplan/delete', 'user_token=' . $this->session->data['user_token'] . $url, true);
		$data['repair'] = $this->url->link('extension/purpletree_multivendor/subscriptionplan/repair', 'user_token=' . $this->session->data['user_token'] . $url, true);

		$data['subscription_plan'] = array();

		$category_total ='';// $this->model_extension_purpletree_multivendor_subcriptionplan->getTotalCategories();

		 $results = $this->model_extension_purpletree_multivendor_subcriptionplan->getSubscriptionPlan();
		 
		foreach ($results as $result) {
		 if($result['default_subscription_plan']==1){
				$result['plan_name']=$result['plan_name'].' <b>(Default)</b>';	
			}
			$data['subscriptions'][] = array(
				'plan_id' => $result['plan_id'],
				'plan_name'        => $result['plan_name'],
				'status'       	   => ($result['status'])?"Enabled":"Disabled",
				'no_of_product'    => $result['no_of_product'],
				'no_of_featured_product'  => $result['no_of_featured_product'],	
				'featured_store'   => ($result['featured_store'])?"Enabled":"Disabled",
				'joining_fee'  	    => $result['joining_fee'],
				'subscription_price'  => $result['subscription_price'],
				'no_of_product'  => $result['no_of_product'],
				'validity'  => $result['validity'],
				'edit'        => $this->url->link('extension/purpletree_multivendor/subscriptionplan/edit', 'user_token=' . $this->session->data['user_token'] . '&plan_id=' . $result['plan_id'] . $url, true),
				'delete'      => $this->url->link('extension/purpletree_multivendor/subscriptionplan/delete', 'user_token=' . $this->session->data['user_token'] . '&plan_id=' . $result['plan_id'] . $url, true)
			);
		} 

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

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/subscription_plan_list', $data));
	}

	protected function getForm() {
		$data['text_form'] = !isset($this->request->get['plan_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}



		if (isset($this->error['no_of_product'])) {
			$data['error_no_of_product'] = $this->error['no_of_product'];
		} else {
			$data['error_no_of_product'] = '';
		}
		
			if (isset($this->error['joining_fee'])) {
			$data['error_joining_fee'] = $this->error['joining_fee'];
		} else {
			$data['error_joining_fee'] = '';
		}
		
			if (isset($this->error['subscription_price'])) {
			$data['error_subscription_price'] = $this->error['subscription_price'];
		} else {
			$data['error_subscription_price'] = '';
		}
		
			if (isset($this->error['validity'])) {
			$data['error_validity'] = $this->error['validity'];
		} else {
			$data['error_validity'] = '';
		}

	    if (isset($this->error['no_of_featured_product'])) {
				$data['error_no_of_featured_product'] = $this->error['no_of_featured_product'];
			} else {
				$data['error_no_of_featured_product'] = '';
			}		

		if (isset($this->error['no_of_category_featured_product'])) {
			$data['error_no_of_category_featured_product'] = $this->error['no_of_category_featured_product'];
	     } else {
			$data['error_no_of_category_featured_product'] = '';
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
			'href' => $this->url->link('extension/purpletree_multivendor/subscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);
		$this->load->language('purpletree_multivendor/subcriptionplan');
		$data['entry_joinning_fee']=$this->language->get('entry_joinning_fee');
		$data['entry_default_subscription_plan']=$this->language->get('entry_default_subscription_plan');

		if (!isset($this->request->get['plan_id'])) {
			$data['action'] = $this->url->link('extension/purpletree_multivendor/subscriptionplan/add', 'user_token=' . $this->session->data['user_token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('extension/purpletree_multivendor/subscriptionplan/edit', 'user_token=' . $this->session->data['user_token'] . '&plan_id=' . $this->request->get['plan_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('extension/purpletree_multivendor/subscriptionplan', 'user_token=' . $this->session->data['user_token'] . $url, true);

	
		$data['user_token'] = $this->session->data['user_token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['subscription'])) {
			$data['subscription'] = $this->request->post['subscription'];
		} elseif (isset($this->request->get['plan_id'])) {
			$data['subscription'] = $this->model_extension_purpletree_multivendor_subcriptionplan->getplanDescriptions($this->request->get['plan_id']);
		} else {
			$data['subscription'] = array();
		}
		
		if (isset($this->request->get['plan_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$plan_info = $this->model_extension_purpletree_multivendor_subcriptionplan->getplan($this->request->get['plan_id']);
		}

		if (isset($this->request->post['no_of_product'])) {
			$data['no_of_product'] = $this->request->post['no_of_product'];
		} elseif (!empty($plan_info)) {
			$data['no_of_product'] = $plan_info['no_of_product'];
		} else {
			$data['no_of_product'] = '';
		}
		if (isset($this->request->post['default_subscription_plan'])) {
			$data['default_subscription_plan'] = $this->request->post['default_subscription_plan'];
		} elseif (!empty($plan_info)) {
			$data['default_subscription_plan'] = $plan_info['default_subscription_plan'];
		} else {
			$data['default_subscription_plan'] = '';
		}

	if (isset($this->request->post['joining_fee'])) {
			$data['joining_fee'] = $this->request->post['joining_fee'];
		} elseif (!empty($plan_info)) {
			$data['joining_fee'] = $plan_info['joining_fee'];
		} else {
			$data['joining_fee'] = '';
		}
		
			
			
			if (isset($this->request->post['subscription_price'])) {
			$data['subscription_price'] = $this->request->post['subscription_price'];
		} elseif (!empty($plan_info)) {
			$data['subscription_price'] = $plan_info['subscription_price'];
		} else {
			$data['subscription_price'] = '';
		}
		
			if (isset($this->request->post['validity'])) {
			$data['validity'] = $this->request->post['validity'];
		} elseif (!empty($plan_info)) {
			$data['validity'] = $plan_info['validity'];
		} else {
			$data['validity'] = '';
		}
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($plan_info)) {
			$data['status'] = $plan_info['status'];
		} else {
			$data['status'] = '';
		}
		if (isset($this->request->post['no_of_featured_product'])) {
			 $data['no_of_featured_product'] = $this->request->post['no_of_featured_product'];
		} elseif (!empty($plan_info)) {
				$data['no_of_featured_product'] = $plan_info['no_of_featured_product'];
		} else {
				$data['no_of_featured_product'] = '';
		}
		
		if (isset($this->request->post['featured_store'])) {
			$data['featured_store'] = $this->request->post['featured_store'];
		} elseif (!empty($plan_info)) {
			$data['featured_store'] = $plan_info['featured_store'];
		} else {
			$data['featured_store'] = '';
		}
		
		if (isset($this->request->post['no_of_category_featured_product'])) {
		 $data['no_of_category_featured_product'] = $this->request->post['no_of_category_featured_product'];
		} elseif (!empty($plan_info)) {
			$data['no_of_category_featured_product'] = $plan_info['no_of_category_featured_product'];
		} else {
			$data['no_of_category_featured_product'] = '';
		}				
		
		

	
/* 		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($category_info)) {
			$data['sort_order'] = $category_info['sort_order'];
		} else {
			$data['sort_order'] = 0;
		} */
        $data['ver']=VERSION;
		if($data['ver']=='3.1.0.0_b'){
		$this->document->addScript('view/javascript/ckeditor/ckeditor.js');
		$this->document->addScript('view/javascript/ckeditor/adapters/jquery.js');
		}
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/subscription_plan_form', $data));
	}

	protected function validateForm() {
		foreach ($this->request->post['subscription'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 1) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
			
		}
		   if( ! filter_var($this->request->post['validity'], FILTER_VALIDATE_INT)) {
			   $this->error['validity']= $this->language->get('error_validity');
		   }
		   if( ! filter_var($this->request->post['no_of_product'], FILTER_VALIDATE_INT) && $this->request->post['no_of_product'] != '0') {
			   $this->error['no_of_product']= "Must be numeric value";
		   }
		   if( ! filter_var($this->request->post['joining_fee'], FILTER_VALIDATE_FLOAT) && $this->request->post['joining_fee'] != '0') { 
					$this->error['joining_fee']= "Must be numeric or decimal value";
			}
			 if( ! filter_var($this->request->post['no_of_featured_product'], FILTER_VALIDATE_INT) && $this->request->post['no_of_featured_product'] != '0') {
			   $this->error['no_of_featured_product']= $this->language->get('error_no_of_featured_product');
		    }
			if( ! filter_var($this->request->post['no_of_category_featured_product'], FILTER_VALIDATE_INT) && $this->request->post['no_of_category_featured_product'] != '0') {
			   $this->error['no_of_category_featured_product']= $this->language->get('error_no_of_category_featured_product');
		    }	
			
			if( ! filter_var($this->request->post['subscription_price'], FILTER_VALIDATE_FLOAT) && $this->request->post['subscription_price'] != '0') {
					$this->error['subscription_price']= "Must be numeric or decimal value";
			}
		    if ((utf8_strlen($this->request->post['no_of_product']) < 1) || (utf8_strlen($this->request->post['no_of_product']) > 255)) {
				$this->error['no_of_product']= $this->language->get('error_no_of_product');
			}
			
			if ((utf8_strlen($this->request->post['joining_fee']) < 1) || (utf8_strlen($this->request->post['joining_fee']) > 255)) {
				$this->error['joining_fee']= $this->language->get('error_joining_fee');
			}
			
			if ($this->request->post['no_of_featured_product'] < 0 ) {
				$this->error['no_of_featured_product']= $this->language->get('error_no_of_featured_product');
			} 
			if ($this->request->post['no_of_category_featured_product'] < 0 ) {
				$this->error['no_of_category_featured_product']= $this->language->get('error_no_of_category_featured_product');
			}
			
			if ((utf8_strlen($this->request->post['subscription_price']) < 1) || (utf8_strlen($this->request->post['subscription_price']) > 255)) {
				$this->error['subscription_price']= $this->language->get('error_subscription_price');
			}
			
			if ((utf8_strlen($this->request->post['validity']) < 1) || (utf8_strlen($this->request->post['validity']) > 255)) {
				$this->error['validity']= $this->language->get('error_validity');
			}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'extension/purpletree_multivendor/subcriptionplan')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}


	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/purpletree_vendor_plan');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_extension_purpletree_multivendor_subcriptionplan->getCategories($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'category_id' => $result['category_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
