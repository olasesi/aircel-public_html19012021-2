<?php
require_once DIR_SYSTEM . 'journal2/classes/journal2_export.php';

define('TF_OK', 1);
define('TF_INVALID_CODE', 2);
define('TF_INVALID_USER', 3);
define('TF_API_KEY', '');

function verifyPurchaseCode($code, $user) {
    if (strlen(trim($code)) === 0) {
        return TF_INVALID_CODE;
    }
    $url = 'https://marketplace.envato.com/api/edge/DigitalAtelier/' . TF_API_KEY . '/verify-purchase:' . $code . '.json';

    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_USERAGENT, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36');
    $json = curl_exec($curl);
    curl_close($curl);
    $json = json_decode($json, true);

    if (!(isset($json['verify-purchase']) && isset($json['verify-purchase']['item_id']) && isset($json['verify-purchase']['item_id']) == '4260361')) {
        return TF_INVALID_CODE;
    }
    if (trim(strtolower($json['verify-purchase']['buyer'])) !== trim(strtolower($user))) {
        return TF_INVALID_USER;
    }
    return TF_OK;
}

class ModelJournal2Data extends Model{

    private $post_data;
    private $get_data;

    public function __construct($registry) {
        parent::__construct($registry);
        $this->post_data = json_decode(file_get_contents('php://input'), true);
        $this->get_data = $this->request->get;
    }

    public function export() {
		header('Content-Type: application/octet-stream');
		header('Content-Disposition: attachment; filename=' . date('Y-m-d_H-i-s', time()).'_backup.sql');
		header('Content-Transfer-Encoding: binary');

        /* opencart version */
        $from = version_compare(VERSION, '2', '>=') ? Journal2Export::OC2 : Journal2Export::OC1;

        if (isset($this->get_data['opencart_version']) && $this->get_data['opencart_version'] == 2) {
            $to = Journal2Export::OC2;
        } else {
            $to = Journal2Export::OC1;
        }

        $exporter = new Journal2Export($this->db, $from, $to);

        /* opencart data */
        if (isset($this->get_data['include_store_data']) && $this->get_data['include_store_data']) {
            $exporter->addTables(Journal2Export::STORE_DATA_TABLES);
        }

        /* journal data */
        $exporter->addTables(Journal2Export::JOURNAL_TABLES);

        /* journal blog */
        if (isset($this->get_data['include_blog_data']) && $this->get_data['include_blog_data']) {
            $exporter->addTables(Journal2Export::JOURNAL_BLOG_TABLES);
        }

        /* add dummy images */
        if (isset($this->get_data['add_dummy_images']) && $this->get_data['add_dummy_images']) {
            $exporter->addDummyImages();
        }

        echo $exporter->export();

        exit();
    }

    public function verify_code() {
        if (!isset($this->post_data['purchased_code'])) {
            throw new Exception('Parameter purchased_code was not found');
        }
        if (!isset($this->post_data['tf_user'])) {
            throw new Exception('Parameter tf_user was not found');
        }
        $code = verifyPurchaseCode($this->post_data['purchased_code'], $this->post_data['tf_user']);
        if ($code === TF_INVALID_CODE) {
            throw new Exception('Invalid purchase code.');
        }
        if ($code === TF_INVALID_USER) {
            throw new Exception('ThemeForest user name does not match the purchase code.');
        }
        return true;
    }

}
