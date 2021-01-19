<?php 
class ModelExtensionPurpletreeMultivendorCommissioninvoice extends Model{
	
	public function getInvoiceStatusID($id){		
		
		$sql = "SELECT status_id  FROM " . DB_PREFIX . "purpletree_vendor_payment_settlement_history WHERE invoice_id = '".(int)$id."'";
		$sql .= " ORDER BY id DESC";
		$sql .= " LIMIT 0,1";
		$query  = $this->db->query($sql);		
		if ($query->num_rows) {
			return $query->row['status_id'];
			}
			return false;		
	  }	
	
	public function getSellerstore() {		
		$sql = "SELECT pvs.seller_id,pvs.store_name FROM " . DB_PREFIX . "purpletree_vendor_stores pvs LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = pvs.seller_id) WHERE c.status=1 AND pvs.store_status=1";		

		$query = $this->db->query($sql);      
		return $query->rows;
	
	}
	
	public function getCommissionsInvoice($id){
		
		$sql = "SELECT * FROM " . DB_PREFIX . "purpletree_vendor_commission_invoice pvc WHERE id = '".(int)$id."'";		
		$query  = $this->db->query($sql);
		return $query->rows;
	}
	
	public function getDefaultstatus(){
		
		
		$sql = "SELECT status FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice_status_languge WHERE status_id = '1'";
       $sql .= " AND language_id = '" . (int)$this->config->get('config_language_id') . "'";	
		
		$query  = $this->db->query($sql);
		if ($query->num_rows) {
			return $query->row['status'];
			}
			return false;		
	}
		public function getInvoiceStatus($id){
		
		
		$sql = "SELECT status FROM " . DB_PREFIX . "purpletree_vendor_payments WHERE invoice_id = '".(int)$id."'";
		$query  = $this->db->query($sql);
		if ($query->num_rows) {
			return $query->row['status'];
			}
			return false;		
	  }
	
	public function getStoreDetail($customer_id){
		$query = $this->db->query("SELECT pvs.* FROM " . DB_PREFIX . "purpletree_vendor_stores pvs where pvs.seller_id='".(int)$customer_id."'");
		return $query->row;
	}
	public function savelinkid($total_price,$total_commission,$total_pay_amount){
		$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_commission_invoice SET total_amount='".(float)$total_price."',total_commission='".(float)$total_commission."', total_pay_amount='".(float)$total_pay_amount."', created_at ='".date('Y-m-d')."'");
		return $this->db->getLastId();
	}
	public function getiinvoiceitems($lnk_id = NULL){
		$sql = "SELECT * FROM " . DB_PREFIX . "purpletree_vendor_commission_invoice_items pvc WHERE link_id = ".$lnk_id;
		$query  = $this->db->query($sql);
		return $query->rows;
	}
	public function getinvoicedate($lnk_id = NULL){
		$sql = "SELECT `created_at` FROM " . DB_PREFIX . "purpletree_vendor_commission_invoice pvc WHERE id = ".$lnk_id;
		$query  = $this->db->query($sql);
		return $query->row;
	}
	
	public function saveCommisionInvoice($data=array(),$link_id = NULL){

		$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_commission_invoice_items SET order_id ='".(int)$data['order_id']."', product_id='".(int)$data['product_id']."', seller_id='".(int)$data['seller_id']."', commission_fixed='".(int)$data['commission_fixed']."', commission_percent='".(float)$data['commission_percent']."', commission_shipping='".(float)$data['commission_shipping']."', total_commission ='".(int)$data['commission']."', link_id ='".(int)$link_id."'");
		$this->db->query("UPDATE " . DB_PREFIX . "purpletree_vendor_commissions SET invoice_status = 1 WHERE id='".(int)$data['id']."'");
	} 
		public function getCommissions($data=array()){
		
		$sql = "SELECT pvc.id,pvc.created_at,pvs.store_name FROM " . DB_PREFIX . "purpletree_vendor_commission_invoice pvc LEFT JOIN ". DB_PREFIX ."purpletree_vendor_commission_invoice_items pvcii ON (pvc.id = pvcii.link_id )LEFT JOIN ". DB_PREFIX ."purpletree_vendor_stores pvs ON (pvcii.seller_id = pvs.seller_id ) WHERE pvc.id != ''";
		if ($data['seller_id']!=0) {
		  $sql .= " AND pvcii.seller_id = '".(int)$data['seller_id']."'";
		}

		if (!empty($data['filter_date_from'])) {
			$sql .= " AND DATE(pvc.created_at) >= DATE('" . $this->db->escape($data['filter_date_from']) . "')";
		}

		if (!empty($data['filter_date_to'])) {
			$sql .= " AND DATE(pvc.created_at) <= DATE('" . $this->db->escape($data['filter_date_to']) . "')";
		}
		if(!isset($data['filter_date_from']) && !isset($data['filter_date_to'])){
			$end_date = date('Y-m-d', strtotime("-30 days"));
			$sql .= " AND DATE(pvc.created_at) >= '".$end_date."'";
			$sql .= " AND DATE(pvc.created_at) <= '".date('Y-m-d')."'";
		}
		
		$sql .= " GROUP BY pvc.id ORDER BY pvc.id DESC";
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		
		$query  = $this->db->query($sql);
		return $query->rows;
	}
		public function getTotalCommissionsinvoices($data=array()){
		
			$sql = "SELECT COUNT(*) as total FROM " . DB_PREFIX . "purpletree_vendor_commission_invoice pvc LEFT JOIN ". DB_PREFIX ."purpletree_vendor_commission_invoice_items pvcii ON (pvc.id = pvcii.link_id )LEFT JOIN ". DB_PREFIX ."purpletree_vendor_stores pvs ON (pvcii.seller_id = pvs.seller_id ) WHERE pvc.id != ''";
		if ($data['seller_id']!=0) {
		  $sql .= " AND pvcii.seller_id = '".(int)$data['seller_id']."'";
		}

		if (!empty($data['filter_date_from'])) {
			$sql .= " AND DATE(pvc.created_at) >= DATE('" . $this->db->escape($data['filter_date_from']) . "')";
		}

		if (!empty($data['filter_date_to'])) {
			$sql .= " AND DATE(pvc.created_at) <= DATE('" . $this->db->escape($data['filter_date_to']) . "')";
		}
		if(!isset($data['filter_date_from']) && !isset($data['filter_date_to'])){
			$end_date = date('Y-m-d', strtotime("-30 days"));
			$sql .= " AND DATE(pvc.created_at) >= '".$end_date."'";
			$sql .= " AND DATE(pvc.created_at) <= '".date('Y-m-d')."'";
		}
		
		$sql .= " GROUP BY pvc.id ORDER BY pvc.id DESC";
		
		
		$query  = $this->db->query($sql);
		if($query->num_rows) {
		return $query->row['total'];
		} else {
			return '0';
		}
	}
		public function getCustomFieldIdFromName($optionName) {
		$query = $this->db->query("SELECT cfd.custom_field_id FROM " . DB_PREFIX . "custom_field_description cfd WHERE cfd.name = '". $this->db->escape($optionName) . "' AND cfd.language_id = '" . (int)$this->config->get('config_language_id')."'");
		if ($query->num_rows) {
			return $query->row['custom_field_id'];
		}
		return false;
	}
			public function getvatfromid($customeridd) {
				$query = $this->db->query("SELECT c.custom_field FROM " . DB_PREFIX . "customer c WHERE c.customer_id = '" . (int)$customeridd."'");
				if ($query->num_rows) {
					return $query->row['custom_field'];
				}
				return false;
			}
			
			public function editCommissionHistory($data) {

			$query3 = $this->db->query("SELECT MAX(id) AS id FROM ". DB_PREFIX ."purpletree_vendor_payment_settlement_history WHERE invoice_id='".$data['invoice_id']."'");   
				if ($query3->num_rows) {
				$id= $query3->row['id'];
				}		
				if($data['id']===$id){
				$query2 = $this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_payments SET seller_id='".(int)$data['seller_id']."',transaction_id='".$this->db->escape($data['txn_id'])."',status='".$this->db->escape($data['status'])."',updated_at=NOW() WHERE invoice_id='".(int)$data['invoice_id']."'");   	
				}

			$query4 = $this->db->query("SELECT status_id FROM ". DB_PREFIX ."purpletree_vendor_plan_invoice_status_languge WHERE status='".$this->db->escape($data['status'])."' AND language_id='".(int)$this->config->get('config_language_id')."'"); 
				if ($query4->num_rows) {
				$status= $query4->row['status_id'];
				}
			 $query5 = $this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_payment_settlement_history SET transaction_id='".$this->db->escape($data['txn_id'])."',comment='".$this->db->escape($data['comment'])."',status_id='".(int)$status."',modified_date=NOW() WHERE id='".(int)$data['id']."'");   
			}
	
		public function addCommissionHistory($data) {

			$query1 = $this->db->query("SELECT invoice_id,seller_id FROM ". DB_PREFIX ."purpletree_vendor_payments WHERE invoice_id='".(int)$data['invoice_id']."' AND seller_id='".(int)$data['seller_id']."'");
			
			if ($query1->num_rows>0) {
			$query2 = $this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_payments SET seller_id='".(int)$data['seller_id']."',status='".$this->db->escape($data['status'])."',payment_mode='".$this->db->escape($data['payment_mode'])."',transaction_id='".$this->db->escape($data['txn_id'])."',amount='".$this->db->escape($data['amount'])."',created_at=NOW(),updated_at=NOW() WHERE invoice_id='".(int)$data['invoice_id']."'");
			} else {
			$query3 = $this->db->query("INSERT INTO ". DB_PREFIX ."purpletree_vendor_payments SET seller_id='".(int)$data['seller_id']."',invoice_id='".(int)$data['invoice_id']."',status='".$this->db->escape($data['status'])."',payment_mode='".$this->db->escape($data['payment_mode'])."',transaction_id='".$this->db->escape($data['txn_id'])."',amount='".$this->db->escape($data['amount'])."',created_at=NOW(),updated_at=NOW()");	
			}
			$query4 = $this->db->query("SELECT status_id FROM ". DB_PREFIX ."purpletree_vendor_plan_invoice_status_languge WHERE status='".$this->db->escape($data['status'])."' AND language_id='".(int)$this->config->get('config_language_id')."'"); 
			if ($query4->num_rows) {
			$status= $query4->row['status_id'];
			}
			
			 $query5 = $this->db->query("INSERT INTO ". DB_PREFIX ."purpletree_vendor_payment_settlement_history SET invoice_id='".(int)$data['invoice_id']."',status_id='".$status."',payment_mode='".$this->db->escape($data['payment_mode'])."',transaction_id='".$this->db->escape($data['txn_id'])."',comment='".$this->db->escape($data['comment'])."',created_date=NOW(),modified_date=NOW()");   
			}
		
			public function getCommissionHistory($invoice_id) {
			$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."purpletree_vendor_payment_settlement_history WHERE invoice_id='".(int)$invoice_id."' ORDER BY id DESC");
			if ($query->num_rows) {
			return $query->rows;
			}
			
			return false;
			}
			
			public function getCommissionPaymentDetail($invoice_id) {
			$query = $this->db->query("SELECT transaction_id,status FROM ". DB_PREFIX ."purpletree_vendor_payments WHERE invoice_id='".(int)$invoice_id."'");
			
			if ($query->num_rows) {
			return $query->row;
			}
			return false;
			}
			public function getCommissionPaymentHistoryDetail($id) {
			$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."purpletree_vendor_payment_settlement_history WHERE id='".(int)$id."'");
			
			if ($query->num_rows) {
			return $query->row;
			}
			return false;
			}
			
			public function getSellerInvoieId($invoice_id) {
			$query = $this->db->query("SELECT order_id,seller_id FROM ". DB_PREFIX ."purpletree_vendor_commission_invoice_items WHERE link_id='".(int)$invoice_id."'");
			
			if ($query->num_rows) {
			return $query->rows;
			}
			return false;
			}
			public function getCommissionTotal($order_id,$seller_id) {
			$query = $this->db->query("SELECT value FROM ". DB_PREFIX ."purpletree_order_total WHERE order_id='".(int)$order_id."' AND seller_id='".(int)$seller_id."' AND code='total'");
			if ($query->num_rows) {
			return $query->row['value'];
			}
			return false;
			}
			
			public function getGenerateInvoiceData($invoice_id) {
			$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."purpletree_vendor_commission_invoice WHERE id='".(int)$invoice_id."'");
			if ($query->num_rows) {
			return $query->row;
			}
			return false;
			}
			public function getCommissionInvoiceStatus() {
			$query = $this->db->query("SELECT status_id,status FROM ". DB_PREFIX ."purpletree_vendor_plan_invoice_status_languge WHERE language_id='".(int)$this->config->get('config_language_id')."'");
			if ($query->num_rows) {
			return $query->rows;
			}
			return false;
			}
			public function getCommissionStatus($status_id) {
				$query = $this->db->query("SELECT status FROM ". DB_PREFIX ."purpletree_vendor_plan_invoice_status_languge WHERE status_id='".(int)$status_id."' AND language_id='".(int)$this->config->get('config_language_id')."'"); 
			if ($query->num_rows) {
			return $query->row['status'];
			}
			return false;
			}
			public function getInvoiceId($id) {
				$query = $this->db->query("SELECT invoice_id FROM ". DB_PREFIX ."purpletree_vendor_payment_settlement_history WHERE id='".(int)$id."'"); 
					if ($query->num_rows) {
					return $query->row['invoice_id'];

					}
					return false;
			}
			
			public function getCountry($country_id) {
				$query = $this->db->query("SELECT name FROM ". DB_PREFIX ."country WHERE country_id='".(int)$country_id."'"); 
					if ($query->num_rows) {
					return $query->row['name'];
					}
					return false;
			}
			
			public function getZone($zone_id,$country_id) {
				$query = $this->db->query("SELECT name FROM ". DB_PREFIX ."zone WHERE  zone_id='".(int)$zone_id."' AND country_id='".(int)$country_id."'"); 
					if ($query->num_rows) {
					return $query->row['name'];
					}
					return false;
			}
			
			
}
?>