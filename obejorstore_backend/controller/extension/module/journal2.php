<?php

class ControllerExtensionModuleJournal2 extends Controller {

    public function index() {
        $this->response->redirect($this->url->link('module/journal2', version_compare(VERSION, '3', '>=') ? ('user_token=' . $this->session->data['user_token']) : ('token=' . $this->session->data['token']), true));
    }

    public function install() {
        return $this->load->controller('module/journal2/install');
    }

    public function uninstall() {
        return $this->load->controller('module/journal2/uninstall');
    }

}