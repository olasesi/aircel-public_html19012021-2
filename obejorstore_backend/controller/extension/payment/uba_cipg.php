<?php
class ControllerExtensionPaymentUbaCipg extends Controller
{

  private $error = array();

  public function index()
  {
    $this->load->language('extension/payment/uba_cipg');

    $this->document->setTitle($this->language->get('heading_title'));

    $this->load->model('setting/setting');

    if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
      $this->model_setting_setting->editSetting('payment_uba_cipg', $this->request->post);

      $this->session->data['success'] = $this->language->get('text_success');

      $this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true));
    }

    // $data['heading_title'] = $this->language->get('heading_title');

    //  $data['text_edit'] = $this->language->get('text_edit');
    //  $data['text_enabled'] = $this->language->get('text_enabled');
    //  $data['text_disabled'] = $this->language->get('text_disabled');
    //  $data['text_all_zones'] = $this->language->get('text_all_zones');
    //  $data['text_yes'] = $this->language->get('text_yes');
    //  $data['text_no'] = $this->language->get('text_no');
    //  $data['text_pay'] = $this->language->get('text_pay');
    //  $data['text_disable_payment'] = $this->language->get('text_disable_payment');

    // $data['entry_test_public_key'] = $this->language->get('entry_test_public_key');
    // $data['entry_test_secret_key'] = $this->language->get('entry_test_secret_key');
    // $data['entry_live_public_key'] = $this->language->get('entry_live_public_key');
    // $data['entry_live_secret_key'] = $this->language->get('entry_live_secret_key');

    // $data['entry_live'] = $this->language->get('entry_live');
    // $data['entry_debug'] = $this->language->get('entry_debug');
    // $data['entry_total'] = $this->language->get('entry_total');
    // $data['entry_approved_status'] = $this->language->get('entry_approved_status');
    // $data['entry_declined_status'] = $this->language->get('entry_declined_status');
    // $data['entry_error_status'] = $this->language->get('entry_error_status');
    // $data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
    // $data['entry_status'] = $this->language->get('entry_status');
    // $data['entry_sort_order'] = $this->language->get('entry_sort_order');

    // $data['help_live'] = $this->language->get('help_live');
    // // $data['help_debug'] = $this->language->get('help_debug');
    // // $data['help_total'] = $this->language->get('help_total');

    //  $data['button_save'] = $this->language->get('button_save');
    //  $data['button_cancel'] = $this->language->get('button_cancel');

    // $data['tab_general'] = $this->language->get('tab_general');
    // $data['tab_order_status'] = $this->language->get('tab_order_status');

    if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
    }

    //merchant key
    if (isset($this->error['merchant'])) {
			$data['error_merchant'] = $this->error['merchant'];
		} else {
			$data['error_merchant'] = '';
    }

    if (isset($this->error['signature'])) {
			$data['error_signature'] = $this->error['signature'];
		} else {
			$data['error_signature'] = '';
		}

    // if (isset($this->error['type'])) {
		// 	$data['error_type'] = $this->error['type'];
		// } else {
		// 	$data['error_type'] = '';
		// }

    $data['breadcrumbs'] = array();

    $data['breadcrumbs'][] = array(
          'text' => $this->language->get('text_home'),
          'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
      );

    $data['breadcrumbs'][] = array(
        'text' => $this->language->get('text_extension'),
        'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true)
    );

    $data['breadcrumbs'][] = array(
        'text' => $this->language->get('heading_title'),
        'href' => $this->url->link('extension/payment/uba_cipg', 'user_token=' . $this->session->data['user_token'], true)
    );

    $data['action'] = $this->url->link('extension/payment/uba_cipg', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true);

    if (isset($this->request->post['payment_uba_cipg_merchant'])) {
			$data['payment_uba_cipg_merchant'] = $this->request->post['payment_uba_cipg_merchant'];
		} else {
			$data['payment_uba_cipg_merchant'] = $this->config->get('payment_uba_cipg_merchant');
		}

    if (isset($this->request->post['payment_uba_cipg_signature'])) {
			$data['payment_uba_cipg_signature'] = $this->request->post['payment_uba_cipg_signature'];
		} else {
			$data['payment_uba_cipg_signature'] = $this->config->get('payment_uba_cipg_signature');
    }

    if (isset($this->request->post['payment_uba_cipg_test'])) {
			$data['payment_uba_cipg_test'] = $this->request->post['payment_uba_cipg_test'];
		} else {
			$data['payment_uba_cipg_test'] = $this->config->get('payment_uba_cipg_test');
		}

    

  	if (isset($this->request->post['payment_uba_cipg_total'])) {
			$data['payment_uba_cipg_total'] = $this->request->post['payment_uba_cipg_total'];
		} else {
			$data['payment_uba_cipg_total'] = $this->config->get('payment_uba_cipg_total');
    }

    if (isset($this->request->post['payment_uba_cipg_order_status_id'])) {
			$data['payment_uba_cipg_order_status_id'] = $this->request->post['payment_uba_cipg_order_status_id'];
		} else {
			$data['payment_uba_cipg_order_status_id'] = $this->config->get('payment_uba_cipg_order_status_id');
		}

  	$this->load->model('localisation/order_status');
    $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

    if (isset($this->request->post['payment_uba_cipg_geo_zone_id'])) {
			$data['payment_uba_cipg_geo_zone_id'] = $this->request->post['payment_uba_cipg_geo_zone_id'];
		} else {
			$data['payment_uba_cipg_geo_zone_id'] = $this->config->get('payment_uba_cipg_geo_zone_id');
    }
    
    $this->load->model('localisation/geo_zone');
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

    if (isset($this->request->post['payment_uba_cipg_status'])) {
			$data['payment_uba_cipg_status'] = $this->request->post['payment_uba_cipg_status'];
		} else {
			$data['payment_uba_cipg_status'] = $this->config->get('payment_uba_cipg_status');
    }

    if (isset($this->request->post['payment_uba_cipg_sort_order'])) {
			$data['payment_uba_cipg_sort_order'] = $this->request->post['payment_uba_cipg_sort_order'];
		} else {
			$data['payment_uba_cipg_sort_order'] = $this->config->get('payment_uba_cipg_sort_order');
		}

         $data['header'] = $this->load->controller('common/header');
         $data['column_left'] = $this->load->controller('common/column_left');
         $data['footer'] = $this->load->controller('common/footer');
         $this->response->setOutput($this->load->view('extension/payment/uba_cipg', $data));
  }

  public function validate()
  {
    	if (!$this->user->hasPermission('modify', 'extension/payment/uba_cipg')) {
			$this->error['warning'] = $this->language->get('error_permission');
      }

	    if (!$this->request->post['payment_uba_cipg_merchant']) {
			$this->error['merchant'] = $this->language->get('error_merchant');
      }

      // if (!$this->request->post['payment_uba_cipg_signature ']) {
      // $this->error['signature'] = $this->language->get('error_signature');
      // }
     
		  return !$this->error;


  }
}
