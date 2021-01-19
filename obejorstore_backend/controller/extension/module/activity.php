<?php
class ControllerExtensionModuleActivity extends Controller {
	private $error = array();

	public function install() {

	$this->db->query("CREATE TABLE `" . DB_PREFIX . "user_activity` (
 `activity_id` int(11) NOT NULL AUTO_INCREMENT,
 `user_id` int(11) NOT NULL,
 `key` varchar(64) NOT NULL,
 `data` text NOT NULL,
 `ip` varchar(40) NOT NULL,
 `date_added` datetime NOT NULL,
 PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8");
	}
	public function index() {
		$this->load->language('extension/module/activity');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('module_activity', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true));
		}

		$language_strings = $this->load->language('extension/module/activity');

		foreach ($language_strings as $code => $languageVariable) {
		     $data[$code] = $languageVariable;
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/activity', 'user_token=' . $this->session->data['user_token'], true)
        );

		$data['action'] = $this->url->link('extension/module/activity', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true);

		if (isset($this->request->post['module_activity_status'])) {
			$data['module_activity_status'] = $this->request->post['module_activity_status'];
		} else {
			$data['module_activity_status'] = $this->config->get('module_activity_status');
		}

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/activity', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/activity')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function activity_record() {
		$this->load->language('extension/module/activity');

		$data['delete'] = $this->url->link('extension/module/activity/delete', 'user_token=' . $this->session->data['user_token'], true);
		$data['download'] = $this->url->link('extension/module/activity/download', 'user_token=' . $this->session->data['user_token'], true);

		$data['column_date'] = $this->language->get('column_date');
		$data['column_user'] = $this->language->get('column_user');
		$data['column_details'] = $this->language->get('column_details');
		$data['column_ip'] = $this->language->get('column_ip');
		
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_record'] = $this->language->get('text_record');

		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_download'] = $this->language->get('button_download');
		
		$data['activities'] = array();

		$this->load->model('extension/module/activity');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$filter_data = array(
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$activity_total = $this->model_extension_module_activity->getTotalActivities();

		$results = $this->model_extension_module_activity->getActivities($filter_data);

		foreach ($results as $result) {
			$comment = vsprintf($this->language->get('text_' . $result['key']), $result['data']);
			
			$find = array(
				'user=',
				'username=',
				'user_id=',
				'order_id=',
				'product_id=',
			);

			$replace = array(
				$result['user'],
				$result['username'],
				$this->url->link('user/user/update', 'user_token=' . $this->session->data['user_token'] . '&user_id='.$result['user_id'], 'SSL'),
				$this->url->link('sale/order/info', 'user_token=' . $this->session->data['user_token'] . '&order_id=', 'SSL'),
				$this->url->link('catalog/product/update', 'user_token=' . $this->session->data['user_token'] . '&product_id=', 'SSL')
			);

			$data['activities'][] = array(
				'comment'    => str_replace($find, $replace, $comment),
				'ip'    	 => $result['ip'],
				'username'   => $result['username'],
				'date_added' => date($this->language->get('datetime_format'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $activity_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/module/activity/activity_record', 'page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($activity_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($activity_total - $this->config->get('config_limit_admin'))) ? $activity_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $activity_total, ceil($activity_total / $this->config->get('config_limit_admin')));

		$this->response->setOutput($this->load->view('extension/module/activity_record', $data));
	}

	public function download(){
		if($this->validate()){
			$query = $this->db->query("SELECT ua.key,u.username,ua.data,ua.date_added,ua.ip FROM `" . DB_PREFIX . "user_activity` ua LEFT JOIN `" . DB_PREFIX . "user` u ON (ua.user_id = u.user_id) ORDER BY ua.date_added DESC");

			$array = $query->rows;
			
			if (count($array) == 0) {
			    return null;
			}

			// Filename
			$date = date('Y-m-d');
			$filename = $date . '-user_activityUiD#' . $this->user->getId() . '.csv';
			// Response headers
			header( 'Content-Type: text/csv' );
			header( 'Content-Disposition: attachment;filename='.$filename);
			// Generate CSV
			$output = fopen('php://output', 'w');
			fputcsv($output, array('event','user','details','date_added','ip_adderss'));
			foreach($array as $product) {
			    fputcsv($output, $product);
			}
			fclose($output);

		}

	}

	public function delete(){
		if($this->validate()){
			$this->load->model('extension/module/activity');
			$this->model_extension_module_activity->deleteActivities();
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module/activity', 'user_token=' . $this->session->data['user_token'], true));
		}
	}
}