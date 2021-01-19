<?php
class ModelExtensionPurpletreeMultivendorSubscriptionplanpendinginvoice extends Model {
	
	public function getSellerInvoiceList($data = array()){
		$sql = "SELECT pvsp.id,CONCAT(c.firstname, ' ', c.lastname) AS seller_name,pvp.validity,pvsp.invoice_id,pvpd.plan_name,pvsp.reminder,pvsp.start_date,pvsp.end_date,pvsp.created_date,pvsp.modified_date,pvpisl.status,pvpi.seller_id FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan pvp ON(pvp.plan_id=pvsp.plan_id) LEFT JOIN ".DB_PREFIX."purpletree_vendor_plan_invoice pvpi ON(pvpi.invoice_id = pvsp.invoice_id) LEFT JOIN `".DB_PREFIX."purpletree_vendor_plan_invoice_status_languge` pvpisl ON (pvpisl.status_id = pvpi.status_id) WHERE pvpi.status_id ='1'";

		$sql .= " GROUP BY pvpi.invoice_id";
		$sql .= " ORDER BY pvsp.start_date DESC";
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
		if($query->num_rows>0){
				return $query->rows;
			}else {
				return NULL;
			}
		
	}
	
		public function getTotalSellerInvoice($data = array()){
		$sql = "SELECT pvsp.id,CONCAT(c.firstname, ' ', c.lastname) AS seller_name,pvp.validity,pvsp.invoice_id,pvpd.plan_name,pvsp.reminder,pvsp.start_date,pvsp.end_date,pvsp.created_date,pvsp.modified_date,pvpisl.status,pvpi.seller_id FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan pvp ON(pvp.plan_id=pvsp.plan_id) LEFT JOIN ".DB_PREFIX."purpletree_vendor_plan_invoice pvpi ON(pvpi.invoice_id = pvsp.invoice_id) LEFT JOIN `".DB_PREFIX."purpletree_vendor_plan_invoice_status_languge` pvpisl ON (pvpisl.status_id = pvpi.status_id) WHERE pvpi.status_id ='1'";

		$sql .= " GROUP BY pvpi.invoice_id";
		$sql .= " ORDER BY pvsp.start_date ASC";
		
		$query = $this->db->query($sql);
			if($query->num_rows>0){
					return $query->num_rows;
			}else {
				return NULL;
			}
	}
/* 	public function getInvoiceStatus($invoice_id){
		$query = $this->db->query("SELECT pvpisl.status FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice pvpi LEFT JOIN `".DB_PREFIX."purpletree_vendor_plan_invoice_status` pvpis ON (pvpis.status_id= pvpi.status_id) LEFT JOIN `".DB_PREFIX."purpletree_vendor_plan_invoice_status_languge` pvpisl ON (pvpisl.status_id = pvpis.status_id) WHERE pvpisl.language_id='". (int)$this->config->get('config_language_id') ."' AND pvpi.invoice_id='".$invoice_id."'");
		
		if($query->num_rows){
			return $query->row['status'];
		} else { 
			return '';
		}
	} */
		public function getSubscriptionBySellerId($seller_id){
		$query = $this->db->query("SELECT status_id FROM " . DB_PREFIX . "purpletree_vendor_plan_subscription WHERE seller_id='".$seller_id."'");
		
		if($query->num_rows){
			return $query->row['status_id'];
		} else { 
			return NULL;
		}
	}
	
}