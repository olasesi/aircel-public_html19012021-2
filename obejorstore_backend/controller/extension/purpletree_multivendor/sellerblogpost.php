<?php
class ControllerExtensionPurpletreeMultivendorSellerblogpost extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				
			}
		$this->load->language('purpletree_multivendor/sellerblogpost');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/sellerblogpost');

		$this->getList();
	}

	public function add() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
		$this->load->language('purpletree_multivendor/sellerblogpost');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/sellerblogpost');
        //ECHO"<PRE>";PRINT_R($this->request->post);DIE;
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_purpletree_multivendor_sellerblogpost->addPost($this->request->post);

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

			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
		$this->load->language('purpletree_multivendor/sellerblogpost');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/sellerblogpost');
  //echo"<pre>"; print_r($this->request->post); die;
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_purpletree_multivendor_sellerblogpost->editPost($this->request->get['blog_post_id'], $this->request->post);

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

			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
		$this->load->language('purpletree_multivendor/sellerblogpost');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/sellerblogpost');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $blog_post_id) {
				$this->model_extension_purpletree_multivendor_sellerblogpost->deletePost($blog_post_id);
			}

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

			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getList();
	}

	public function copy() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
		$this->load->language('purpletree_multivendor/sellerblogpost');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/sellerblogpost');

		if (isset($this->request->post['selected']) && $this->validateCopy()) {
			foreach ($this->request->post['selected'] as $blog_post_id) {
				$this->model_extension_purpletree_multivendor_sellerblogpost->copyPost($blog_post_id);
			}

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

			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'pd.name';
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
			'href' => $this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		$data['add'] = $this->url->link('extension/purpletree_multivendor/sellerblogpost/add', 'user_token=' . $this->session->data['user_token'] . $url, true);
		$data['copy'] = $this->url->link('extension/purpletree_multivendor/sellerblogpost/copy', 'user_token=' . $this->session->data['user_token'] . $url, true);
		$data['delete'] = $this->url->link('extension/purpletree_multivendor/sellerblogpost/delete', 'user_token=' . $this->session->data['user_token'] . $url, true);

		$data['blogposts'] = array();

		$filter_data = array(
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'           => $this->config->get('config_limit_admin')
		);
       
		$this->load->model('tool/image');
		
		$post_total = $this->model_extension_purpletree_multivendor_sellerblogpost->getTotalBlogs($filter_data);

		$results = $this->model_extension_purpletree_multivendor_sellerblogpost->getBlogs($filter_data);
  
      
		foreach ($results as $result) {		
			$data['blogposts'][] = array(
				'blog_post_id' => $result['blog_post_id'],
				'seller_store' => $this->model_extension_purpletree_multivendor_sellerblogpost->getSellerstoreBySellerid($result['seller_id']),
				'title'       => $result['title'],
				'sort_order'      => $result['sort_order'],
				'status'     => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'edit'       => $this->url->link('extension/purpletree_multivendor/sellerblogpost/edit', 'user_token=' . $this->session->data['user_token'] . '&blog_post_id=' . $result['blog_post_id'] . $url, true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_image'] = $this->language->get('column_image');
		$data['column_name'] = $this->language->get('column_name');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_seller_store'] = $this->language->get('column_seller_store');

		$data['button_copy'] = $this->language->get('button_copy');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');

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

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_title'] = $this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . '&sort=bp.title' . $url, true);
		$data['sort_status'] = $this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . '&sort=p.status' . $url, true);
		$data['sort_order'] = $this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . '&sort=p.sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $post_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($post_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($post_total - $this->config->get('config_limit_admin'))) ? $post_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $post_total, ceil($post_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/sellerblogpost_list', $data));
	}

	protected function getForm() {
		
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['blog_post_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_default'] = $this->language->get('text_default');
	
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_author'] = $this->language->get('entry_author');
		$data['entry_post_tags'] = $this->language->get('entry_post_tags');
        $data['entry_seller_store'] = $this->language->get('entry_seller_store');
		$data['help_category'] = $this->language->get('help_category');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_remove'] = $this->language->get('button_remove');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$data['error_name'] = $this->error['title'];
		} else {
			$data['error_name'] = array();
		}
		
			if (isset($this->error['description'])) {
			$data['error_description'] = $this->error['description'];
		} else {
			$data['error_description'] = array();
		} 

		/* if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		} */

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
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
			'href' => $this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		if (!isset($this->request->get['blog_post_id'])) {
			$data['action'] = $this->url->link('extension/purpletree_multivendor/sellerblogpost/add', 'user_token=' . $this->session->data['user_token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('extension/purpletree_multivendor/sellerblogpost/edit', 'user_token=' . $this->session->data['user_token'] . '&blog_post_id=' . $this->request->get['blog_post_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('extension/purpletree_multivendor/sellerblogpost', 'user_token=' . $this->session->data['user_token'] . $url, true);

		if (isset($this->request->get['blog_post_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$post_info = $this->model_extension_purpletree_multivendor_sellerblogpost->getPost($this->request->get['blog_post_id']);
		}

		$data['user_token'] = $this->session->data['user_token'];
        $data['module_purpletree_multivendor_seller_blog_order'] = $this->config->get('module_purpletree_multivendor_seller_blog_order');
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['blog_description'])) {
			$data['blog_description'] = $this->request->post['blog_description'];
		} elseif (isset($this->request->get['blog_post_id'])) {
			$data['blog_description'] = $this->model_extension_purpletree_multivendor_sellerblogpost->getBlogDescriptions($this->request->get['blog_post_id']);
		} else {
			$data['blog_description'] = array();
		}

		$this->load->model('setting/store');
		
		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($post_info)) {
			$data['keyword'] = $post_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($post_info)) {
			$data['sort_order'] = $post_info['sort_order'];
		} else {
			$data['sort_order'] = 1;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($post_info)) {
			$data['status'] = $post_info['status'];
		} else {
			$data['status'] = true;
		}
		
		if (isset($this->request->post['post_tags'])) {
			$data['post_tags'] = $this->request->post['post_tags'];
		} elseif (!empty($post_info)) {
			$data['post_tags'] = $post_info['post_tags'];
		} else {
			$data['post_tags'] = '';
		}	

		// Image
		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($post_info)) {
			$data['image'] = $post_info['image'];
		} else {
			$data['image'] = '';
		}
		if(isset($this->request->post['seller_id'])){
		  $data['seller_id'] = $this->request->post['seller_id'];
		} elseif (!empty($post_info)) {
			$data['seller_id'] = $post_info['seller_id'];
		} else {
			$data['seller_id'] = '';
		}
		
		if(isset($this->request->post['store_name'])){			
		  $data['store_name'] = $this->request->post['store_name'];		
		} elseif(!empty($post_info['seller_id'])){
			
			$data['store_name'] = $this->model_extension_purpletree_multivendor_sellerblogpost->getSellerstoreBySellerid($post_info['seller_id']);			
		}		
		else {
			$data['store_name'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($post_info) && is_file(DIR_IMAGE . $post_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($post_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		$data['ver']=VERSION;
		if($data['ver']=='3.1.0.0_b'){
		$this->document->addScript('view/javascript/ckeditor/ckeditor.js');
		$this->document->addScript('view/javascript/ckeditor/adapters/jquery.js');
		}
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/sellerblogpost_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'extension/purpletree_multivendor/sellerblogpost')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['blog_description'] as $language_id => $value) {
			if ((utf8_strlen($value['title']) < 3) || (utf8_strlen($value['title']) > 255)) {
				$this->error['title'][$language_id] = $this->language->get('error_name');
			}
			
			if ((utf8_strlen($value['description']) < 1)) {
				$this->error['description'][$language_id] = $this->language->get('error_description');
			}

			/* if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
				$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
			} */
		}

		if (utf8_strlen($this->request->post['keyword']) > 0) {
			$this->load->model('design/seo_url');

			$url_alias_info = $this->model_design_seo_url->getSeoUrlsByKeyword($this->request->post['keyword']);
			foreach($url_alias_info as $url_alias_info) {
			if ($url_alias_info && isset($this->request->get['blog_post_id']) && $url_alias_info['query'] != 'blog_post_id=' . $this->request->get['blog_post_id']) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['blog_post_id'])) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'extension/purpletree_multivendor/sellerblogpost')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateCopy() {
		if (!$this->user->hasPermission('modify', 'extension/purpletree_multivendor/sellerblogpost')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
	public function autosellerstore() {
		$json = array();

	/* 	if (isset($this->request->get['store_name'])) {
			$store_name = $this->request->get['store_name'];
		} else {
		$store_name = '';
		} */
		$this->load->model('extension/purpletree_multivendor/sellerblogpost');		
		$results = $this->model_extension_purpletree_multivendor_sellerblogpost->getSellerstore();

		foreach ($results as $result) {
			$json[] = array(
			'vendor_id'       => $result['seller_id'],
			'name'              => strip_tags(html_entity_decode($result['store_name'], ENT_QUOTES, 'UTF-8'))	
			);
		}	

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model'])) {
			$this->load->model('extension/purpletree_multivendor/sellerblogpost');

			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = 5;
			}

			$filter_data = array(
				'filter_name'  => $filter_name,
				'start'        => 0,
				'limit'        => $limit
			);

			$results = $this->model_extension_purpletree_multivendor_sellerblogpost->getBlogs($filter_data);

			foreach ($results as $result) {

				$json[] = array(
					'blog_post_id' => $result['blog_post_id'],
					'title'       => strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
