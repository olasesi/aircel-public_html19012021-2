<?php 
class ModelExtensionPurpletreeMultivendorSellerenquiries extends Model{
		public function addSellerMessage($data=array()){
		$sql = "INSERT INTO " . DB_PREFIX . "purpletree_vendor_enquiries SET seller_id='".(int)$data['seller_id']."', message='".$this->db->escape($data['message'])."',contact_from='1',created_at=NOW(),updated_at=NOW() ";
		$this->db->query($sql);
	}
	
	public function sendAllSellerMessage($message){
		$query=$this->db->query("SELECT * FROM " . DB_PREFIX . "purpletree_vendor_stores WHERE store_status= 1");
		if($query->num_rows>0){
			foreach($query->rows as $key=>$result){
		$sql = "INSERT INTO " . DB_PREFIX . "purpletree_vendor_enquiries SET seller_id='".(int)$result['seller_id']."', message='".$this->db->escape($message)."',contact_from='1',created_at=NOW(),updated_at=NOW() ";
		$this->db->query($sql);
			}
		}
	}
	
	public function getSellerMessage($data=array()){
		//echo"<pre>"; print_r($data); die;
		$sql= "SELECT * FROM " . DB_PREFIX . "purpletree_vendor_enquiries ";
		$sql.="WHERE seller_id='".(int)$data['seller_id']."'"; 
		$sql.=" ORDER BY created_at DESC ";
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

		$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query=$this->db->query($sql);
		if($query->num_rows>0){
			return $query->rows;
		}else {
			return NULL;
		}		
	}	
	
	
	public function getSellerName($customer_id){
		$query= $this->db->query("SELECT CONCAT(firstname,' ',lastname) AS seller_name FROM " . DB_PREFIX . "customer WHERE customer_id='".(int)$customer_id."'");
		if($query->num_rows>0){
			return $query->row['seller_name'];
		}else {
			return NULL;
		}
		
	}
	
	public function getsellerenquiries($data = array()){
		$sql = "SELECT pvc.*,CONCAT(c.firstname,' ',c.lastname) AS seller_name,c.email,(SELECT pve.message FROM " . DB_PREFIX . "purpletree_vendor_enquiries pve WHERE pve.seller_id=pvc.seller_id ORDER BY pve.id DESC LIMIT 1 ) AS message,(SELECT pve.created_at FROM " . DB_PREFIX . "purpletree_vendor_enquiries pve WHERE pve.seller_id=pvc.seller_id ORDER BY pve.id DESC LIMIT 1 ) AS created_at FROM " . DB_PREFIX . "purpletree_vendor_stores pvc RIGHT JOIN " . DB_PREFIX . "customer c ON(c.customer_id=pvc.seller_id)  RIGHT JOIN " . DB_PREFIX . "purpletree_vendor_enquiries pves ON(pves.seller_id=pvc.seller_id)";
		
		 $sql.=" WHERE pvc.store_status=1";
		if (!empty($data['filter_seller_name'])) {
			$sql .= " AND CONCAT(c.firstname,' ',c.lastname) LIKE '" . $this->db->escape($data['filter_seller_name']) . "%'";
		}
		
		if (!empty($data['filter_store_name'])) {
			$sql .= " AND pvc.store_name LIKE '" . $this->db->escape($data['filter_store_name']) . "%'";
		}

		if (isset($data['filter_email']) && !is_null($data['filter_email'])) {
			$sql .= " AND c.email = '" . $this->db->escape($data['filter_email']) . "'";
		}
		$sql.=" GROUP BY pves.seller_id ";
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
		} else {
			return NULL;
		}
	}
	
	public function getTotalsellerenquiries($data = array()){

		$sql = "SELECT pvc.*,CONCAT(c.firstname,' ',c.lastname) AS seller_name,c.email,(SELECT pve.message FROM " . DB_PREFIX . "purpletree_vendor_enquiries pve WHERE pve.seller_id=pvc.seller_id ORDER BY pve.id DESC LIMIT 1 ) AS message,(SELECT pve.created_at FROM " . DB_PREFIX . "purpletree_vendor_enquiries pve WHERE pve.seller_id=pvc.seller_id ORDER BY pve.id DESC LIMIT 1 ) AS created_at FROM " . DB_PREFIX . "purpletree_vendor_stores pvc RIGHT JOIN " . DB_PREFIX . "customer c ON(c.customer_id=pvc.seller_id)  RIGHT JOIN " . DB_PREFIX . "purpletree_vendor_enquiries pves ON(pves.seller_id=pvc.seller_id)";
		
		 $sql.=" WHERE pvc.store_status=1";
		if (!empty($data['filter_seller_name'])) {
			$sql .= " AND CONCAT(c.firstname,' ',c.lastname) LIKE '" . $this->db->escape($data['filter_seller_name']) . "%'";
		}
		
		if (!empty($data['filter_store_name'])) {
			$sql .= " AND pvc.store_name LIKE '" . $this->db->escape($data['filter_store_name']) . "%'";
		}

		if (isset($data['filter_email']) && !is_null($data['filter_email'])) {
			$sql .= " AND c.email = '" . $this->db->escape($data['filter_email']) . "'";
		}
		$sql.=" GROUP BY pves.seller_id ";
	
		$query = $this->db->query($sql);
		
		if($query->num_rows>0){
		return $query->num_rows;
		} else {
			return NULL;
		}
	}
	
	public function getMessage($id){
		$sql = "SELECT pvc.*,CONCAT(c.firstname,' ',c.lastname) AS seller_name FROM " . DB_PREFIX . "purpletree_vendor_enquiries pvc JOIN " . DB_PREFIX . "customer c ON(c.customer_id=pvc.seller_id) WHERE pvc.id='".(int)$id."'";
		
		$query = $this->db->query($sql);
		
		return $query->row;
	}
	
	public function deleteMessage($message_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "purpletree_vendor_enquiries WHERE id = '" . (int)$message_id . "'");

	}
		public function getSellerTotalMessage($data = array()){
	
		$sql = "SELECT count(*) AS total FROM " . DB_PREFIX . "purpletree_vendor_enquiries ";
		
		$sql.=" WHERE seller_id='".(int)$data['seller_id']."'";
		if (!empty($data['filter_seller_name'])) {
			$sql .= " AND CONCAT(c.firstname,' ',c.lastname) LIKE '" . $this->db->escape($data['filter_seller_name']) . "%'";
		}
		
		if (!empty($data['filter_customer_name'])) {
			$sql .= " AND pvc.customer_name LIKE '" . $this->db->escape($data['filter_customer_name']) . "%'";
		}

		if (isset($data['filter_email']) && !is_null($data['filter_email'])) {
			$sql .= " AND pvc.customer_email = '" . $this->db->escape($data['filter_email']) . "'";
		}

		if (!empty($data['filter_created_at'])) {
			$sql .= " AND DATE(pvc.created_at) = DATE('" . $this->db->escape($data['filter_created_at']) . "')";
		}

		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
}
?>