<?php
class ControllerExtensionPurpletreeMultivendorSellerenquiries extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('purpletree_multivendor/sellerenquiries');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/sellerenquiries');
		
		$this->getList();
	}
	
	public function delete() {
		$this->load->language('purpletree_multivendor/sellerenquiries');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/sellerenquiries');

		if (isset($this->request->post['selected']) ) {
			foreach ($this->request->post['selected'] as $message_id) {
				$this->model_extension_purpletree_multivendor_sellerenquiries->deleteMessage($message_id);
			}

			$this->session->data['success'] = $this->language->get('text_delete_success');

			$url = '';

			if (isset($this->request->get['filter_seller_name'])) {
				$filter_seller_name = $this->request->get['filter_seller_name'];
			} else {
				$filter_seller_name = null;
			}

			if (isset($this->request->get['filter_customer_name'])) {
				$filter_customer_name = $this->request->get['filter_customer_name'];
			} else {
				$filter_customer_name = null;
			}

			if (isset($this->request->get['filter_email'])) {
				$filter_email = $this->request->get['filter_email'];
			} else {
				$filter_email = null;
			}

			if (isset($this->request->get['filter_created_at'])) {
				$filter_created_at = $this->request->get['filter_created_at'];
			} else {
				$filter_created_at = null;
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerenquiries', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getList();
	}
	
		protected function getList() {
		
		if (isset($this->request->get['filter_seller_name'])) {
			$filter_seller_name = $this->request->get['filter_seller_name'];
		} else {
			$filter_seller_name = null;
		}

		if (isset($this->request->get['filter_store_name'])) {
			$filter_store_name = $this->request->get['filter_store_name'];
		} else {
			$filter_store_name = null;
		}

		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}

		if (isset($this->request->get['filter_created_at'])) {
			$filter_created_at = $this->request->get['filter_created_at'];
		} else {
			$filter_created_at = null;
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'r.date_added';
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
		
		$data['seller_id'] = (isset($this->request->get['seller_id'])?$this->request->get['seller_id']:'');
		$url = '';

		if (isset($this->request->get['filter_store_name'])) {
			$url .= '&filter_store_name=' . urlencode(html_entity_decode($this->request->get['filter_store_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_seller_name'])) {
			$url .= '&filter_seller_name=' . urlencode(html_entity_decode($this->request->get['filter_seller_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_created_at'])) {
			$url .= '&filter_created_at=' . $this->request->get['filter_created_at'];
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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/purpletree_multivendor/sellerenquiries', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		$data['send_all_message'] = $this->url->link('extension/purpletree_multivendor/sellerenquiries/sendsellermessage', 'user_token=' . $this->session->data['user_token'] . '&sendtoall=1', true);
		
		$data['view'] = $this->url->link('extension/purpletree_multivendor/sellerenquiries/view', 'user_token=' . $this->session->data['user_token'] . $url, true);
		$data['delete'] = $this->url->link('extension/purpletree_multivendor/sellerenquiries/delete', 'user_token=' . $this->session->data['user_token'] . $url, true);

		$data['sellerenquiries'] = array();

		$filter_data = array(
			'filter_store_name'  => $filter_store_name,
			'filter_seller_name'    => $filter_seller_name,
			'filter_email'     => $filter_email,
			'filter_created_at' => $filter_created_at,
			'sort'              => $sort,
			'order'             => $order,
			'start'             => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'             => $this->config->get('config_limit_admin'),
			'seller_id'			=> $seller_id
		);

		$contact_total = $this->model_extension_purpletree_multivendor_sellerenquiries->getTotalsellerenquiries($filter_data);

		$results = $this->model_extension_purpletree_multivendor_sellerenquiries->getsellerenquiries($filter_data);
if(!empty($results)){
		foreach ($results as $result) {
			
			if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$view = $this->url->link('extension/purpletree_multivendor/sellerenquiries', 'user_token=' . $this->session->data['user_token'], true);
			} else {
				$view = $this->url->link('extension/purpletree_multivendor/sellerenquiries/sendsellermessage', 'user_token=' . $this->session->data['user_token'] . '&id=' . $result['id'].'&seller_id='.$result['seller_id'] . $url, true);
			}
		
			$data['sellerenquiries'][] = array(
				'id'     => $result['id'],
				'seller_id'     => $result['seller_id'],
				'seller_name'     => $result['seller_name'],
				'store_name'     => $result['store_name'],
				'email'    		 => $result['email'],
				'contact_from'     => '',
				'message'       => $result['message'],
				'date_added' => $result['created_at'],
				'view' => $view
			);
		}
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_seller_to_customer'] = $this->language->get('text_seller_to_customer');
		$data['text_customer_to_seller'] = $this->language->get('text_customer_to_seller');
		
		$data['text_storereview'] = $this->language->get('text_storereview');
		$data['text_email'] = $this->language->get('text_email');
		$data['text_customer_name'] = $this->language->get('text_customer_name');
		$data['text_store_name'] = $this->language->get('text_store_name');
		$data['text_description'] = $this->language->get('text_description');
		$data['text_seller_name'] = $this->language->get('text_seller_name');
		$data['text_date_added'] = $this->language->get('text_date_added');
		$data['column_action'] = $this->language->get('column_action');
		$data['text_empty_result'] = $this->language->get('text_empty_result');
		$data['text_heading'] = $this->language->get('text_heading');
		$data['button_view'] = $this->language->get('button_view');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['text_sendtoall'] = $this->language->get('text_sendtoall');

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
		
		if (isset($this->session->data['error_warning'])) {
			$data['error_warning'] = $this->session->data['error_warning'];

			unset($this->session->data['error_warning']);
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_store_name'])) {
			$url .= '&filter_store_name=' . urlencode(html_entity_decode($this->request->get['filter_store_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_seller_name'])) {
			$url .= '&filter_seller_name=' . urlencode(html_entity_decode($this->request->get['filter_seller_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_created_at'])) {
			$url .= '&filter_created_at=' . $this->request->get['filter_created_at'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$url = '';

		if (isset($this->request->get['filter_store_name'])) {
			$url .= '&filter_store_name=' . urlencode(html_entity_decode($this->request->get['filter_store_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_seller_name'])) {
			$url .= '&filter_seller_name=' . urlencode(html_entity_decode($this->request->get['filter_seller_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_created_at'])) {
			$url .= '&filter_created_at=' . $this->request->get['filter_created_at'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $contact_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/purpletree_multivendor/sellerenquiries', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($contact_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($contact_total - $this->config->get('config_limit_admin'))) ? $contact_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $contact_total, ceil($contact_total / $this->config->get('config_limit_admin')));

		$data['filter_store_name'] = $filter_store_name;
		$data['filter_seller_name'] = $filter_seller_name;
		$data['filter_email'] = $filter_email;
		$data['filter_created_at'] = $filter_created_at;

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/sellerenquiries_list', $data));
	}
	public function sendSellerMessage() {
		$this->load->language('purpletree_multivendor/sellerenquiries');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/sellerenquiries');
		$seller_id='';
		$data['seller_id']='';
		$data['sendtoall']='';
		if(isset($this->request->get['seller_id']) || isset($this->request->get['sendtoall'])){
		if(isset($this->request->get['seller_id'])){
			$seller_iddd=(int)$this->request->get['seller_id'];
			if($seller_iddd){
				$data['seller_id']=	$this->request->get['seller_id'];
				$seller_id=$this->request->get['seller_id'];
			} else {
			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerenquiries', 'user_token=' . $this->session->data['user_token'] . $url, true));	
			}
		}
	
		if(isset($this->request->get['sendtoall'])){
			if($this->request->get['sendtoall']==1){
			$data['sendtoall']=1;
			}else {
			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerenquiries', 'user_token=' . $this->session->data['user_token'] . $url, true));	
			}
		}
		} else {
			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerenquiries', 'user_token=' . $this->session->data['user_token'] . $url, true));			
			}
		$data['sendtoall']=0;
		if(isset($this->request->get['sendtoall'])){
			if($this->request->get['sendtoall']==1){
			$data['sendtoall']=1;
			}
		}
		$url ='';
	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
	if($this->request->post['seller_id']){
			$this->model_extension_purpletree_multivendor_sellerenquiries->addSellerMessage($this->request->post);
			$this->session->data['success'] = $this->language->get('text_success_seller');
			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerenquiries/sendsellermessage', 'user_token=' . $this->session->data['user_token'].'&seller_id='.$this->request->post['seller_id'] . $url, true));
	} elseif($this->request->post['sendtoall']) {
			$this->model_extension_purpletree_multivendor_sellerenquiries->sendAllSellerMessage($this->request->post['message']);
			$this->session->data['success'] = $this->language->get('text_success_all_seller');
			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerenquiries', 'user_token=' . $this->session->data['user_token'].$url, true));
	}

			
	}
		$url = '';
		$this->load->language('purpletree_multivendor/sellerenquiries');
		$this->load->model('extension/purpletree_multivendor/sellerenquiries');
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/purpletree_multivendor/sellerenquiries', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);
		
		$data['user_token'] = $this->session->data['user_token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['error_msg'])) {
			$data['error_text'] = $this->error['error_msg'];
		} else {
			$data['error_text'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}


		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_form'] = $this->language->get('text_form');	
		$data['text_message'] = $this->language->get('text_message');	
		$data['text'] = $this->language->get('text');	
		$data['button_send'] = $this->language->get('button_send');	
		$data['text_contact_from'] = $this->language->get('text_contact_from');	
		$data['text_message'] = $this->language->get('text_message');	
		$data['text_created_at'] = $this->language->get('text_created_at');	
		$data['text_send'] = $this->language->get('text_send');	
		$data['button_send_all'] = $this->language->get('button_send_all');	
		$data['button_tooltip_send'] = $this->language->get('button_tooltip_send');	
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['text_success_all_seller'] = $this->language->get('text_success_all_seller');
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		$url = '';
		$filter_data = array(
			'start'             => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'             => $this->config->get('config_limit_admin'),
			'seller_id'			=> $seller_id
		);

		$seller_messages=$this->model_extension_purpletree_multivendor_sellerenquiries->getSellerMessage($filter_data);
		$data['seller_message']=array();
		if(!empty($seller_messages)){
		foreach($seller_messages as $key=>$seller_msg){
		$data['seller_message'][]=array(
		'seller_id'=>$seller_msg['seller_id'],
		'contact_from'=>$seller_msg['contact_from'],
		'message'=>$seller_msg['message'],
		'created_at'=>$seller_msg['created_at'],
		);				
		}
		}
		
		
		$contact_total=$this->model_extension_purpletree_multivendor_sellerenquiries->getSellerTotalMessage($filter_data);

		$pagination = new Pagination();
		$pagination->total = $contact_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/purpletree_multivendor/sellerenquiries/sendsellermessage', 'user_token=' . $this->session->data['user_token'].'&seller_id='.$seller_id . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($contact_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($contact_total - $this->config->get('config_limit_admin'))) ? $contact_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $contact_total, ceil($contact_total / $this->config->get('config_limit_admin')));
		
		$data['action'] = $this->url->link('extension/purpletree_multivendor/sellerenquiries/sendMessage', 'user_token=' . $this->session->data['user_token'] . '&seller_id='. $data['seller_id'], true);
		$data['cancel'] = $this->url->link('extension/purpletree_multivendor/sellerenquiries', 'user_token=' . $this->session->data['user_token'] , true);
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/sellerenquiries_form', $data));

	}
	
	public function view() {
		
		$this->load->language('purpletree_multivendor/sellerenquiries');
		
		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		
		$data['text_email'] = $this->language->get('text_email');
		$data['text_customer_name'] = $this->language->get('text_customer_name');
		$data['text_description'] = $this->language->get('text_description');
		$data['text_seller_name'] = $this->language->get('text_seller_name');
		$data['text_date_added'] = $this->language->get('text_date_added');
		$data['column_action'] = $this->language->get('column_action');
		$data['text_empty_result'] = $this->language->get('text_empty_result');
		$data['text_heading'] = $this->language->get('text_heading');
		$data['button_view'] = $this->language->get('button_view');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/purpletree_multivendor/sellerenquiries', 'user_token=' . $this->session->data['user_token'] , true)
		);

		$data['action'] = $this->url->link('extension/purpletree_multivendor/sellerenquiries/view', 'user_token=' . $this->session->data['user_token'] . '&id=' . $this->request->get['id'].'&seller_id='. $this->request->get['seller_id'], true);

		$data['cancel'] = $this->url->link('extension/purpletree_multivendor/sellerenquiries', 'user_token=' . $this->session->data['user_token'], true);
		
		$this->load->model('extension/purpletree_multivendor/sellerenquiries');
		
		if (isset($this->request->get['id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$message_info = $this->model_extension_purpletree_multivendor_sellerenquiries->getMessage($this->request->get['id']);
		}
		
		$data['user_token'] = $this->session->data['user_token'];
		
		if (!empty($message_info)) {
			$data['customer_name'] = $message_info['customer_name'];
		} else {
			$data['customer_name'] = '';
		}
		
		if (!empty($message_info['seller_id'])) {
			$data['seller_name'] = $message_info['seller_name'];
		} else {
			$data['seller_name'] = '';
		}
		
		if (isset($this->request->post['customer_email'])) {
			$data['customer_email'] = $this->request->post['customer_email'];
		} elseif (!empty($message_info)) {
			$data['customer_email'] = $message_info['customer_email'];
		} else {
			$data['customer_email'] = '';
		}

		if (isset($this->request->post['customer_message'])) {
			$data['customer_message'] = $this->request->post['customer_message'];
		} elseif (!empty($message_info)) {
			$data['customer_message'] = $message_info['customer_message'];
		} else {
			$data['customer_message'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('purpletree_multivendor/sellerenquiries_view', $data));
	}
		protected function validateForm() {		

			if (utf8_strlen($this->request->post['message']) < 1) {
				$this->error['error_msg']=$this->language->get('error_message_limit');
			}
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		} 		
		return !$this->error;
	}
}
