<?php

class ModelJournal2Optimisations extends Model{

    private $post_data;
    private $get_data;
    private static $INDEX_LIST = array(
        'product.model',
        'url_alias.query',
        'url_alias.keyword'
    );

    public function __construct($registry) {
        parent::__construct($registry);
        $this->post_data = json_decode(file_get_contents('php://input'), true);
        $this->get_data = $this->request->get;
        foreach (self::$INDEX_LIST as &$value) {
            $value = DB_PREFIX . $value;
        }
    }

    /* special thanks to https://github.com/chrisatomix/opencart-turbo/blob/master/turbo.php */
    public function indexes() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }
        return $this->getTables();
    }

    public function add_indexes() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        return $this->getTables(true);
    }

    private function getTables($add_indexes = false) {
        $query = $this->db->query('SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = "' . $this->db->escape(DB_DATABASE) . '"');
        $tables_indexes = array();
        foreach ($query->rows as $table) {
            $indexes = $this->getTableIndexes($table['TABLE_NAME']);
            $columns = $this->getTableColumns($table['TABLE_NAME']);
            foreach ($columns as $column) {
                if ($this->canIndex($table['TABLE_NAME'] . '.' . $column) && !in_array($column, $indexes)) {
                    $error = $add_indexes ? $this->addIndex($table['TABLE_NAME'], $column) : null;
                    if (!$add_indexes || $error) {
                        $tables_indexes[] = array(
                            'column'    => $table['TABLE_NAME'] . '.' . $column,
                            'status'    => $error
                        );
                    }
                }
            }

        }
        return $tables_indexes;
    }

    private function getTableIndexes($table_name) {
        $query = $this->db->query('SELECT * FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = "' . $this->db->escape(DB_DATABASE) . '" AND TABLE_NAME = "' . $this->db->escape($table_name) . '"');
        $indexes = array();
        foreach ($query->rows as $index) {
            $indexes[] = $index['COLUMN_NAME'];
        }
        return $indexes;
    }

    private function getTableColumns($table_name) {
        $query = $this->db->query('SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = "' . $this->db->escape(DB_DATABASE) . '" AND TABLE_NAME = "' . $this->db->escape($table_name) . '" AND LCASE(DATA_TYPE) NOT IN ("blob", "text", "longtext")');
        $columns = array();
        foreach ($query->rows as $column) {
            $columns[] = $column['COLUMN_NAME'];
        }
        return $columns;
    }

    private function canIndex($column) {
        if (in_array($column, self::$INDEX_LIST)) {
            return true;
        }
        if (substr($column, -3) == '_id') {
            return true;
        }
        return false;
    }

    private function addIndex($table, $column) {
        ob_start();
        $this->db->query('ALTER TABLE `' . $this->db->escape($table) . '` ADD INDEX (`' . $this->db->escape($column) . '`)');
        $buf = ob_get_contents();
        ob_clean();
        if (strpos($buf, 'Error: ALTER') !== false) {
            throw new Exception('Your MySQL user may not have ALTER privilege.');
        }
        return null;
    }

}