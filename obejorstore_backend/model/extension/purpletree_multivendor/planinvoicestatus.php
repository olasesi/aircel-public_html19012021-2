<?php
class ModelExtensionPurpletreeMultivendorPlaninvoicestatus extends Model {
	
	public function addSubscriptionplaninvoicestatus($data) {		
		$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan_invoice_status SET created_date = NOW(), modified_date = NOW()");
		
		$status_id = $this->db->getLastId();
		
		foreach ($data['subscriptionplan_invoice_status'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan_invoice_status_languge SET status_id = '" . (int)$status_id . "', language_id = '" . (int)$language_id . "', status = '" . $this->db->escape($value['invoice_status']) ."'");
		}
	}
	
	public function editSubscriptionplaninvoicestatus($status_id, $data) {		
			$this->db->query("DELETE FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice_status_languge WHERE status_id = '" . (int)$status_id . "'");
		foreach ($data['subscriptionplan_invoice_status'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan_invoice_status_languge SET status_id = '" . (int)$status_id . "', language_id = '" . (int)$language_id . "', status = '" . $this->db->escape($value['invoice_status']) ."'");
		}		
	}
 
	 public function deleteSubscriptionplaninvoicestatus($status_id) { 	 
			
			$this->db->query("DELETE FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice_status_languge WHERE status_id = '" . (int)$status_id . "'");
			
			$this->db->query("DELETE FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice_status WHERE status_id = '" . (int)$status_id . "'");
			
		}
	

	public function getSubscriptionplaninvoicestatus($data) {	

		$sql = "SELECT DISTINCT pvpis.*,pvpisl.status AS invoice_status FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice_status pvpis JOIN " . DB_PREFIX . "purpletree_vendor_plan_invoice_status_languge pvpisl ON (pvpis.status_id = pvpisl.status_id) WHERE  pvpisl.language_id = '" . (int)$this->config->get('config_language_id') . "'";		

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
	public function getInvoicestatus($status_id) {
		$invoice_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice_status_languge WHERE status_id = '" . (int)$status_id . "'");

		foreach ($query->rows as $result) {
			$invoice_data[$result['language_id']] = array(
				'invoice_status'             => $result['status']				
			);
		}
		return $invoice_data;
	}
	

	public function getTotalSubscriptionplaninvoicestatus() {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice_status";		
		$query = $this->db->query($sql);

		return $query->row['total'];
	}
        
}
?>