<?php
class ModelExtensionPurpletreeMultivendorSubcriptionplan extends Model {
	public function addSubscriptionPlan($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan SET no_of_product = '" . (int)$data['no_of_product'] . "',`featured_store` = '" . (int)$data['featured_store'] . "', `joining_fee` = '" . (int)$data['joining_fee'] . "', no_of_featured_product = '" . (int)$data['no_of_featured_product'] . "', no_of_category_featured_product = '" . (int)$data['no_of_category_featured_product'] . "', subscription_price = '" . (int)$data['subscription_price'] . "', validity = '" . (int)$data['validity'] . "',status = '" . (int)$data['status'] . "',default_subscription_plan = '" . (int)$data['default_subscription_plan'] . "', modified_date = NOW(), created_date = NOW()");
		$plan_id = $this->db->getLastId();
		
		if($data['default_subscription_plan']==1){
			$this->db->query("UPDATE " . DB_PREFIX . "purpletree_vendor_plan SET default_subscription_plan = '0' WHERE plan_id != '".(int)$plan_id."'");
		}
		foreach ($data['subscription'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan_description SET plan_id = '" . (int)$plan_id . "', language_id = '" . (int)$language_id . "', plan_name = '" . $this->db->escape($value['name']) . "', plan_description = '" . $this->db->escape($value['description']) . "', plan_short_description = '" . $this->db->escape($value['short_description']) . "'");
		}
	}

	
		public function editSubscriptionPlan($plan_id,$data) {

		$this->db->query("UPDATE " . DB_PREFIX . "purpletree_vendor_plan SET no_of_product = '" . (int)$data['no_of_product'] . "', joining_fee = '" . (int)$data['joining_fee'] . "',featured_store = '" . (int)$data['featured_store'] . "',no_of_featured_product = '" . (int)$data['no_of_featured_product'] . "',no_of_category_featured_product = '" . (int)$data['no_of_category_featured_product'] . "', subscription_price = '" . (int)$data['subscription_price'] . "', validity = '" . (int)$data['validity'] . "',status = '" . (int)$data['status'] . "',default_subscription_plan = '" . (int)$data['default_subscription_plan'] . "', modified_date = NOW() WHERE plan_id='". (int)$plan_id."'");
		//$plan_id = $this->db->getLastId();
		
			if($data['default_subscription_plan']==1){
			$this->db->query("UPDATE " . DB_PREFIX . "purpletree_vendor_plan SET default_subscription_plan = '0' WHERE plan_id != '".(int)$plan_id."'");
		}
			$this->db->query("DELETE FROM " . DB_PREFIX . "purpletree_vendor_plan_description WHERE plan_id = '" . (int)$plan_id . "'");
		foreach ($data['subscription'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan_description SET plan_id = '" . (int)$plan_id . "', language_id = '" . (int)$language_id . "', plan_name = '" . $this->db->escape($value['name']) . "', plan_description = '" . $this->db->escape($value['description']) . "', plan_short_description = '" . $this->db->escape($value['short_description']) . "'");
		}
	}


	
		public function getSubscriptionPlan($data = array()) {
			
			$sql="SELECT pvp.status,pvp.default_subscription_plan,pvp.no_of_featured_product,pvp.featured_store,pvp.no_of_category_featured_product,pvp.no_of_product,pvp.plan_id,pvp.no_of_product,pvp.joining_fee,pvp.subscription_price,pvp.validity,pvp.created_date,pvp.modified_date,pvpd.plan_name,pvpd.plan_description,pvpd.plan_short_description  FROM ". DB_PREFIX ."purpletree_vendor_plan pvp LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan_description pvpd ON (pvp.plan_id=pvpd.plan_id) WHERE pvpd.language_id='".(int)$this->config->get('config_language_id') ."'";
			

		$query = $this->db->query($sql);

		return $query->rows;
	}
	
	
		public function getplanDescriptions($plan_id) {
		$plan_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purpletree_vendor_plan_description WHERE plan_id = '" . (int)$plan_id . "'");

		foreach ($query->rows as $result) {
			$plan_description_data[$result['language_id']] = array(
				'name'             => $result['plan_name'],
				'description' => $result['plan_description'],
				'short_description'     => $result['plan_short_description']
			);
		}

		return $plan_description_data;
	}
	
			public function getplan($plan_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purpletree_vendor_plan WHERE plan_id = '" . (int)$plan_id . "'");

		return $query->row;
	}
	public function deleteSubscriptionPlan($plan_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "purpletree_vendor_plan_description WHERE plan_id = '" . (int)$plan_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "purpletree_vendor_plan WHERE plan_id = '" . (int)$plan_id . "'");		
		
	}
	public function checkSubscriptionPlan($plan_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purpletree_vendor_seller_plan WHERE plan_id = '" . (int)$plan_id . "'");

		if($query->rows){
			return $query->row;
		}else{
			return NULL;
		}
	}
	public function defaultPlan() {
				$query=$this->db->query("SELECT plan_id FROM ". DB_PREFIX ."purpletree_vendor_plan WHERE default_subscription_plan=1");
					if($query->num_rows){
					return $query->row['plan_id'];
					} else { 
					return NULL;
					}
			}
	
}