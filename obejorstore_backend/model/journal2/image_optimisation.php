<?php
class ModelJournal2ImageOptimisation extends Model{

    private $post_data;
    private $get_data;

    public function __construct($registry) {
        parent::__construct($registry);
        $this->post_data = json_decode(file_get_contents('php://input'), true);
        $this->get_data = $this->request->get;
    }

    public function status() {
        if (!defined('J2ENV')) {
            return array();
        }
        require_once DIR_SYSTEM . 'journal2/classes/journal2_image_optimiser.php';
        return Journal2ImageOptimiser::getStatus();
    }

    public function process() {
        header('Content-Type: text/event-stream');
        header('Cache-Control: no-cache');

        require_once DIR_SYSTEM . 'journal2/classes/journal2_image_optimiser.php';

        if ($this->user->hasPermission('modify', 'module/journal2')) {
            $all = isset($this->get_data['all']) && $this->get_data['all'] === 'true';
            Journal2ImageOptimiser::optimise($all);
            Journal2ImageOptimiser::send(array('status' => 'terminated'));
        } else {
            Journal2ImageOptimiser::send(array('error' => 'You do not have permissions to modify Journal2 module'));
        }

        exit();
    }

}