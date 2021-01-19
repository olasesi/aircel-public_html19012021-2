<?php
require_once DIR_SYSTEM . 'journal2/classes/journal2_cache.php';
require_once DIR_SYSTEM . 'journal2/classes/journal2_skin.php';

class ModelJournal2Cache extends Model{

    private $post_data;
    private $get_data;

    public function __construct($registry) {
        parent::__construct($registry);
        $this->post_data = json_decode(file_get_contents('php://input'), true);
        $this->get_data = $this->request->get;
    }

    public function clear_all() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }
        Journal2Cache::deleteCache();
    }

}