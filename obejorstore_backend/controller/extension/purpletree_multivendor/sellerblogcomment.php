<?php
class ControllerExtensionPurpletreeMultivendorSellerblogcomment extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				
			}
		$this->load->language('purpletree_multivendor/sellerblogcomment');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/sellerblogcomment');

		$this->getList();
	}
	
	public function add() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogcomment', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
		$this->load->language('purpletree_multivendor/sellerblogcomment');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/sellerblogcomment');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_purpletree_multivendor_sellerblogcomment->addComment($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_post'])) {
				$url .= '&filter_post=' . urlencode(html_entity_decode($this->request->get['filter_post'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
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

			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogcomment', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogcomment', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
		$this->load->language('purpletree_multivendor/sellerblogcomment');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/sellerblogcomment');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_purpletree_multivendor_sellerblogcomment->editComment($this->request->get['comment_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_post'])) {
				$url .= '&filter_post=' . urlencode(html_entity_decode($this->request->get['filter_post'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
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

			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogcomment', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogcomment', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
		$this->load->language('purpletree_multivendor/sellerblogcomment');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/purpletree_multivendor/sellerblogcomment');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $comment_id) {
				$this->model_extension_purpletree_multivendor_sellerblogcomment->deleteComment($comment_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_post'])) {
				$url .= '&filter_post=' . urlencode(html_entity_decode($this->request->get['filter_post'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
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

			$this->response->redirect($this->url->link('extension/purpletree_multivendor/sellerblogcomment', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		
		if (isset($this->request->get['filter_post'])) {
			$filter_post = $this->request->get['filter_post'];
		} else {
			$filter_post = null;
		}
		
		if (isset($this->request->get['filter_seller_id'])) {
			$filter_seller_id = $this->request->get['filter_seller_id'];
		} else {
			$filter_seller_id = null;
		}
		
			if (isset($this->request->get['filter_store_name'])) {
			$filter_store_name = $this->request->get['filter_store_name'];
		} else {
			$filter_store_name = null;
		}


		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
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

		$url = '';

		if (isset($this->request->get['filter_post'])) {
			$url .= '&filter_post=' . urlencode(html_entity_decode($this->request->get['filter_post'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_store_name'])) {
			$url .= '&filter_store_name=' . urlencode(html_entity_decode($this->request->get['filter_store_name'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_seller_id'])) {
			$url .= '&filter_seller_id=' . $this->request->get['filter_seller_id'];
		}


		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
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
			'href' => $this->url->link('extension/purpletree_multivendor/sellerblogcomment', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);
		
		$data['add'] = $this->url->link('extension/purpletree_multivendor/sellerblogcomment/add', 'user_token=' . $this->session->data['user_token'] . $url, true);
		$data['delete'] = $this->url->link('extension/purpletree_multivendor/sellerblogcomment/delete', 'user_token=' . $this->session->data['user_token'] . $url, true);

		$data['comments'] = array();

		$filter_data = array(
			'filter_post'    => $filter_post,
			'filter_seller_id'    => $filter_seller_id,
			'filter_status'     => $filter_status,
			'filter_date_added' => $filter_date_added,
			'start'             => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'             => $this->config->get('config_limit_admin')
		);

		
		$comment_total = $this->model_extension_purpletree_multivendor_sellerblogcomment->getTotalComments($filter_data);

		$results = $this->model_extension_purpletree_multivendor_sellerblogcomment->getComments($filter_data);
//echo"<pre>"; print_r($results);die;
       $this->load->model('extension/purpletree_multivendor/sellerblogpost');
		foreach ($results as $result) {
			$data['comments'][] = array(
				'comment_id'  => $result['blog_comment_id'],
				'seller_store' => $this->model_extension_purpletree_multivendor_sellerblogpost->getSellerstoreBySellerid($result['seller_id']),
				'name'       => $result['name'],
				'post'       => $result['post'],
				'email_id'     => $result['email_id'],
				'status'     => ($result['status']) ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['created_at'])),
				'edit'       => $this->url->link('extension/purpletree_multivendor/sellerblogcomment/edit', 'user_token=' . $this->session->data['user_token'] . '&comment_id=' . $result['blog_comment_id'] . $url, true)
			);
		}
//echo"<pre>"; print_r($data['comments']);die;
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all'] = $this->language->get('text_all');

		$data['column_post'] = $this->language->get('column_post');
		$data['column_name'] = $this->language->get('column_name');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');
		$data['column_seller_store'] = $this->language->get('column_seller_store');

		$data['entry_post'] = $this->language->get('entry_post');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_seller_store'] = $this->language->get('entry_seller_store');
		
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

		if (isset($this->request->get['filter_post'])) {
			$url .= '&filter_post=' . urlencode(html_entity_decode($this->request->get['filter_post'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_store_name'])) {
			$url .= '&filter_store_name=' . urlencode(html_entity_decode($this->request->get['filter_store_name'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_seller_id'])) {
			$url .= '&filter_seller_id=' . $this->request->get['filter_seller_id'];
		}
		
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$url = '';

		if (isset($this->request->get['filter_post'])) {
			$url .= '&filter_post=' . urlencode(html_entity_decode($this->request->get['filter_post'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		$pagination = new Pagination();
		$pagination->total = $comment_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/purpletree_multivendor/sellerblogcomment', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($comment_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($comment_total - $this->config->get('config_limit_admin'))) ? $comment_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $comment_total, ceil($comment_total / $this->config->get('config_limit_admin')));

		$data['filter_post'] = $filter_post; 
		$data['filter_store_name'] = $filter_store_name;
		$data['filter_seller_id'] = $filter_seller_id;
		$data['filter_status'] = $filter_status;
		$data['filter_date_added'] = $filter_date_added;
			$data['ver']=VERSION;
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/sellerblogcomment_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['comment_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_post'] = $this->language->get('entry_post');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_text'] = $this->language->get('entry_text');

		$data['help_post'] = $this->language->get('help_post');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['post'])) {
			$data['error_post'] = $this->error['post'];
		} else {
			$data['error_post'] = '';
		}
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		
		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}
		
		if (isset($this->error['text'])) {
			$data['error_text'] = $this->error['text'];
		} else {
			$data['error_text'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_post'])) {
			$url .= '&filter_post=' . urlencode(html_entity_decode($this->request->get['filter_post'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
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
			'href' => $this->url->link('extension/purpletree_multivendor/sellerblogcomment', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		if (!isset($this->request->get['comment_id'])) {
			$data['action'] = $this->url->link('extension/purpletree_multivendor/sellerblogcomment/add', 'user_token=' . $this->session->data['user_token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('extension/purpletree_multivendor/sellerblogcomment/edit', 'user_token=' . $this->session->data['user_token'] . '&comment_id=' . $this->request->get['comment_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('extension/purpletree_multivendor/sellerblogcomment', 'user_token=' . $this->session->data['user_token'] . $url, true);

		if (isset($this->request->get['comment_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$comment_info = $this->model_extension_purpletree_multivendor_sellerblogcomment->getComment($this->request->get['comment_id']);
		}

		$data['user_token'] = $this->session->data['user_token'];

		$this->load->model('extension/purpletree_multivendor/sellerblogpost');
		

		if (isset($this->request->post['post_id'])) {
			$data['post_id'] = $this->request->post['post_id'];
		} elseif (!empty($comment_info)) {
			$data['post_id'] = $comment_info['blog_post_id'];
		} else {
			$data['post_id'] = '';
		}
		
		if (isset($this->request->post['post'])) {
			$data['post'] = $this->request->post['post'];
		} elseif (!empty($comment_info)) {
			$data['post'] = $comment_info['post'];
		} else {
			$data['post'] = '';
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($comment_info)) {
			$data['name'] = $comment_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['email_id'])) {
			$data['email_id'] = $this->request->post['email_id'];
		} elseif (!empty($comment_info)) {
			$data['email_id'] = $comment_info['email_id'];
		} else {
			$data['email_id'] = '';
		}

		if (isset($this->request->post['text'])) {
			$data['text'] = $this->request->post['text'];
		} elseif (!empty($comment_info)) {
			$data['text'] = $comment_info['text'];
		} else {
			$data['text'] = '';
		}

		if (isset($this->request->post['date_added'])) {
			$data['date_added'] = $this->request->post['date_added'];
		} elseif (!empty($comment_info)) {
			$data['date_added'] = $comment_info['created_at'];
		} else {
			$data['date_added'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($comment_info)) {
			$data['status'] = $comment_info['status'];
		} else {
			$data['status'] = '';
		}
		$data['ver']=VERSION;
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/purpletree_multivendor/sellerblogcomment_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'extension/purpletree_multivendor/sellerblogcomment')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['post_id']) {
			$this->error['post'] = $this->language->get('error_post');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (utf8_strlen($this->request->post['text']) < 1) {
			$this->error['text'] = $this->language->get('error_text');
		}
		
		if ((utf8_strlen($this->request->post['email_id']) > 96) || !filter_var($this->request->post['email_id'], FILTER_VALIDATE_EMAIL)) {
			$this->error['email'] = $this->language->get('error_email');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'extension/purpletree_multivendor/sellerblogcomment')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}