<?php
require_once DIR_SYSTEM . 'journal2/classes/journal2_cache.php';
require_once DIR_SYSTEM . 'journal2/classes/journal2_skin.php';

class ModelJournal2Settings extends Model{

    private $post_data;
    private $get_data;

    public function __construct($registry) {
        parent::__construct($registry);
        $this->post_data = json_decode(file_get_contents('php://input'), true);
        $this->get_data = $this->request->get;
    }

    public function load() {
        if (!isset($this->get_data['category'])) {
            throw new Exception('Parameter category was not found');
        }

        $category = $this->get_data['category'];

        if (!isset($this->get_data['theme_id'])) {
            throw new Exception('Parameter theme_id was not found');
        }

        $skin_id = $this->get_data['theme_id'];

        $journal_skin = new Journal2Skin($this->db, $skin_id);

        return $journal_skin->load($category);
    }

    public function load_default() {
        if (!isset($this->get_data['category'])) {
            throw new Exception('Parameter category was not found');
        }

        $category = $this->get_data['category'];

        if (!isset($this->get_data['theme_id'])) {
            throw new Exception('Parameter theme_id was not found');
        }

        $skin_id = $this->get_data['theme_id'];

        $journal_skin = new Journal2Skin($this->db, $skin_id);

        return $journal_skin->load($category, true);
    }

    public function save() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        if (!isset($this->get_data['category'])) {
            throw new Exception('Parameter category was not found');
        }

        $category = $this->get_data['category'];

        if (!isset($this->get_data['theme_id'])) {
            throw new Exception('Parameter theme_id was not found');
        }

        $skin_id = $this->get_data['theme_id'];

        if (!isset($this->post_data['settings'])) {
            throw new Exception('Parameter settings was not found');
        }

        $settings = $this->post_data['settings'];

        $journal_skin = new Journal2Skin($this->db, $skin_id);

        $journal_skin->save($category, $settings);

        Journal2Cache::deleteModuleCache("settings");

        /* save active skin if no multistore */
        $this->load->model('setting/store');
        $stores = $this->model_setting_store->getStores();
        if (!is_array($stores) || count($stores) === 0) {
            $this->db->query('INSERT INTO ' . DB_PREFIX . 'journal2_config (`key`, `store_id`, `value`, `serialized`) VALUES ("active_skin", "' . 0 . '", "' . (int)$skin_id . '", "0") ON DUPLICATE KEY UPDATE `value` = "' . (int)$skin_id .'", `serialized` = "0"');
        }
    }

    public function save_as() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        if (!isset($this->get_data['category'])) {
            throw new Exception('Parameter category was not found');
        }

        $category = $this->get_data['category'];

        if (!isset($this->get_data['theme_id'])) {
            throw new Exception('Parameter theme_id was not found');
        }

        $skin_id = $this->get_data['theme_id'];

        if (!isset($this->post_data['name'])) {
            throw new Exception('Parameter name was not found');
        }

        $name = $this->post_data['name'];

        if (!isset($this->post_data['settings'])) {
            throw new Exception('Parameter settings was not found');
        }

        $settings = $this->post_data['settings'];

        /* get parent id */
        $parent_id = $skin_id;
        if ($skin_id >= 100) {
            $query = $this->db->query("SELECT parent_id FROM " . DB_PREFIX . "journal2_skins WHERE `skin_id` = '" . (int)$skin_id . "'");
            if ($query->num_rows) {
                $parent_id = $query->row['parent_id'];
            } else {
                $parent_id = 1;
            }
        }

        /* last id fix */
		$skin_id_1 = (int)$this->db->query("SELECT MAX(skin_id) as max FROM " . DB_PREFIX . "journal2_skins")->row['max'];
		$skin_id_2 = (int)$this->db->query("SELECT MAX(theme_id) as max FROM " . DB_PREFIX . "journal2_settings")->row['max'];
		$new_skin_id = max($skin_id_1, $skin_id_2, 100) + 1;

        /* insert new skin into db */
        $this->db->query("INSERT INTO " . DB_PREFIX . "journal2_skins SET `skin_id` = '" . (int)$new_skin_id . "', `skin_name` = '" . $this->db->escape($name) . "', `parent_id` = '" . (int)$parent_id . "'");

        /* save skin data */
        $this->db->query("INSERT INTO " . DB_PREFIX . "journal2_settings (`theme_id`, `key`, `category`, `value`, `serialized`) (SELECT " . $new_skin_id . ", `key`, `category`, `value`, `serialized` FROM " . DB_PREFIX . "journal2_settings WHERE `theme_id` = '" . (int)$skin_id. "')");
        $journal_skin = new Journal2Skin($this->db, $new_skin_id);
        $journal_skin->save($category, $settings);

        return $new_skin_id;
    }

    public function delete_skin() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        if (!isset($this->get_data['theme_id'])) {
            throw new Exception('Parameter theme_id was not found');
        }

        $skin_id = $this->get_data['theme_id'];

        if ($skin_id < 100) {
            throw new Exception('Cannot delete default skins!');
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "journal2_skins WHERE `skin_id` = '" . (int)$skin_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "journal2_settings WHERE `theme_id` = '" . (int)$skin_id . "'");
    }

    public function get_skins() {
        $default_skins = Journal2Skin::getAvailableSkins();
        $db_skins = $this->db->query("SELECT * FROM " . DB_PREFIX . "journal2_skins");
        $skins = array();
        foreach ($default_skins as $skin) {
            $skins[] = array(
                'name'  => 'Journal ' . $skin,
                'id'    => $skin
            );
        }
        foreach ($db_skins->rows as $skin) {
            $skins[] = array(
                'name'  => $skin['skin_name'],
                'id'    => $skin['skin_id']
            );
        }
        return $skins;
    }

    public function export() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        if (!defined('J2ENV')) {
            throw new Exception('You shouldn\'t be here!');
        }

        Journal2Skin::exportAll($this->db);
    }

    public function editSetting($group, $data, $store_id = 0) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "journal2_settings WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");

        foreach ($data as $key => $value) {
            if (!is_array($value)) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "journal2_settings SET store_id = '" . (int)$store_id . "', `group` = '" . $this->db->escape($group) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
            } else {
                $this->db->query("INSERT INTO " . DB_PREFIX . "journal2_settings SET store_id = '" . (int)$store_id . "', `group` = '" . $this->db->escape($group) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(json_encode($value)) . "', json_encoded = '1'");
            }
        }
    }

    public function deleteSetting($group, $store_id = 0) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "journal2_settings WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");
    }

    public function editSettingValue($group = '', $key = '', $value = '', $store_id = 0) {
        if (!is_array($value)) {
            $this->db->query("UDPATE " . DB_PREFIX . "journal2_settings SET `value` = '" . $this->db->escape($value) . " WHERE `group` = '" . $this->db->escape($group) . "' AND `key` = '" . $this->db->escape($key) . "' AND store_id = '" . (int)$store_id . "'");
        } else {
            $this->db->query("UDPATE " . DB_PREFIX . "journal2_settings SET `value` = '" . $this->db->escape(json_encode($value)) . "' WHERE `group` = '" . $this->db->escape($group) . "' AND `key` = '" . $this->db->escape($key) . "' AND store_id = '" . (int)$store_id . "', json_encoded = '1'");
        }
    }

    public function get() {
        if (!isset($this->get_data['key'])) {
            throw new Exception('Parameter key was not found');
        }

        $key = $this->get_data['key'];

        if (!isset($this->get_data['store_id'])) {
            $store_id = 0;
        } else {
            $store_id = $this->get_data['store_id'];
        }

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "journal2_config WHERE store_id = '" . (int)$store_id . "' AND `key` = '" . $this->db->escape($key) . "'");

        if (!$query->row) {
            return null;
        }

        if ($query->row['serialized']) {
            return json_decode($query->row['value'], true);
        }

        return $query->row['value'];
    }

    public function set() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        if (!isset($this->post_data['value'])) {
            throw new Exception('Parameter value was not found');
        }

        $value = $this->post_data['value'];

        if (!isset($this->get_data['key'])) {
            throw new Exception('Parameter key was not found');
        }

        $key = $this->get_data['key'];

        if (!isset($this->get_data['store_id'])) {
            $store_id = 0;
        } else {
            $store_id = $this->get_data['store_id'];
        }

        if (is_scalar($value)) {
            $json_encoded = 0;
        } else {
            $value = json_encode($value);
            $json_encoded = 1;
        }

        $this->db->query('INSERT INTO ' . DB_PREFIX . 'journal2_config (`key`, `store_id`, `value`, `serialized`) VALUES ("' . $this->db->escape($key) . '", "' . (int)$store_id . '", "' . $this->db->escape($value) . '", "' . $json_encoded . '") ON DUPLICATE KEY UPDATE `value` = "' . $this->db->escape($value) .'", `serialized` = "' . $json_encoded .'"');

        Journal2Cache::deleteModuleCache("config_{$key}");

        return null;
    }

    public function get_site_width() {
        $theme_id = 0;
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "journal2_settings WHERE `key` = 'site_width' AND `theme_id` = '" . (int)$theme_id . "'");
        if (!$query->num_rows) return 1024;
        $value = json_decode($query->row['value'], true);
        return isset($value['text']) ? $value['text'] : 1024;
    }

}
