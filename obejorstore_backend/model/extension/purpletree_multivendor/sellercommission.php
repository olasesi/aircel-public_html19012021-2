<?php 
class ModelExtensionPurpletreeMultivendorSellercommission extends Model{
	
	public function getSellerstore() {
		$sql = "SELECT pvs.seller_id,pvs.store_name FROM " . DB_PREFIX . "purpletree_vendor_stores pvs LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = pvs.seller_id) WHERE c.status=1 AND pvs.store_status=1";

		$query = $this->db->query($sql);

		return $query->rows;
	
	}
	
	public function getCommissionsforinvoide($commission_id = NULL){
		
		$sql = "SELECT * FROM " . DB_PREFIX . "purpletree_vendor_commissions WHERE id ='".(int)$commission_id."'";
		$query  = $this->db->query($sql);
		return $query->row;
	}
	public function pendingPayments($data = array()){
		
		 $sql = "SELECT pvo.order_id as order_id,pvo.total_price, pvo.order_status_id as seller_order_status,o.order_status_id AS admin_order_status FROM " . DB_PREFIX . "purpletree_vendor_orders pvo JOIN ". DB_PREFIX ."order o ON(pvo.order_id=o.order_id) WHERE pvo.seller_id = '".(int)$data['seller_id']."' GROUP BY pvo.id";
		
		$query = $this->db->query($sql);
		return $query->rows;
	}

		public function getTotalsaleAll($data=array()){

		$sql  = "SELECT SUM(pvo.total_price) as total,o.currency_code, o.currency_value FROM " . DB_PREFIX . "purpletree_vendor_orders pvo JOIN `" . DB_PREFIX . "order` o ON(pvo.order_id=o.order_id) ";
		
		if(!empty($data['seller_id'])){
			$sql .= " WHERE pvo.seller_id ='".(int)$data['seller_id']."'";
		}
		//echo $sql; die;
		$query  = $this->db->query($sql);
		
		return $query->row;
	}
		public function getCommissions11($order_id){
		
		$sql = "SELECT pvc.*,op.name,pvo.total_price,o.currency_code, o.currency_value FROM " . DB_PREFIX . "purpletree_vendor_commissions pvc JOIN " .DB_PREFIX. "order_product op ON(op.product_id=pvc.product_id) JOIN " .DB_PREFIX. "purpletree_vendor_orders pvo ON(pvo.product_id=pvc.product_id AND pvo.order_id=pvc.order_id) JOIN `" .DB_PREFIX. "order` o ON(o.order_id=pvo.order_id)";
		
		$sql .= " WHERE pvc.order_id ='".(int)$order_id."'";
		$sql .= " GROUP BY pvc.id ORDER BY id DESC";

		$query  = $this->db->query($sql);
		return $query->rows;
	}
	public function getCommissions($data=array()){
		
		$sql = "SELECT pvc.*,pd.name,pvo.total_price,o.currency_code, o.currency_value FROM " . DB_PREFIX . "purpletree_vendor_commissions pvc JOIN " .DB_PREFIX. "product_description pd ON(pd.product_id=pvc.product_id) JOIN " .DB_PREFIX. "purpletree_vendor_orders pvo ON(pvo.product_id=pvc.product_id AND pvo.order_id=pvc.order_id) JOIN `" .DB_PREFIX. "order` o ON(o.order_id=pvo.order_id)";
		
		$sql .= " WHERE o.order_status_id ='".(int)$data['order_status']."'";
		$sql .= " AND pvo.order_status_id ='".(int)$data['order_status']."'";
		
		if(!empty($data['seller_id'])){
			$sql .= " AND pvc.seller_id ='".(int)$data['seller_id']."'";
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
		
		$sql .= " GROUP BY pvc.order_id ORDER BY id DESC";
		
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
	
	public function getTotalCommissions($data=array()){
	
		$sql  = "SELECT count(*) AS total FROM " . DB_PREFIX . "purpletree_vendor_commissions pvc JOIN " .DB_PREFIX. "purpletree_vendor_orders pvo ON(pvo.product_id=pvc.product_id AND pvo.order_id=pvc.order_id) JOIN `" .DB_PREFIX. "order` o ON(o.order_id=pvo.order_id)";
		
		$sql .= " WHERE o.order_status_id ='".(int)$data['order_status']."'";
		$sql .= " AND pvo.order_status_id ='".(int)$data['order_status']."'";
		
		if(!empty($data['seller_id'])){
			$sql .= " AND pvc.seller_id ='".(int)$data['seller_id']."'";
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
		$sql .= " GROUP BY pvc.order_id ";
		$query  = $this->db->query($sql);
		
		if($query->num_rows >0){
			return $query->num_rows;
		} else {
			return 0;
		}
	}
	
	public function getTotalsale($data=array()){
		$sql  = "SELECT SUM(pvo.total_price) as total,o.currency_code, o.currency_value FROM " . DB_PREFIX . "purpletree_vendor_orders pvo JOIN `" . DB_PREFIX . "order` o ON(pvo.order_id=o.order_id) ";
		
		if(!empty($data['seller_id'])){
			$sql .= " WHERE pvo.seller_id ='".(int)$data['seller_id']."'";
		}

		if (!empty($data['filter_date_from'])) {
			$sql .= " AND DATE(pvo.created_at) >= DATE('" . $this->db->escape($data['filter_date_from']) . "')";
		}

		if (!empty($data['filter_date_to'])) {
			$sql .= " AND DATE(pvo.created_at) <= DATE('" . $this->db->escape($data['filter_date_to']) . "')";
		}
		if(empty($data['filter_date_from']) && empty($data['filter_date_to'])){
			$end_date = date('Y-m-d', strtotime("-30 days"));
			$sql .= " AND DATE(pvo.created_at) >= '".$end_date."'";
			$sql .= " AND DATE(pvo.created_at) <= '".date('Y-m-d')."'";
		}
		$query  = $this->db->query($sql);
		
		return $query->row;
	}	
	
	public function getTotalcommission($data=array()){
		$sql  = "SELECT SUM(commission) as total FROM " . DB_PREFIX . "purpletree_vendor_commissions ";
		
		if(!empty($data['seller_id'])){
			$sql .= " WHERE seller_id ='".(int)$data['seller_id']."'";
		}

		if (!empty($data['filter_date_from'])) {
			$sql .= " AND DATE(created_at) >= DATE('" . $this->db->escape($data['filter_date_from']) . "')";
		}

		if (!empty($data['filter_date_to'])) {
			$sql .= " AND DATE(created_at) <= DATE('" . $this->db->escape($data['filter_date_to']) . "')";
		}
		if(empty($data['filter_date_from']) && empty($data['filter_date_to'])){
			$end_date = date('Y-m-d', strtotime("-30 days"));
			$sql .= " AND DATE(created_at) >= '".$end_date."'";
			$sql .= " AND DATE(created_at) <= '".date('Y-m-d')."'";
		}
		
		$query  = $this->db->query($sql);
		
		if($query->num_rows >0){
			return $query->row['total'];
		} else {
			return 0;
		}
	}
	public function getCommissionFromId($id){
		$sql  = "SELECT * FROM " . DB_PREFIX . "purpletree_vendor_commissions WHERE `id` =".$id;
		$query  = $this->db->query($sql);
		return $query->row;
	}
	public function getTotalrecievedamt($data=array()){
		$sql  = "SELECT SUM(amount) as total FROM " . DB_PREFIX . "purpletree_vendor_payments";
		
		if(!empty($data['seller_id'])){
			$sql .= " WHERE seller_id ='".(int)$data['seller_id']."' AND status = 'success'";
		}

		if (!empty($data['filter_date_from'])) {
			$sql .= " AND DATE(created_at) >= DATE('" . $this->db->escape($data['filter_date_from']) . "')";
		}

		if (!empty($data['filter_date_to'])) {
			$sql .= " AND DATE(created_at) <= DATE('" . $this->db->escape($data['filter_date_to']) . "')";
		}
		if(empty($data['filter_date_from']) && empty($data['filter_date_to'])){
			$end_date = date('Y-m-d', strtotime("-30 days"));
			$sql .= " AND DATE(created_at) >= '".$end_date."'";
			$sql .= " AND DATE(created_at) <= '".date('Y-m-d')."'";
		}
		
		$query  = $this->db->query($sql);
		if($query->num_rows >0){
			return $query->row['total'];
		} else {
			return 0;
		}
	}
}
?>