<?php

require_once(DIR_SYSTEM . 'journal2/classes/journal2_utils.php');

class ModelJournal2Blog extends Model{

    private $post_data;
    private $get_data;
    private $db_prefix = '';
    private $language_id = -1;

    public function __construct($registry) {
        parent::__construct($registry);
        $this->post_data = json_decode(file_get_contents('php://input'), true);
        $this->get_data = $this->request->get;
        $this->load->model('localisation/language');
        $this->db_prefix = $this->db->escape(DB_PREFIX);
        $this->language_id = (int)$this->config->get('config_language_id');
    }

    public function isInstalled() {
        $query = $this->db->query(str_replace('_', '\_', 'show tables like "' . DB_PREFIX . 'journal2_blog%"'));

        if ($query->num_rows >= 9 && $query->num_rows < 11) {
            /* create table */
            $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_blog_category_to_store` (
                `category_id` int(11),
                `store_id` int(11)
            ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

            /* assign current categories to the default store */
            $this->db->query('INSERT INTO `' . DB_PREFIX . 'journal2_blog_category_to_store` (category_id, store_id) SELECT category_id, 0 as store_id FROM `' . DB_PREFIX . 'journal2_blog_category`');

            /* create table */
            $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_blog_post_to_store` (
                `post_id` int(11),
                `store_id` int(11)
            ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

            /* assign current posts to the default store */
            $this->db->query('INSERT INTO `' . DB_PREFIX . 'journal2_blog_post_to_store` (post_id, store_id) SELECT post_id, 0 as store_id FROM `' . DB_PREFIX . 'journal2_blog_post`');
        }

        return $query->num_rows >= 9;
    }

    /*
     *
     * categories
     *
     */

    public function categories() {
        return array(
            'categories'    => $this->getCategoriesQuery(),
            'total'         => $this->getCategoriesQuery(true)
        );
    }

    private function getCategoriesQuery($total = false) {
        $start = (int)Journal2Utils::getProperty($this->get_data, 'start');
        $limit = (int)Journal2Utils::getProperty($this->get_data, 'limit');

        if ($total) {
            $sql = "
                SELECT
                    COUNT(*) as num
            ";
        } else {
            $sql = "
                SELECT
                    c.category_id,
                    cd.name
            ";
        }

        $sql .= "
            FROM `{$this->db_prefix}journal2_blog_category` c
                LEFT JOIN `{$this->db_prefix}journal2_blog_category_description` cd ON c.category_id = cd.category_id
                WHERE cd.language_id = {$this->language_id}
        ";

        if (isset($this->get_data['filter_name']) && $this->get_data['filter_name']) {
            $sql .= " AND cd.name LIKE '" . $this->db->escape($this->get_data['filter_name']) . "%'";
        }

        if (!$total && $start && $limit) {
            $start = ($start - 1) * $limit;
            $sql .= " LIMIT $start, $limit";
        }

        $query = $this->db->query($sql);

        return $total ? $query->row['num'] : $query->rows;
    }

    public function category() {
        $category_id = (int)$this->get_data['category_id'];

        $query1 = $this->db->query("
            SELECT
                parent_id,
                image,
                status,
                sort_order
            FROM `{$this->db_prefix}journal2_blog_category`
            WHERE category_id = {$category_id}
        ");

        $query2 = $this->db->query("
            SELECT
                language_id,
                name,
                description,
                meta_title,
                meta_keywords,
                meta_description,
                keyword
            FROM `{$this->db_prefix}journal2_blog_category_description`
            WHERE category_id = {$category_id}
        ");

        $query3 = $this->db->query("
            SELECT
                store_id,
                layout_id
            FROM `{$this->db_prefix}journal2_blog_category_to_layout`
            WHERE category_id = {$category_id}
        ");

        $query4 = $this->db->query("
            SELECT
                store_id
            FROM `{$this->db_prefix}journal2_blog_category_to_store`
            WHERE category_id = {$category_id}
        ");

        $result = array(
            'name'          => array(
                'value'     => array()
            ),
            'description'   => array(),
            'meta_title'    => array(
                'value'     => array()
            ),
            'meta_keywords'    => array(
                'value'     => array()
            ),
            'meta_description' => array(
                'value'     => array()
            ),
            'keyword'          => array(
                'value'     => array()
            ),
            'parent_id'     => $query1->row['parent_id'],
            'image'         => $query1->row['image'],
            'status'        => $query1->row['status'],
            'sort_order'    => $query1->row['sort_order'],
            'layouts'       => array(),
            'store_ids'     => array()
        );

        foreach ($query2->rows as $row) {
            $result['name']['value'][$row['language_id']] = $row['name'];
            $result['description'][$row['language_id']] = $row['description'];
            $result['meta_title']['value'][$row['language_id']] = $row['meta_title'];
            $result['meta_keywords']['value'][$row['language_id']] = $row['meta_keywords'];
            $result['meta_description']['value'][$row['language_id']] = $row['meta_description'];
            $result['keyword']['value'][$row['language_id']] = $row['keyword'];
        }

        foreach ($query3->rows as $row) {
            $result['layouts']['s_' . $row['store_id']] = $row['layout_id'];
        }

        foreach ($query4->rows as $row) {
            $result['store_ids'][] = $row['store_id'];
        }

        return $result;
    }

    public function create_category() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        $parent_id = (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'parent_id', ''));
        $image = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'image', ''));
        $status =  (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'status', ''));
        $sort_order = (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'sort_order', ''));

        $this->db->query("
            INSERT INTO `{$this->db_prefix}journal2_blog_category`
                (parent_id, image, status, sort_order)
            VALUES
                ({$parent_id}, '{$image}', {$status}, {$sort_order})
        ");

        $category_id = $this->db->getLastId();

        $this->edit_category_data($category_id);

        return $category_id;
    }

    public function edit_category() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        $category_id = (int)$this->get_data['category_id'];

        $parent_id = (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'parent_id', ''));
        $image = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'image', ''));
        $status =  (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'status', ''));
        $sort_order = (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'sort_order', ''));

        $this->db->query("
            UPDATE `{$this->db_prefix}journal2_blog_category` SET
                parent_id = {$parent_id},
                image = '{$image}',
                status = {$status},
                sort_order = {$sort_order}
            WHERE category_id = {$category_id}
        ");

        $this->edit_category_data($category_id);

        return null;
    }

    private function edit_category_data($category_id) {
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_category_description` WHERE category_id = {$category_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_category_to_layout` WHERE category_id = {$category_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_category_to_store` WHERE category_id = {$category_id}");

        $languages = $this->model_localisation_language->getLanguages();

        foreach ($languages as $language) {
            $language_id = (int)$language['language_id'];
            $name = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'name.value.' . $language['language_id'], ''));
            $description = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'description.' . $language['language_id'], ''));
            $meta_title = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'meta_title.value.' . $language['language_id'], ''));
            $meta_keywords = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'meta_keywords.value.' . $language['language_id'], ''));
            $meta_description = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'meta_description.value.' . $language['language_id'], ''));
            $keyword = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'keyword.value.' . $language['language_id'], ''));
            $this->db->query("
                INSERT INTO `{$this->db_prefix}journal2_blog_category_description`
                    (category_id, language_id, name, description, meta_title, meta_keywords, meta_description, keyword)
                VALUES
                    ({$category_id}, {$language_id}, '{$name}', '{$description}', '{$meta_title}', '{$meta_keywords}', '{$meta_description}', '{$keyword}')
            ");
        }

        foreach (Journal2Utils::getProperty($this->post_data, 'layouts', array()) as $store_id => $layout_id) {
            $store_id   = (int)str_replace('s_', '', $store_id);
            $layout_id  = (int)$layout_id;
            $this->db->query("
                INSERT INTO `{$this->db_prefix}journal2_blog_category_to_layout`
                    (category_id, store_id, layout_id)
                VALUES
                    ({$category_id}, {$store_id}, {$layout_id})
            ");
        }

        foreach (Journal2Utils::getProperty($this->post_data, 'stores', array()) as $store_id => $value) {
            if ((int)$value) {
                $store_id   = (int)str_replace('s_', '', $store_id);
                $this->db->query("
                    INSERT INTO `{$this->db_prefix}journal2_blog_category_to_store`
                        (category_id, store_id)
                    VALUES
                        ({$category_id}, {$store_id})
                ");
            }
        }
    }

    public function delete_category() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        $category_id = (int)$this->get_data['category_id'];

        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_category` WHERE category_id = {$category_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_category_description` WHERE category_id = {$category_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_category_to_layout` WHERE category_id = {$category_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_category_to_store` WHERE category_id = {$category_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post_to_category` WHERE category_id = {$category_id}");

        return null;
    }

    /*
     *
     * posts
     *
     */

    public function posts() {
        return array(
            'posts' => $this->getPostsQuery(),
            'total' => $this->getPostsQuery(true)
        );
    }

    private function getPostsQuery($total = false) {
        $start = (int)Journal2Utils::getProperty($this->get_data, 'start');
        $limit = (int)Journal2Utils::getProperty($this->get_data, 'limit');

        if ($total) {
            $sql = "
                SELECT
                    COUNT(*) as num
            ";
        } else {
            $sql = "
                SELECT
                    p.post_id,
                    pd.name,
                    IF(p.views IS NULL, 0, p.views) AS views ,
                    (SELECT count(*) FROM `{$this->db_prefix}journal2_blog_comments` where post_id = p.post_id) as comments
            ";
        }

        $sql .= "
            FROM `{$this->db_prefix}journal2_blog_post` p
            LEFT JOIN `{$this->db_prefix}journal2_blog_post_description` pd ON p.post_id = pd.post_id
            WHERE pd.language_id = {$this->language_id}
        ";

        if (isset($this->get_data['filter_name']) && $this->get_data['filter_name']) {
            $sql .= " AND pd.name LIKE '" . $this->db->escape($this->get_data['filter_name']) . "%'";
        }

        if (!$total && $start && $limit) {
            $start = ($start - 1) * $limit;
            $sql .= " LIMIT $start, $limit";
        }

        $query = $this->db->query($sql);

        return $total ? $query->row['num'] : $query->rows;
    }

    public function post() {
        $post_id = (int)$this->get_data['post_id'];

        $query1 = $this->db->query("
            SELECT
                image,
                comments,
                status,
                sort_order,
                date_created,
                author_id
            FROM `{$this->db_prefix}journal2_blog_post`
            WHERE post_id = {$post_id}
        ");

        $query2 = $this->db->query("
            SELECT
                language_id,
                name,
                description,
                meta_title,
                meta_keywords,
                meta_description,
                keyword,
                tags
            FROM `{$this->db_prefix}journal2_blog_post_description`
            WHERE post_id = {$post_id}
        ");

        $query3 = $this->db->query("
            SELECT
                category_id
            FROM `{$this->db_prefix}journal2_blog_post_to_category`
            WHERE post_id = {$post_id}
        ");

        $query4 = $this->db->query("
            SELECT
                p.product_id as product_id,
                pd.name as name
            FROM `{$this->db_prefix}journal2_blog_post_to_product` p
            LEFT JOIN `{$this->db_prefix}product_description` pd on pd.product_id = p.product_id
            WHERE post_id = {$post_id} AND language_id = {$this->language_id}
        ");

        $query5 = $this->db->query("
            SELECT
                store_id,
                layout_id
            FROM `{$this->db_prefix}journal2_blog_post_to_layout`
            WHERE post_id = {$post_id}
        ");

        $query6 = $this->db->query("
            SELECT
                store_id
            FROM `{$this->db_prefix}journal2_blog_post_to_store`
            WHERE post_id = {$post_id}
        ");

        $result = array(
            'name'          => array(
                'value'     => array()
            ),
            'description'   => array(),
            'meta_title'    => array(
                'value'     => array()
            ),
            'meta_keywords'    => array(
                'value'     => array()
            ),
            'meta_description' => array(
                'value'     => array()
            ),
            'keyword'          => array(
                'value'     => array()
            ),
            'tags'          => array(
                'value'     => array()
            ),
            'image'         => $query1->row['image'],
            'comments'      => $query1->row['comments'],
            'status'        => $query1->row['status'],
            'sort_order'    => $query1->row['sort_order'],
            'date_created'  => $query1->row['date_created'],
            'author_id'     => $query1->row['author_id'],
            'categories'    => array(),
            'products'      => array(),
            'layouts'       => array(),
            'store_ids'     => array()
        );

        foreach ($query2->rows as $row) {
            $result['name']['value'][$row['language_id']] = $row['name'];
            $result['description'][$row['language_id']] = $row['description'];
            $result['meta_title']['value'][$row['language_id']] = $row['meta_title'];
            $result['meta_keywords']['value'][$row['language_id']] = $row['meta_keywords'];
            $result['meta_description']['value'][$row['language_id']] = $row['meta_description'];
            $result['keyword']['value'][$row['language_id']] = $row['keyword'];
            $result['tags']['value'][$row['language_id']] = $row['tags'];
        }

        foreach ($query3->rows as $row) {
            $result['categories'][] = array(
                'category_id' => $row['category_id']
            );
        }

        foreach ($query4->rows as $row) {
            $result['products'][] = array(
                'data' => array(
                    'id'    => $row['product_id'],
                    'name'  => $row['name']
                )
            );
        }

        foreach ($query5->rows as $row) {
            $result['layouts']['s_' . $row['store_id']] = $row['layout_id'];
        }

        foreach ($query6->rows as $row) {
            $result['store_ids'][] = $row['store_id'];
        }

        return $result;
    }

    public function create_post() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        $image = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'image', ''));
        $comments =  (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'comments', ''));
        $status =  (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'status', ''));
        $sort_order = (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'sort_order', ''));
        $author_id =  (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'author_id', ''));

        $this->db->query("
            INSERT INTO `{$this->db_prefix}journal2_blog_post`
                (image, comments, status, sort_order, date_created, author_id)
            VALUES
                ('{$image}', {$comments}, {$status}, {$sort_order}, NOW(), {$author_id})
        ");

        $post_id = $this->db->getLastId();

        $this->edit_post_data($post_id);

        return $post_id;
    }

    public function edit_post() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        $post_id = (int)$this->get_data['post_id'];

        $image = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'image', ''));
        $comments =  (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'comments', ''));
        $status =  (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'status', ''));
        $sort_order = (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'sort_order', ''));
        $author_id = (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'author_id', ''));

        $this->db->query("
            UPDATE `{$this->db_prefix}journal2_blog_post` SET
                image = '{$image}',
                comments = {$comments},
                status = {$status},
                sort_order = {$sort_order},
                author_id = {$author_id},
                date_updated = NOW()
            WHERE post_id = {$post_id}
        ");

        $date_created = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'date_created', ''));

        if ($date_created) {
            $this->db->query("UPDATE `{$this->db_prefix}journal2_blog_post` SET date_created = '{$date_created}' WHERE post_id = {$post_id}");
        }

        $this->edit_post_data($post_id);

        return null;
    }

    private function edit_post_data($post_id) {
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post_description` WHERE post_id = {$post_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post_to_category` WHERE post_id = {$post_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post_to_product` WHERE post_id = {$post_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post_to_layout` WHERE post_id = {$post_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post_to_store` WHERE post_id = {$post_id}");

        $languages = $this->model_localisation_language->getLanguages();

        foreach ($languages as $language) {
            $language_id = (int)$language['language_id'];
            $name = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'name.value.' . $language['language_id'], ''));
            $description = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'description.' . $language['language_id'], ''));
            $meta_title = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'meta_title.value.' . $language['language_id'], ''));
            $meta_keywords = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'meta_keywords.value.' . $language['language_id'], ''));
            $meta_description = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'meta_description.value.' . $language['language_id'], ''));
            $keyword = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'keyword.value.' . $language['language_id'], ''));
            $tags = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'tags.value.' . $language['language_id'], ''));
            $this->db->query("
                INSERT INTO `{$this->db_prefix}journal2_blog_post_description`
                    (post_id, language_id, name, description, meta_title, meta_keywords, meta_description, keyword, tags)
                VALUES
                    ({$post_id}, {$language_id}, '{$name}', '{$description}', '{$meta_title}', '{$meta_keywords}', '{$meta_description}', '{$keyword}', '{$tags}')
            ");
        }

        /* categories */
        $categories = array();
        foreach (Journal2Utils::getProperty($this->post_data, 'categories', array()) as $category) {
            if ($category_id = Journal2Utils::getProperty($category, 'category_id')) {
                $categories[] = (int)$category_id;
            }
        }
        $categories = array_unique($categories);

        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post_to_category` WHERE post_id = {$post_id}");
        foreach ($categories as $category_id) {
            $this->db->query("
                INSERT INTO `{$this->db_prefix}journal2_blog_post_to_category`
                    (post_id, category_id)
                VALUES
                    ({$post_id}, {$category_id})
            ");
        }

        foreach (Journal2Utils::getProperty($this->post_data, 'stores', array()) as $store_id => $value) {
            if ((int)$value) {
                $store_id   = (int)str_replace('s_', '', $store_id);
                $this->db->query("
                    INSERT INTO `{$this->db_prefix}journal2_blog_post_to_store`
                        (post_id, store_id)
                    VALUES
                        ({$post_id}, {$store_id})
                ");
            }
        }

        /* products */
        $products = array();
        foreach (Journal2Utils::getProperty($this->post_data, 'products', array()) as $product) {
            if ($product_id = Journal2Utils::getProperty($product, 'data.id')) {
                $products[] = (int)$product_id;
            }
        }
        $products = array_unique($products);

        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post_to_product` WHERE post_id = {$post_id}");
        foreach ($products as $product_id) {
            $this->db->query("
                INSERT INTO `{$this->db_prefix}journal2_blog_post_to_product`
                    (post_id, product_id)
                VALUES
                    ({$post_id}, {$product_id})
            ");
        }

        /* layouts */
        foreach (Journal2Utils::getProperty($this->post_data, 'layouts', array()) as $store_id => $layout_id) {
            $store_id   = (int)str_replace('s_', '', $store_id);
            $layout_id  = (int)$layout_id;
            $this->db->query("
                INSERT INTO `{$this->db_prefix}journal2_blog_post_to_layout`
                    (post_id, store_id, layout_id)
                VALUES
                    ({$post_id}, {$store_id}, {$layout_id})
            ");
        }
    }

    public function delete_post() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        $post_id = (int)$this->get_data['post_id'];

        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post` WHERE post_id = {$post_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post_description` WHERE post_id = {$post_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post_to_category` WHERE post_id = {$post_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post_to_layout` WHERE post_id = {$post_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post_to_store` WHERE post_id = {$post_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_post_to_product` WHERE post_id = {$post_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_comments` WHERE post_id = {$post_id}");

        return null;
    }

    /* authors */
    public function authors() {
        $sql = "
            SELECT
                user_id,
                username,
                firstname,
                lastname
            FROM `{$this->db_prefix}user` u
        ";

        $query = $this->db->query($sql);

        return $query->rows;
    }

    /* comments */
    public function comments() {
        return array(
            'comments'  => $this->getCommentsQuery(),
            'total'     => $this->getCommentsQuery(true)
        );
    }

    private function getCommentsQuery($total = false) {
        $post_id    = (int)$this->db->escape(Journal2Utils::getProperty($this->get_data, 'post_id', -1));
        $status     = (int)$this->db->escape(Journal2Utils::getProperty($this->get_data, 'status', -1));
        $type       = (int)$this->db->escape(Journal2Utils::getProperty($this->get_data, 'type', -1));
        $start      = (int)Journal2Utils::getProperty($this->get_data, 'start');
        $limit      = (int)Journal2Utils::getProperty($this->get_data, 'limit');

        if ($total) {
            $sql = "
                SELECT
                    count(*) as num
            ";
        } else {
            $sql = "
                SELECT
                    bc.comment_id,
                    bc.name as author,
                    bpd.name as post_name,
                    bc.parent_id as parent_id,
                    bc.status as status
            ";
        }
        $sql .= "
            FROM `{$this->db_prefix}journal2_blog_comments` bc
            LEFT JOIN `{$this->db_prefix}journal2_blog_post_description` bpd ON bc.post_id = bpd.post_id
            WHERE
                bpd.language_id = {$this->language_id}
        ";

        if ($post_id > 0) {
            $sql .= " AND bc.post_id = {$post_id}";
        }

        if ($status >= 0) {
            $sql .= " AND bc.status = {$status}";
        }

        if ($type === 0) {
            $sql .= " AND bc.parent_id = 0";
        }

        if ($type > 0) {
            $sql .= " AND bc.parent_id > 0";
        }

        if (!$total && $start && $limit) {
            $start = ($start - 1) * $limit;
            $sql .= " LIMIT $start, $limit";
        }

        $query = $this->db->query($sql);

        return $total ? $query->row['num'] : $query->rows;
    }

    public function comment() {
        $comment_id = (int)$this->get_data['comment_id'];

        $query = $this->db->query("
            SELECT
                *
            FROM `{$this->db_prefix}journal2_blog_comments` bc
            WHERE bc.comment_id = {$comment_id}
        ");

        return $query->row;
    }

    public function edit_comment() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        $comment_id = (int)$this->get_data['comment_id'];

        $name       = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'name', ''));
        $website    = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'website', ''));
        $email      = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'email', ''));
        $comment    = $this->db->escape(Journal2Utils::getProperty($this->post_data, 'comment.value.text', ''));
        $status     =  (int)$this->db->escape(Journal2Utils::getProperty($this->post_data, 'status', ''));

        $this->db->query("
            UPDATE `{$this->db_prefix}journal2_blog_comments` SET
                name    = '{$name}',
                website = '{$website}',
                email   = '${email}',
                comment = '{$comment}',
                status  = {$status}
            WHERE comment_id = {$comment_id}
        ");

        return null;
    }

    public function delete_comment() {
        if (!$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        $comment_id = (int)$this->get_data['comment_id'];

        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_comments` WHERE comment_id = {$comment_id}");
        $this->db->query("DELETE FROM `{$this->db_prefix}journal2_blog_comments` WHERE parent_id = {$comment_id}");

        return null;
    }

    /* install / uninstall */

    public function install($permissions = false) {
        if (!$permissions && !$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_blog_category` (
            `category_id` int(11) NOT NULL AUTO_INCREMENT,
            `parent_id` int(11),
            `image` varchar(256),
            `status` tinyint(1),
            `sort_order` int(11),
            PRIMARY KEY (`category_id`)
        ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_blog_category_description` (
            `category_id` int(11),
            `language_id` int(11),
            `name` varchar(256),
            `description` text,
            `meta_title` varchar(256),
            `meta_keywords` varchar(256),
            `meta_description` text,
            `keyword` varchar(256),
            PRIMARY KEY (`category_id`,`language_id`)
        ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_blog_category_to_layout` (
            `category_id` int(11) NOT NULL AUTO_INCREMENT,
            `store_id` int(11),
            `layout_id` int(11),
            PRIMARY KEY (`category_id`, `store_id`),
            KEY (`layout_id`)
        ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_blog_category_to_store` (
            `category_id` int(11),
            `store_id` int(11)
        ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_blog_post` (
            `post_id` int(11) NOT NULL AUTO_INCREMENT,
            `author_id` int(11),
            `image` varchar(256),
            `comments` tinyint(1),
            `status` tinyint(1),
            `sort_order` int(11),
            `date_created` datetime,
            `date_updated` datetime,
            `views` int(11),
            PRIMARY KEY (`post_id`)
        ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_blog_post_description` (
            `post_id` int(11),
            `language_id` int(11),
            `name` varchar(256),
            `description` text,
            `meta_title` varchar(256),
            `meta_keywords` varchar(256),
            `meta_description` text,
            `keyword` varchar(256),
            `tags` varchar(256),
            PRIMARY KEY (`post_id`,`language_id`)
        ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_blog_post_to_category` (
            `post_id` int(11),
            `category_id` int(11),
            PRIMARY KEY (`post_id`,`category_id`)
        ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_blog_post_to_layout` (
            `post_id` int(11) NOT NULL AUTO_INCREMENT,
            `store_id` int(11),
            `layout_id` int(11),
            PRIMARY KEY (`post_id`, `store_id`),
            KEY (`layout_id`)
        ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_blog_post_to_store` (
            `post_id` int(11),
            `store_id` int(11)
        ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_blog_post_to_product` (
            `post_id` int(11),
            `product_id` int(11),
            PRIMARY KEY (`post_id`,`product_id`)
        ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

        $this->db->query('CREATE TABLE IF NOT EXISTS `' . DB_PREFIX . 'journal2_blog_comments` (
            `comment_id` int(11) NOT NULL AUTO_INCREMENT,
            `parent_id` int(11),
            `post_id` int(11),
            `customer_id` int(11),
            `author_id` int(11),
            `name` varchar(256),
            `email` varchar(256),
            `website` varchar(256),
            `comment` text,
            `status` tinyint(1),
            `date` datetime,
            PRIMARY KEY (`comment_id`)
        ) ENGINE=MyISAM  DEFAULT CHARSET=utf8');

        $this->load->model('design/layout');

        if (!$this->db->query("SELECT layout_id FROM `{$this->db_prefix}layout_route` WHERE route = 'journal2/blog'")->num_rows) {
            $this->model_design_layout->addLayout(array(
                'name'          => 'Journal Blog',
                'layout_route'  => array(
                    array(
                        'store_id'  => 0,
                        'route'     => 'journal2/blog'
                    )
                )
            ));
        }

        if (!$this->db->query("SELECT layout_id FROM `{$this->db_prefix}layout_route` WHERE route = 'journal2/blog/post'")->num_rows) {
            $this->model_design_layout->addLayout(array(
                'name'          => 'Journal Blog Post',
                'layout_route'  => array(
                    array(
                        'store_id'  => 0,
                        'route'     => 'journal2/blog/post'
                    )
                )
            ));
        }
    }

    public function uninstall($permissions = false) {
        if (!$permissions && !$this->user->hasPermission('modify', 'module/journal2')) {
            throw new Exception('You do not have permissions to modify Journal2 module');
        }

        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_blog_comments`');
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_blog_post_to_product`');
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_blog_post_to_layout`');
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_blog_post_to_store`');
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_blog_post_to_category`');
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_blog_post_description`');
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_blog_post`');
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_blog_category_description`');
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_blog_category_to_layout`');
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_blog_category_to_store`');
        $this->db->query('DROP TABLE IF EXISTS `' . DB_PREFIX . 'journal2_blog_category`');
//        $this->db->query('DELETE FROM `' . DB_PREFIX . 'setting` WHERE `group` like "journal2_blog_%"');
    }

}