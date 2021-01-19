<?php
class ModelJournal2Fonts extends Model{

    private $post_data;
    private $get_data;

    public function __construct($registry) {
        parent::__construct($registry);
        $this->post_data = json_decode(file_get_contents('php://input'), true);
        $this->get_data = $this->request->get;
    }

    public function get() {
        $google_fonts_file = DIR_SYSTEM . 'journal2/data/fonts/google-fonts.json';
        $system_fonts_file = DIR_SYSTEM . 'journal2/data/fonts/system-fonts.json';

        /* return json response */
        return array(
            'google_fonts'  => json_decode(file_get_contents($google_fonts_file), true),
            'system_fonts'  => json_decode(file_get_contents($system_fonts_file), true)
        );
    }

    public function icons() {
        $icons = json_decode(file_get_contents(DIR_CATALOG . 'view/theme/journal2/css/icons/selection.json'), true);
        $result = array();
        foreach ($icons['icons'] as $icon) {
            $cls = explode(',', $icon['properties']['name']);
            $result[] = array(
                'icon'  => '&#x' . dechex($icon['properties']['code']) . ';',
                'class' => $cls[0]
            );
        }
        return $result;
    }

}