<?php 
class ModelExtensionPurpletreeMultivendorUpgradedatabase extends Model{
	public function upgradeDatabase( ){ 
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_categories_commission` (
  							`id` int(11) NOT NULL AUTO_INCREMENT,
  							`category_id` int(11) NOT NULL,
  							`commission` decimal(4,2) NOT NULL,
							`commison_fixed` double NOT NULL,
  							`seller_group` int(50) NOT NULL DEFAULT '1',
  							PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
						");	
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_shipping` (
							`id` int(11) NOT NULL AUTO_INCREMENT,
							`seller_id` int(11) NOT NULL,
							`shipping_country` int(11) NOT NULL,
							`zipcode_from` varchar(11) NOT NULL,
							`zipcode_to` varchar(11) NOT NULL,
							`shipping_price` decimal(15,2) NOT NULL,
							`weight_from` decimal(15,2) NOT NULL,
							`weight_to` decimal(15,2) NOT NULL,
							`max_days` int(11) NOT NULL,
							PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
						");
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_downloads` (
  							`id` int(11) NOT NULL AUTO_INCREMENT,
  							`download_id` int(11) NOT NULL,
  							`seller_id` int(11) NOT NULL,
  							PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
						");
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_contact` (
							  `id` int(10) NOT NULL AUTO_INCREMENT,
							  `seller_id` int(10) NOT NULL,
							  `customer_id` int(10) NOT NULL,
							  `contact_from` int(10) NOT NULL,
							  `customer_name` varchar(150) NOT NULL,
							  `customer_email` varchar(150) NOT NULL,
							  `customer_message` text NOT NULL,
							  `created_at` datetime NOT NULL,
							  `updated_at` datetime NOT NULL,
							  `seen` int(11) NOT NULL DEFAULT '1',
							  PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
					");
		  $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_stores` CHANGE `store_commission` `store_commission` float(6,4) NULL DEFAULT NULL");
		$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_stores` LIKE 'document'");
	 if (!$field_query->num_rows) {
		   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_stores`  ADD `document` VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL  AFTER `store_banner`");
		}
	$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_stores` LIKE 'store_shipping_type'");
	 if (!$field_query->num_rows) {
		  $this->db->query(" ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_stores`  ADD `store_shipping_type` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL  AFTER `store_tin`"); 
		}
    $field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_stores` LIKE 'store_shipping_order_type'");
	 if (!$field_query->num_rows) {
		  $this->db->query(" ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_stores`  ADD `store_shipping_order_type` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL  AFTER `store_shipping_type`"); 
		}	
		$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_stores` LIKE 'store_live_chat_enable'");
	 if (!$field_query->num_rows) {
		  $this->db->query(" ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_stores`  ADD `store_live_chat_enable` tinyint(1) NOT NULL AFTER `store_shipping_order_type`"); 
		}
		$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_stores` LIKE 'store_live_chat_code'");
	 if (!$field_query->num_rows) {
		  $this->db->query(" ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_stores`  ADD `store_live_chat_code` text NOT NULL AFTER `store_live_chat_enable`"); 
		}	

		$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_contact` LIKE 'customer_id'");
	 if (!$field_query->num_rows) {
		   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_contact`  ADD `customer_id` int(10) NOT NULL  AFTER `seller_id`");
		}
		$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_contact` LIKE 'contact_from'");
	 if (!$field_query->num_rows) {
		   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_contact`  ADD `contact_from` int(10) NOT NULL  AFTER `seller_id`");
		}
		
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_contact` LIKE 'seen'");
	 if (!$field_query->num_rows) {
		   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_contact`  ADD `seen` int(11) NOT NULL DEFAULT '1'  AFTER `updated_at`");
		}
											// Subscription Plan
		// Subscription Plan
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_plan_invoice_status` (
				`status_id` int(11) NOT NULL AUTO_INCREMENT,
				`created_date` datetime NOT NULL,
				`modified_date` datetime NOT NULL,
				PRIMARY KEY (`status_id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_plan_invoice_status_languge` (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`status_id` int(11) NOT NULL,
				`language_id` int(11) NOT NULL,
				`status` varchar(30) NOT NULL,
				PRIMARY KEY (`id`),FOREIGN KEY (`status_id`) REFERENCES " . DB_PREFIX . "purpletree_vendor_plan_invoice_status(`status_id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");
			
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_plan` (
				`plan_id` int(11) NOT NULL AUTO_INCREMENT,
				`no_of_product` int(11) NOT NULL,
				`no_of_featured_product` int(10) NOT NULL,
				`no_of_category_featured_product` int(10) NOT NULL,
				`featured_store` int(10) NOT NULL,
				`joining_fee` decimal(15,4) NOT NULL,
				`subscription_price` decimal(15,4) NOT NULL,
				`validity` int(11) NOT NULL,
				`default_subscription_plan` int(1) NOT NULL,
				`status` int(1) NOT NULL,
				`created_date` datetime NOT NULL,
				`modified_date` datetime NOT NULL,
				PRIMARY KEY (`plan_id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");	
			
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_plan_description` (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`plan_id` int(11) NOT NULL,
				`language_id` int(11) NOT NULL,
				`plan_name` varchar(30) NOT NULL,
				`plan_description` TEXT NOT NULL,
				`plan_short_description` TEXT NOT NULL,
				PRIMARY KEY (`id`),FOREIGN KEY (`plan_id`) REFERENCES " . DB_PREFIX . "purpletree_vendor_plan(`plan_id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");	
				
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_seller_plan` (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`invoice_id` int(11) NOT NULL,
				`plan_id` int(11) NOT NULL,
				`seller_id` int(11) NOT NULL,
				`reminder` int(1) NOT NULL,
				`status` int(1) NOT NULL,
				`start_date` datetime NOT NULL,
				`end_date` datetime NOT NULL,
				`created_date` datetime NOT NULL,
				`modified_date` datetime NOT NULL,
				PRIMARY KEY (`id`),FOREIGN KEY (`plan_id`) REFERENCES " . DB_PREFIX . "purpletree_vendor_plan(`plan_id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");	
			
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_plan_invoice` (
				`invoice_id` int(11) NOT NULL AUTO_INCREMENT,
				`seller_id` int(11) NOT NULL,
				`plan_id` int(11) NOT NULL,
				`payment_mode` varchar(30) NOT NULL,
				`status_id` int(11) NOT NULL,
				`created_date` datetime NOT NULL,
				PRIMARY KEY (`invoice_id`),FOREIGN KEY (`plan_id`) REFERENCES " . DB_PREFIX . "purpletree_vendor_plan(`plan_id`),FOREIGN KEY (`status_id`) REFERENCES " . DB_PREFIX . "purpletree_vendor_plan_invoice_status(`status_id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");	
			
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_plan_invoice_item` (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`invoice_id` int(11) NOT NULL,
				`code` varchar(30) NOT NULL,
				`title` varchar(30) NOT NULL,
				`price` decimal(15,4) NOT NULL,
				`sort_order` int(11) NOT NULL,
				PRIMARY KEY (`id`),FOREIGN KEY (`invoice_id`) REFERENCES " . DB_PREFIX . "purpletree_vendor_plan_invoice(`invoice_id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");	

				$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_plan_invoice_history` (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`invoice_id` int(11) NOT NULL,
				`status_id` int(11) NOT NULL,
				`payment_mode` varchar(30) NOT NULL,
				`transaction_id` varchar(30) NOT NULL,
				`comment` text NOT NULL,
				`created_date` datetime NOT NULL,
				`modified_date` datetime NOT NULL,
				PRIMARY KEY (`id`),FOREIGN KEY (`invoice_id`) REFERENCES " . DB_PREFIX . "purpletree_vendor_plan_invoice(`invoice_id`),FOREIGN KEY (`status_id`) REFERENCES " . DB_PREFIX . "purpletree_vendor_plan_invoice_status(`status_id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_plan_subscription` (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`seller_id` int(11) NOT NULL,
				`status_id` int(1) NOT NULL,
				`created_date` datetime NOT NULL,
				`modified_date` datetime NOT NULL,
				PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");
					// Pending
			$querry = $this->db->query("SELECT * FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice_status WHERE status_id = 1");
			if($querry->num_rows){} else {
			$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan_invoice_status SET status_id = '1', created_date = NOW(), modified_date = NOW()");
			
			$status_id = $this->db->getLastId();   
			
			$this->load->model('localisation/language');            
		    $languages = $this->model_localisation_language->getLanguages();
			
			foreach ($languages as $language_id ) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan_invoice_status_languge SET status_id = '" . (int)$status_id . "', language_id = '" . (int)$language_id['language_id'] . "', status = 'Pending'");
			}
			}
			// Pending
			// Complete
			$querry1 = $this->db->query("SELECT * FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice_status WHERE status_id = 2");
			if($querry1->num_rows){} else {
			$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan_invoice_status SET status_id = '2', created_date = NOW(), modified_date = NOW()");
			
			$status_id = $this->db->getLastId();   
			
			$this->load->model('localisation/language');            
		    $languages = $this->model_localisation_language->getLanguages();
			
			foreach ($languages as $language_id ) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan_invoice_status_languge SET status_id = '" . (int)$status_id . "', language_id = '" . (int)$language_id['language_id'] . "', status = 'Complete'");
		}
			}
			// Complete
		// Subscription Plan
		$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_plan` LIKE 'no_of_featured_product'");
			 if (!$field_query->num_rows) {
				   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_plan`  ADD `no_of_featured_product` int(10) NOT NULL  AFTER `no_of_product`");
				}	
				$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_plan` LIKE 'no_of_category_featured_product'");
			 if (!$field_query->num_rows) {
				   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_plan`  ADD `no_of_category_featured_product` int(10) NOT NULL  AFTER `no_of_featured_product`");
				}	
				$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_plan` LIKE 'featured_store'");
			 if (!$field_query->num_rows) {
				   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_plan`  ADD `featured_store` int(10) NOT NULL  AFTER `no_of_category_featured_product`");
				}
				$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_products` LIKE 'is_featured'");
			 if (!$field_query->num_rows) {
				   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_products`  ADD `is_featured` int(11) NOT NULL  AFTER `product_id`");
				}
				$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_products` LIKE 'is_category_featured'");
			 if (!$field_query->num_rows) {
				   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_products`  ADD `is_category_featured` int(11) NOT NULL  AFTER `is_featured`");
				}
		
		// Subscription Plan
		
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_plan` LIKE 'no_of_featured_product'");
			 if (!$field_query->num_rows) {
				   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_plan`  ADD `no_of_featured_product` int(10) NOT NULL  AFTER `no_of_product`");
				}	
				$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_plan` LIKE 'no_of_category_featured_product'");
			 if (!$field_query->num_rows) {
				   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_plan`  ADD `no_of_category_featured_product` int(10) NOT NULL  AFTER `no_of_featured_product`");
				}	
				$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_plan` LIKE 'featured_store'");
			 if (!$field_query->num_rows) {
				   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_plan`  ADD `featured_store` int(10) NOT NULL  AFTER `no_of_category_featured_product`");
				}
				$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_products` LIKE 'is_featured'");
			 if (!$field_query->num_rows) {
				   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_products`  ADD `is_featured` int(11) NOT NULL  AFTER `product_id`");
				}
				$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_subscription_products` (
					`id` int(11) NOT NULL AUTO_INCREMENT,
					`product_id` int(11) NOT NULL,
					`product_plan_id` int(11) NOT NULL,
					`featured_product_plan_id` int(11) NOT NULL,
					`category_featured_product_plan_id` varchar(255) NOT NULL,
					PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
				");	
				
            $field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_products` LIKE 'is_category_featured'");
			 if (!$field_query->num_rows) {
				   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_products`  ADD `is_category_featured` int(11) NOT NULL  AFTER `is_featured`");
				}					
		
		// Start seller blog
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_blog_post` (
  							`blog_post_id` int(11) NOT NULL AUTO_INCREMENT,
							`seller_id` int(11) NOT NULL,
  							`image` varchar(255) NOT NULL,
  							`author` varchar(150) NOT NULL,
  							`sort_order` int(11) NOT NULL,
							`status` tinyint(1) NOT NULL,
							`created_at` datetime NOT NULL,
  							`updated_at` datetime NOT NULL, 							
							PRIMARY KEY (`blog_post_id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
						");

						
						$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_blog_post_comment` (
  							`blog_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  							`blog_post_id` int(11) NOT NULL,
  							`name` varchar(150) NOT NULL,
  							`email_id` varchar(150) NOT NULL,
  							`text` text NOT NULL,
							`status` tinyint(1) NOT NULL,
							`created_at` datetime NOT NULL,
  							`updated_at` datetime NOT NULL,
  							PRIMARY KEY (`blog_comment_id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
						");
						
				$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_blog_post_description` (
  							`blog_post_id` int(11) NOT NULL,
  							`language_id` int(11) NOT NULL,
  							`title` varchar(255) NOT NULL,
  							`description` text NOT NULL,
							`meta_title` varchar(255) NOT NULL,
  							`meta_description` varchar(255) NOT NULL,
  							`meta_keyword` varchar(255) NOT NULL,
  							`post_tags` varchar(255) NOT NULL)
							CHARACTER SET utf8 COLLATE utf8_unicode_ci
						");
				// End seller blog
				//Commission Invoice
						$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_commission_invoice_items` (
  							`id` int(11) NOT NULL AUTO_INCREMENT,
							`link_id` int(50) NOT NULL,
  							`order_id` int(50) NOT NULL,
  							`product_id` int(50) NOT NULL,
  							`seller_id` int(50) NOT NULL,
  							`commission_fixed` int(50) NOT NULL DEFAULT '0',
  							`commission_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  							`commission_shipping` decimal(4,2) NOT NULL DEFAULT '0.00',
  							`total_commission` float(8,2) NOT NULL,
  							PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
						");
						$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_commission_invoice` (
  							`id` int(11) NOT NULL AUTO_INCREMENT,
							`total_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
							`total_commission` decimal(11,2) NOT NULL DEFAULT '0.00',
							`total_pay_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  							`created_at` date NOT NULL,
  							PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
						");
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_categories_commission` LIKE 'commison_fixed'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_categories_commission`  ADD `commison_fixed` double NOT NULL AFTER `commission`");
			}
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_categories_commission` LIKE 'seller_group'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_categories_commission`  ADD `seller_group` int(50) NOT NULL DEFAULT '1' AFTER `commison_fixed`");
			}
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_commissions` LIKE 'commission_fixed'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_commissions`  ADD `commission_fixed` int(50) NOT NULL DEFAULT '0' AFTER `product_id`");
			}
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_commissions` LIKE 'commission_percent'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_commissions`  ADD `commission_percent` decimal(4,2) NOT NULL DEFAULT '0.00' AFTER `commission_fixed`");
			}
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_commissions` LIKE 'commission_shipping'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_commissions`  ADD `commission_shipping` float(8,2) NOT NULL DEFAULT '0.00' AFTER `commission_percent`");
			}
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_payments` LIKE 'invoice_id'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_payments`  ADD `invoice_id` int(11) NOT NULL AFTER `id`");
			}
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_payment_settlement_history` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`invoice_id` int(11) NOT NULL,
			`status_id` int(11) NOT NULL,
			`payment_mode` varchar(50) NOT NULL,
			`transaction_id` varchar(50) NOT NULL,
			`comment` text NOT NULL,
			`created_date` datetime NOT NULL,
			`modified_date` datetime NOT NULL, 	
			PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");	
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_commissions` LIKE 'invoice_status'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_commissions`  ADD `invoice_status` int(50) NOT NULL DEFAULT '0' AFTER `commission_shipping`");
			}
			
				//Commission Invoice
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_stores` LIKE 'seller_paypal_id'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_stores`  ADD `seller_paypal_id` varchar(50) NOT NULL  AFTER `store_updated_at`");
			}
			
			// new_status
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_seller_plan` LIKE 'new_status'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_seller_plan`  ADD `new_status` int(1) NOT NULL  AFTER `status`");
			}

			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_seller_plan` LIKE 'new_end_date'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_seller_plan`  ADD `new_end_date` datetime NOT NULL  AFTER `end_date`");
			$this->db->query(" UPDATE " . DB_PREFIX . "purpletree_vendor_seller_plan SET new_status=status, new_end_date=end_date");
			}
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_social_links` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`store_id` int(11) NOT NULL,
			`facebook_link` varchar(255) NOT NULL,
			`google_link` varchar(255) NOT NULL,
			`instagram_link` varchar(255) NOT NULL,
			`twitter_link` varchar(255) NOT NULL,
			`pinterest_link` varchar(255) NOT NULL,
			`wesbsite_link` varchar(255) NOT NULL,	
			`whatsapp_link` varchar(255) NOT NULL,	
			PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_enquiries` (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`seller_id` int(11) NOT NULL,
				`contact_from` int(11) NOT NULL,
				`message` varchar(250) NOT NULL,
				`created_at` datetime NOT NULL,
				`updated_at` datetime NOT NULL, 	
				PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");
			
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_social_links` LIKE 'whatsapp_link'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_social_links`  ADD `whatsapp_link` varchar(255) NOT NULL  AFTER `wesbsite_link`");
			}
			
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_plan` LIKE 'default_subscription_plan'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_plan`  ADD `default_subscription_plan` int(1) NOT NULL  AFTER `validity`");
			}
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_seller_plan` LIKE 'reminder2'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_seller_plan`  ADD `reminder2` int(1) NOT NULL  AFTER `reminder`");
			}
			
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_seller_plan` LIKE 'reminder1'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_seller_plan`  ADD `reminder1` int(1) NOT NULL  AFTER `reminder`");
			}

			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_orders` LIKE 'seen'");
			if (!$field_query->num_rows) {
			   $this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_orders`  ADD `seen` int(11) NOT NULL DEFAULT '1'  AFTER `updated_at`");
			}
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_template` (
						`id` int(11) NOT NULL AUTO_INCREMENT,
						`product_id` int(11) NOT NULL,
						`status` tinyint(1) NOT NULL DEFAULT '0',		
						PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");				
/* 	$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_allowed_category` (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`seller_id` int(11) NOT NULL,
				`category_id` varchar(255) NOT NULL,
				`type` tinyint(1) NOT NULL DEFAULT '1',				
				PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
		"); */			
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_template_products` (				
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`template_id` int(11) NOT NULL,
				`seller_id` int(11) NOT NULL,
				`quantity` int(4) NOT NULL DEFAULT '0',
				`price` decimal(15,4) NOT NULL DEFAULT '0.0000',
				`stock_status_id` int(11) NOT NULL,
				`subtract` tinyint(1) NOT NULL DEFAULT '1',
				`status` tinyint(1) NOT NULL DEFAULT '0',				
				PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
			");	
            $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_cart` (				
				`id` int(11) NOT NULL AUTO_INCREMENT,
                `cart_id` int(11) NOT NULL,
                `seller_id` int(11) NOT NULL,				
				PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
		    ");		

		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "purpletree_vendor_adaptive_paykey` (
							`id` int(11) NOT NULL AUTO_INCREMENT,
							`order_id` int(11) NOT NULL,
							`payment_key` VARCHAR(50) NOT NULL,
							PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_unicode_ci
						");
			$field_query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "purpletree_vendor_stores` LIKE 'multi_store_id'");
			if (!$field_query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "purpletree_vendor_stores`  ADD `multi_store_id` int(11) NOT NULL  AFTER `seller_paypal_id`");
			}							
			
	}
	
}
?>