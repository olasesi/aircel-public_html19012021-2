<?php
class ModelJournal2Catalog extends Model{

    private $post_data;
    private $get_data;

    public function __construct($registry) {
        parent::__construct($registry);
        $this->post_data = json_decode(file_get_contents('php://input'), true);
        $this->get_data = $this->request->get;
    }

    /*
     *
     * get products
     *
     */
    public function products() {
        if (!isset($this->get_data['filter_name'])) {
            throw new Exception('Parameter filter_name was not found.');
        }
        $this->load->model('catalog/product');
        return $this->model_catalog_product->getProducts(array(
            'filter_name'   => $this->get_data['filter_name']
        ));
    }

    /*
     *
     * get categories
     *
     */
    public function categories() {
        if (!isset($this->get_data['filter_name'])) {
            throw new Exception('Parameter filter_name was not found.');
        }

        if (version_compare(VERSION, '1.5.5', '>=')) {
            $this->load->model('catalog/category');

            return $this->model_catalog_category->getCategories(array(
                'filter_name'   => $this->get_data['filter_name']
            ));
        }

        return $this->getCategories(array(
            'filter_name'   => $this->get_data['filter_name']
        ));
    }

    /*
     *
     * get top categories
     *
     */
    public function top_categories() {
        $sql = $sql = "SELECT c.category_id AS category_id, cd.name AS name FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c.parent_id = 0";
        $query = $this->db->query($sql);
        return $query->rows;
    }

    /*
     * get category
     */
    public function category() {
        if (!isset($this->get_data['id'])) {
            throw new Exception('Parameter id was not found.');
        }
        $this->load->model('catalog/category');
        $result = $this->model_catalog_category->getCategory($this->get_data['id']);
        return $result;
    }

    /*
     *
     * get manufacturers
     *
     */
    public function manufacturers() {
        if (!isset($this->get_data['filter_name'])) {
            throw new Exception('Parameter filter_name was not found.');
        }
        $this->load->model('catalog/manufacturer');
        return $this->model_catalog_manufacturer->getManufacturers(array(
            'filter_name'   => $this->get_data['filter_name']
        ));
    }

    /*
     *
     * get information
     *
     */
    public function information() {
        if (!isset($this->get_data['filter_name'])) {
            throw new Exception('Parameter filter_name was not found.');
        }
        $filter_name = utf8_strtolower($this->db->escape($this->get_data['filter_name']));
        $sql = "SELECT *, id.title as name FROM " . DB_PREFIX . "information i LEFT JOIN " . DB_PREFIX . "information_description id ON (i.information_id = id.information_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND lower(id.title) LIKE '" . $filter_name . "%'";
        $query = $this->db->query($sql);
        return $query->rows;
    }


    /*
     *
     * get information
     *
     */
    public function filters() {
        $this->load->model('catalog/attribute');
        $this->load->model('catalog/filter');
        $this->load->model('catalog/option');
        $this->load->model('localisation/tax_class');

        $tax_classes = $this->model_localisation_tax_class->getTaxClasses();
        array_unshift($tax_classes, array(
            'tax_class_id'  => -1,
            'title'         => 'None'
        ));

        $attributes = array();
        foreach ($this->model_catalog_attribute->getAttributes() as $attribute) {
            if (!isset($attributes[$attribute['attribute_group_id']])) {
                $attributes[$attribute['attribute_group_id']] = array(
                    'group_id'      => $attribute['attribute_group_id'],
                    'group_name'    => $attribute['attribute_group'],
                    'attributes'    => array()
                );
            }
            $attributes[$attribute['attribute_group_id']]['attributes'][] = $attribute;
        }

        $options = array();
        foreach ($this->model_catalog_option->getOptions() as $option) {
            if (in_array($option['type'], array('checkbox', 'select', 'radio', 'image'))) {
                $options[] = $option;
            }
        }

        $filters = $this->model_catalog_filter->getFilterGroups(array(
            'start' => 0,
            'limit' => PHP_INT_MAX
        ));

        return array(
            'attributes'    => $attributes,
            'filters'       => $filters,
            'options'       => $options,
            'tax_classes'   => $tax_classes
        );
    }

    /*
     *
     * v1541 compatibility
     *
     */
    public function getCategories($data) {
        $sql = "SELECT c.category_id, cd1.name as name, c.parent_id, c.sort_order FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (c.category_id = cd1.category_id) WHERE cd1.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND LCASE(cd1.name) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
        }

        $sql .= " GROUP BY c.category_id ORDER BY name";

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    /*
     *
     * v2 featured modules
     *
     * */
    public function get_featured() {
        if (!version_compare(VERSION, '2', '>=')) {
            return null;
        }

        $query = $this->db->query("SELECT module_id, name FROM `" . DB_PREFIX . "module` WHERE `code` = 'featured' ORDER BY `name`");

        return $query->rows;
    }

}