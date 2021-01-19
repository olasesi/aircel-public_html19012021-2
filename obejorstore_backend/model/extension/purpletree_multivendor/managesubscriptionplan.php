<?php
class ModelExtensionPurpletreeMultivendorManagesubscriptionplan extends Model {
	public function active($id){
			$query=$this->db->query("UPDATE " . DB_PREFIX . "purpletree_vendor_seller_plan SET status=1 WHERE id='".(int) $id."'");
		}

	  public function sellerTotalFeaturedProduct($seller_id){
			$query=$this->db->query("SELECT COUNT(*) AS total_featured_product FROM " . DB_PREFIX . "purpletree_vendor_products WHERE seller_id='".(int) $seller_id."' AND is_featured=1");
				if($query->num_rows){
				
					return $query->row['total_featured_product'];
				} else {
					return NULL;	
				}
		}
			public function getSellerInvoiceList2pagin($data = array()){
		$sql = "SELECT COUNT(*) as total FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan pvp ON(pvp.plan_id=pvsp.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id='" . $data['seller_id'] . "' AND pvsp.plan_id='" . $data['plan_id'] . "'";

		$sql .= " GROUP BY pvsp.id";
		$sql .= " ORDER BY pvsp.start_date DESC";
		
		$query = $this->db->query($sql);
		if($query->num_rows){
				return $query->num_rows;
			} else {
				return '0';
			}
	}
		
			public function sellerTotalCategpryFeaturedProduct($seller_id){
			$query=$this->db->query("SELECT COUNT(*) AS total_catogry_featured_product FROM " . DB_PREFIX . "purpletree_vendor_products WHERE seller_id='".(int) $seller_id."' AND is_category_featured=1");
				if($query->num_rows){
					
					return $query->row['total_catogry_featured_product'];
				} else {
					return NULL;	
				}
		}
	
	
		public function addSellerPlan($data=array()) {			

				$this->db->query("INSERT INTO ". DB_PREFIX ."purpletree_vendor_plan_invoice SET plan_id='".(int)$data['plan_id']."',seller_id='".(int)$data['seller_id']."',status_id='1',created_date=NOW()");	
				$invoice_id = $this->db->getLastId();
				
				foreach($data['totals']['plan'] as $key=>$result){
				$this->db->query("INSERT INTO ". DB_PREFIX ."purpletree_vendor_plan_invoice_item SET invoice_id='". (int)$invoice_id."',code='".$this->db->escape($result['code'])."',title='".$this->db->escape($result['title'])."',price='".$this->db->escape($result['value'])."',sort_order='".$this->db->escape($result['sort_order'])."'");	
				}
			
				//
				$lastsellerplanid = $this->db->query("SELECT id FROM ". DB_PREFIX ."purpletree_vendor_seller_plan WHERE seller_id ='".(int)$data['seller_id']."' order by id DESC limit 0,1");

				if($lastsellerplanid->num_rows) {
					if($data['startt_when'] == 1) {
						$this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_seller_plan SET end_date='".$this->db->escape($data['start_date'])."' WHERE id ='".$lastsellerplanid->row['id']."'");
					}
				}
				//
				
				$this->db->query("INSERT INTO ". DB_PREFIX ."purpletree_vendor_seller_plan SET invoice_id='".(int)$invoice_id."',plan_id='".(int)$data['plan_id']."',seller_id='".(int)$data['seller_id']."',start_date='".$this->db->escape($data['start_date'])."',end_date='".$this->db->escape($data['end_date'])."',created_date='".$this->db->escape($data['current_date'])."'");
				$id = $this->db->getLastId();
				
				if($data['startt_when'] == 1) {
					$this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_seller_plan SET status=0 WHERE id ='".$id."' AND seller_id='".(int)$data['seller_id']."'");
					} else {
					$this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_seller_plan SET status=1 WHERE id ='".$id."' AND seller_id='".(int)$data['seller_id']."'");
					$this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_seller_plan SET status=0 WHERE id !='".$id."' AND status=1 AND seller_id='".(int)$data['seller_id']."'");
					}
					$this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_seller_plan SET  end_date='".$this->db->escape($data['current_date'])."' WHERE id !='".$id."' AND end_date ='0000-00-00 00:00:00' AND seller_id='".(int)$data['seller_id']."'");
					
				return $invoice_id;
			}
			
			public function addMultipleSellerPlan($data=array()) {			

				$this->db->query("INSERT INTO ". DB_PREFIX ."purpletree_vendor_plan_invoice SET plan_id='".(int)$data['plan_id']."',seller_id='".(int)$data['seller_id']."',status_id='1',created_date=NOW()");	
				$invoice_id = $this->db->getLastId();
				
				foreach($data['totals']['plan'] as $key=>$result){
				$this->db->query("INSERT INTO ". DB_PREFIX ."purpletree_vendor_plan_invoice_item SET invoice_id='". (int)$invoice_id."',code='".$this->db->escape($result['code'])."',title='".$this->db->escape($result['title'])."',price='".$this->db->escape($result['value'])."',sort_order='".$this->db->escape($result['sort_order'])."'");	
				}
			
				//
				$lastsellerplanid = $this->db->query("SELECT id FROM ". DB_PREFIX ."purpletree_vendor_seller_plan WHERE seller_id ='".(int)$data['seller_id']."' order by id DESC limit 0,1");

				if($lastsellerplanid->num_rows) {
					if($data['startt_when'] == 1) {
						$this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_seller_plan SET end_date='".$this->db->escape($data['start_date'])."' WHERE id ='".$lastsellerplanid->row['id']."'");
						
					}
				}
				//
				
				$this->db->query("INSERT INTO ". DB_PREFIX ."purpletree_vendor_seller_plan SET invoice_id='".(int)$invoice_id."',plan_id='".(int)$data['plan_id']."',seller_id='".(int)$data['seller_id']."',start_date='".$this->db->escape($data['start_date'])."',end_date='".$this->db->escape($data['end_date'])."',created_date='".$this->db->escape($data['current_date'])."'");
				$id = $this->db->getLastId();
				
				if($data['startt_when'] == 1) {
					$this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_seller_plan SET status=0,new_status=0 WHERE id ='".$id."' AND seller_id='".(int)$data['seller_id']."'");
					} else {
						
					$this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_seller_plan SET status=1, new_status=1 WHERE id ='".$id."' AND seller_id='".(int)$data['seller_id']."'");
					
					$this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_seller_plan SET status=0,end_date='".$this->db->escape($data['current_date'])."' WHERE id !='".$id."' AND status=1 AND seller_id='".(int)$data['seller_id']."'");
					
					$this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_seller_plan SET new_status=0 WHERE id !='".$id."' AND plan_id='".(int)$data['plan_id']."' AND seller_id='".(int)$data['seller_id']."'");
					}
					
				return $invoice_id;
			}
			
		public function enableSellerSubscription($seller_id) {
					$query=$this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_plan_subscription SET status_id=1 WHERE seller_id='".(int)$seller_id."'");
						if($query->num_rows){
						return true;	
						} else { 
						return false;
						}
				}
		public function getInvoiceId($seller_id){
				$query = $this->db->query("SELECT invoice_id FROM " . DB_PREFIX . "purpletree_vendor_seller_plan WHERE seller_id='".(int)$seller_id."' AND status=1");
	
				if($query->num_rows>0){
							return $query->row['invoice_id'];	
						} else {
							return NULL;		
						}
			}
			public function getCustomerStatus($seller_id){
				$query = $this->db->query("SELECT status FROM " . DB_PREFIX . "customer WHERE customer_id='".(int)$seller_id."'");
	
				if($query->num_rows>0){
							return $query->row['status'];	
						} else {
							return NULL;		
						}
			}
	
	public function getSellerCurrentPlan($seller_id){
			$query = $this->db->query("SELECT invoice_id FROM " . DB_PREFIX . "purpletree_vendor_seller_plan where seller_id='".(int)$seller_id."' AND status=1");
				if($query->num_rows>0){
					
				$query1 = $this->db->query("SELECT code,price FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice_item where invoice_id='".(int)$query->row['invoice_id']."'");	
						if($query1->num_rows){
						return $query1->rows;		
						}else {
						return NUll;		
							
						}
					} else {	
					return NUll;	
					}
				}
		public function addFirstSellerPlan($seller_id) {
				$this->db->query("INSERT INTO ". DB_PREFIX ."purpletree_vendor_plan_subscription SET seller_id='".(int)$seller_id."',status_id='0', 	created_date=NOW(),modified_date=NOW()");
			}
			
			public function changeStatus($status,$seller_id){
		$query = $this->db->query("UPDATE " . DB_PREFIX . "product SET status='".$status."' WHERE product_id IN (SELECT product_id FROM " . DB_PREFIX . "purpletree_vendor_products WHERE seller_id='".(int)$seller_id."')");
			}
	public function getPlanBySeller($seller_id) {
				$sql="SELECT pvp.plan_id,pvp.no_of_product,pvp.joining_fee,pvp.subscription_price,pvp.validity,pvsp.start_date ,pvsp.end_date,pvsp.created_date,pvsp.modified_date,pvpd.plan_name,pvpd.plan_description,pvpd.plan_short_description  FROM ". DB_PREFIX ."purpletree_vendor_plan pvp LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan_description pvpd ON (pvp.plan_id=pvpd.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_seller_plan pvsp ON (pvp.plan_id=pvsp.plan_id) WHERE pvpd.language_id='".(int)$this->config->get('config_language_id') ."' AND pvsp.seller_id='".(int)$seller_id."' AND pvsp.status=1";
			
			
		

					$query = $this->db->query($sql);
					if( $query->num_rows){
						return $query->row;
						
					} else {
						
					return NULL;	
					}
					
				}
	
	public function getSubscribePlan($plan_id) {
			
				$sql="SELECT pvsp.start_date ,pvsp.end_date,pvp.plan_id,pvp.no_of_product,pvp.joining_fee,pvp.subscription_price,pvp.validity,pvp.created_date,pvp.modified_date,pvpd.plan_name,pvpd.plan_description,pvpd.plan_short_description  FROM ". DB_PREFIX ."purpletree_vendor_plan pvp LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan_description pvpd ON (pvp.plan_id=pvpd.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_seller_plan pvsp ON (pvp.plan_id=pvsp.plan_id) WHERE pvpd.language_id='".(int)$this->config->get('config_language_id') ."' AND pvp.plan_id='".(int)$plan_id."'";						
						
			

					$query = $this->db->query($sql);
					if($query->num_rows){
					return $query->row;
						
					} else {
						return NULL;
						
					}
					
				}
	
	public function getInvoiceStatuss($seller_id){
				$query = $this->db->query("SELECT MAX(invoice_id) AS id FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice WHERE seller_id='".(int)$seller_id."'");
	
				if($query->num_rows>0){
							$invoice_id=$query->row['id'];	
						} else {
							$invoice_id=NULL;		
						}
				$query1 = $this->db->query("SELECT status_id FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice WHERE seller_id='".(int)$seller_id."' AND invoice_id='".$invoice_id."'");
				if($query1->num_rows>0){
							return $query1->row['status_id'];	
						} else {
							return NULL;		
						}
			}
	public function addSubscriptionPlan($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan SET no_of_product = '" . (int)$data['no_of_product'] . "', `joining_fee` = '" . (int)$data['joining_fee'] . "', subscription_price = '" . (int)$data['subscription_price'] . "', validity = '" . (int)$data['validity'] . "',status = '" . (int)$data['status'] . "', modified_date = NOW(), created_date = NOW()");
		$plan_id = $this->db->getLastId();

		foreach ($data['subscription'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan_description SET plan_id = '" . (int)$plan_id . "', language_id = '" . (int)$language_id . "', plan_name = '" . $this->db->escape($value['name']) . "', plan_description = '" . $this->db->escape($value['description']) . "', plan_short_description = '" . $this->db->escape($value['short_description']) . "'");
		}
	}

	
		public function editSubscriptionPlan($plan_id,$data) {

		$this->db->query("UPDATE " . DB_PREFIX . "purpletree_vendor_plan SET no_of_product = '" . (int)$data['no_of_product'] . "', joining_fee = '" . (int)$data['joining_fee'] . "', subscription_price = '" . (int)$data['subscription_price'] . "', validity = '" . (int)$data['validity'] . "',status = '" . (int)$data['status'] . "', modified_date = NOW(), created_date = NOW() WHERE plan_id='". (int)$plan_id."'");
		//$plan_id = $this->db->getLastId();

		foreach ($data['subscription'] as $language_id => $value) {
			$this->db->query("UPDATE " . DB_PREFIX . "purpletree_vendor_plan_description SET language_id = '" . (int)$language_id . "', plan_name = '" . $this->db->escape($value['name']) . "', plan_description = '" . $this->db->escape($value['description']) . "', plan_short_description = '" . $this->db->escape($value['short_description']) . "' WHERE plan_id = '" . (int)$plan_id . "'");
		}
	}
	
		public function addSellerSubscriptionPlan($data) {
			echo "<pre>";
			//print_r($data); die;

		$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_seller_plan SET plan_id = '" . (int)$data['plan_id'] . "', `seller_id` = '" . (int)$data['seller_id'] . "', status = '1', start_date = " . $data['start_date'] . ", created_date = NOW()");
		$insertId = $this->db->getLastId();
		$id = $this->db->getLastId();
		$this->db->query("UPDATE ". DB_PREFIX ."purpletree_vendor_seller_plan SET status=0 WHERE id !='".$id."' AND seller_id ='".(int)$data['seller_id']."'");
		
		$this->db->query("INSERT INTO ". DB_PREFIX ."purpletree_vendor_plan_invoice SET plan_id='".(int)$data['plan_id']."',seller_id='".(int)$data['seller_id']."',status_id='1',created_date=NOW()");	
		$invoice_id = $this->db->getLastId();
		foreach($data['totals'] as $total) {
			$this->db->query("INSERT INTO ". DB_PREFIX ."purpletree_vendor_plan_invoice_item SET invoice_id='". (int)$invoice_id."',title='".$this->db->escape($total['title'])."',price='".$this->db->escape($total['price'])."',sort_order='".$this->db->escape($total['sort_order'])."'");	
		}
		return $invoice_id;
	
	}

		public function getManageSubscriptionPlanTotal($data = array()) {
			
				$sql="SELECT COUNT(*) as total  FROM ". DB_PREFIX ."purpletree_vendor_seller_plan pvsp LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan_description pvpd ON (pvsp.plan_id=pvpd.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_stores pvs ON(pvs.seller_id=pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = pvsp.seller_id) WHERE pvpd.language_id='".(int)$this->config->get('config_language_id') ."'";
			
			
		if (!empty($data['filter_name'])) {
			$sql .= " AND cd2.plan_name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " GROUP BY pvsp.seller_id";
		$query = $this->db->query($sql);
			if($query->num_rows){
				return $query->row['total'];	
			} else {
				return '0';
			}
		
	}
	
	public function addSubscription($status,$seller_id) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan_subscription SET status_id = '" . (int)$status."' , seller_id='". (int)$seller_id."'");
	}
	public function changeSubscription($status,$seller_id) {
			$this->db->query("UPDATE " . DB_PREFIX . "purpletree_vendor_plan_subscription SET status_id = '" . (int)$status."' WHERE seller_id='". (int)$seller_id."'");
	}
	
		public function getManageSubscriptionPlan($data = array()) {

			$sql="SELECT CONCAT(c.firstname, ' ', c.lastname) AS seller_name,pvs.seller_id,pvs.store_name,pvpd.plan_id,pvsp.status FROM ". DB_PREFIX ."purpletree_vendor_seller_plan pvsp LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan_description pvpd ON (pvsp.plan_id=pvpd.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_stores pvs ON(pvs.seller_id=pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = pvsp.seller_id) WHERE pvpd.language_id='".(int)$this->config->get('config_language_id') ."' ";
			$sql .= "";
			
		if (!empty($data['filter_name'])) {
			$sql .= " AND cd2.plan_name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " GROUP BY pvsp.seller_id";

		$sort_data = array(
			'plan_name',
			'sort_order'
		);

		

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
		if($query->num_rows){
		return $query->rows;	
		}else 
		{
		return '';	
		}
		
	}
	

		public function getplanDescriptions($plan_id) {
		
		$plan_description_data = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "purpletree_vendor_plan_description"; 
		if(isset($plan_id)) {
			$sql .= " WHERE plan_id = '" . (int)$plan_id . "'"; 
		}
		$query = $this->db->query($sql);
		if($query->num_rows){

		}

		}
		public function getSellerName($seller_id) {
			$sql = "SELECT CONCAT(c.firstname, ' ', c.lastname) AS seller_name FROM " . DB_PREFIX . "customer c WHERE customer_id='".$seller_id."'";
			$query = $this->db->query($sql);
			if($query->num_rows){
				return $query->row['seller_name'];
			}
		}
		public function getSubscriptionStatus($seller_id) {
			$sql = "SELECT status_id FROM " . DB_PREFIX . "purpletree_vendor_plan_subscription WHERE seller_id='". $seller_id ."'";
			$query = $this->db->query($sql);
			if($query->num_rows){
				return $query->row['status_id'];
			}
		}
		public function getsellerProducts($seller_id) {
			$sql = "SELECT COUNT(*) as total FROM " . DB_PREFIX . "purpletree_vendor_products WHERE seller_id='". $seller_id ."'";
			$query = $this->db->query($sql);
			if($query->num_rows){
				return $query->row['total'];
			}
		}
		public function getnewplanProducts($plan_id) {
			$sql = "SELECT no_of_product FROM " . DB_PREFIX . "purpletree_vendor_plan WHERE plan_id='". $plan_id ."'";
			$query = $this->db->query($sql);
			if($query->num_rows){
				return $query->row['no_of_product'];
			}
		}
		
	
		public function getCurrentPlan($seller_id) {
		$sql = "SELECT CONCAT(c.firstname, ' ', c.lastname) AS seller_name, pvpd.plan_name,pvp.no_of_product,pvp.no_of_featured_product,pvp. 	no_of_category_featured_product,pvp. 	featured_store,pvsp.plan_id,pvsp.seller_id,pvsp.start_date,pvsp.end_date,pvsp.reminder,pvsp.status,pvp.validity FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan pvp ON (pvp.plan_id = pvsp.plan_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_subscription pvps ON (pvps.seller_id = pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id = '" . (int)$seller_id . "' GROUP BY pvsp.plan_id ORDER BY pvsp.status DESC"; 
		$query = $this->db->query($sql);
		if($query->num_rows){
			return $query->rows;
		}
		//featured_store
	} 
	
		public function getCurrentPlan1($seller_id) {

		$sql = "SELECT MAX(pvsp.id) AS id,CONCAT(c.firstname, ' ', c.lastname) AS seller_name, pvsp.plan_id, pvpd.plan_name,pvp.no_of_product,pvp.no_of_featured_product,pvp. 	no_of_category_featured_product,pvp.featured_store,pvsp.seller_id,pvsp.start_date,pvsp.end_date,pvsp.reminder, pvsp.status,pvp.validity  FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan pvp ON (pvp.plan_id = pvsp.plan_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_subscription pvps ON (pvps.seller_id = pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.id IN (SELECT MAX(id) FROM ". DB_PREFIX ."purpletree_vendor_seller_plan WHERE seller_id='".(int)$seller_id."' GROUP BY plan_id,status) AND pvsp.seller_id = '" . (int)$seller_id . "' GROUP BY pvsp.plan_id,pvsp.status ORDER BY pvsp.start_date ASC "; 
		$query = $this->db->query($sql);
		

		if($query->num_rows){
			return $query->rows;
		}
		
	}
	
		public function invoice_status($seller_id,$plan_id) {

		$sql = "SELECT pvpisl.status AS invoice_status  FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice pvpii LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_invoice_status_languge pvpisl ON(pvpisl.status_id=pvpii.status_id) WHERE pvpii.invoice_id IN( SELECT MAX(pvpi.invoice_id) FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice pvpi WHERE seller_id='".(int)$seller_id."' AND plan_id='".(int)$plan_id."') AND pvpisl.language_id='".(int)$this->config->get('config_language_id')."'";
		$query = $this->db->query($sql);
		if($query->num_rows){
			return $query->row['invoice_status'];
		}		
	}
	
	
			public function getCurrentMultiplePlan($seller_id) {

		$sql = "SELECT MAX(pvsp.id) AS id,CONCAT(c.firstname, ' ', c.lastname) AS seller_name, pvsp.plan_id, pvpd.plan_name,pvp.no_of_product,pvp.no_of_featured_product,pvp. 	no_of_category_featured_product,pvp.featured_store,pvsp.seller_id,pvsp.start_date,pvsp.new_end_date,pvsp.reminder, pvsp.new_status,pvp.validity  FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan pvp ON (pvp.plan_id = pvsp.plan_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_subscription pvps ON (pvps.seller_id = pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.id IN (SELECT MAX(id) FROM ". DB_PREFIX ."purpletree_vendor_seller_plan WHERE seller_id='".(int)$seller_id."' GROUP BY plan_id,new_status) AND pvsp.seller_id = '" . (int)$seller_id . "' GROUP BY pvsp.plan_id,pvsp.new_status ORDER BY pvsp.start_date ASC "; 
		$query = $this->db->query($sql);
		

		if($query->num_rows){
			return $query->rows;
		}
		
	}
		public function getPlanById($seller_id,$plan_id) {
		$sql = "SELECT pvpd.plan_name, pvpd.plan_id FROM " . DB_PREFIX . "purpletree_vendor_plan pvp LEFT JOIN " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp ON (pvp.plan_id = pvsp.plan_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvp.plan_id = pvpd.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id='".(int)$seller_id."' AND pvsp.plan_id='".(int)$plan_id."' GROUP BY pvsp.plan_id";
	
		$query = $this->db->query($sql);
		if($query->num_rows){
			return $query->rows;
		}
		//featured_store
	}
	
	public function getActivePlan($seller_id,$plan_id) {
		$sql = "SELECT pvsp.status As status FROM " . DB_PREFIX . "purpletree_vendor_plan pvp LEFT JOIN " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp ON (pvp.plan_id = pvsp.plan_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvp.plan_id = pvpd.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id='".(int)$seller_id."' AND pvsp.plan_id='".(int)$plan_id."' AND pvsp.status=1";
	
		$query = $this->db->query($sql);
		if($query->num_rows){
			return $query->rows;
		} else {
			return NULL;
		}
		//featured_store
	}
	
		public function getMultipleActivePlan($seller_id,$plan_id) {
		$sql = "SELECT pvpd.plan_name FROM " . DB_PREFIX . "purpletree_vendor_plan pvp LEFT JOIN " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp ON (pvp.plan_id = pvsp.plan_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvp.plan_id = pvpd.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id='".(int)$seller_id."' AND pvsp.plan_id='".(int)$plan_id."' AND pvsp.new_status=1";
	
		$query = $this->db->query($sql);
		if($query->num_rows){
			return $query->row;
		}
		//featured_store
	}
	

	
		public function getCurrentSellerPlan($seller_id) {

		$sql = "SELECT CONCAT(c.firstname, ' ', c.lastname) AS seller_name, pvpd.plan_name,pvp.no_of_product,pvp.no_of_featured_product,pvp. 	no_of_category_featured_product,pvp. 	featured_store,pvsp.start_date,pvsp.end_date,pvsp.reminder,pvsp.status,pvp.validity FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan pvp ON (pvp.plan_id = pvsp.plan_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_subscription pvps ON (pvps.seller_id = pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id = '" . (int)$seller_id . "' AND pvsp.status = 1"; 
		$query = $this->db->query($sql);
		if($query->num_rows){
			return $query->row;
		}
		
	}
	
		public function getCurrentSellerMultiplePlan($seller_id) {
		$sql = "SELECT CONCAT(c.firstname, ' ', c.lastname) AS seller_name,SUM(pvp.no_of_product) AS no_of_product ,SUM(pvp.no_of_featured_product) AS no_of_featured_product, 	SUM(pvp.no_of_category_featured_product) AS no_of_category_featured_product FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan pvp ON (pvp.plan_id = pvsp.plan_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_subscription pvps ON (pvps.seller_id = pvsp.seller_id) LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id = '" . (int)$seller_id . "' AND pvsp.new_status = 1"; 
		$query = $this->db->query($sql);
		if($query->num_rows){
			return $query->row;
		}	
	}
	public function getNoOfActivePlan($seller_id) {

		$sql = "SELECT SUM(pvsp.status) AS no_of_active_plan FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp WHERE pvsp.seller_id = '" . (int)$seller_id . "' AND pvsp.status = 1"; 
		$query = $this->db->query($sql);
		if($query->num_rows){
			return $query->row['no_of_active_plan'];
		}	
	}
	
	public function getNoOfActiveMultiplePlan($seller_id) {

		$sql = "SELECT SUM(pvsp.new_status) AS no_of_active_plan FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp WHERE pvsp.seller_id = '" . (int)$seller_id . "' AND pvsp.new_status = 1"; 
		$query = $this->db->query($sql);
		if($query->num_rows){
			return $query->row['no_of_active_plan'];
		}	
	}
	

	
	

	
	public function getplan($plan_id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "purpletree_vendor_plan"; 
		if(isset($plan_id)) {
			$sql .= " WHERE plan_id = '" . (int)$plan_id . "'"; 
		}
		$query = $this->db->query($sql);

		return $query->row;
	}
	
	public function getStoreName($data = array()){
		$sql = "SELECT seller_id,store_name FROM " . DB_PREFIX . "purpletree_vendor_stores WHERE status = '1' ";

		if (isset($data['filter_store_name']) && ($data['filter_store_name']) != '') {
			$sql .= " AND store_name LIKE '%" . $this->db->escape($data['filter_store_name']) . "%'";
		}

		$sql .= " GROUP BY seller_id";

		$sort_data = array(
			'store_name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

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
		public function getTotalSellerPorduct($seller_id) {
				$query=$this->db->query("SELECT COUNT(id) AS total_product FROM ". DB_PREFIX ."purpletree_vendor_products WHERE seller_id='".(int)$seller_id."' AND is_approved=1 ");
					if($query->num_rows){
					return $query->row['total_product'];	
					} else { 
					return NULL;
					}
			}
		public function getInvoiceStatusfromSeller($seller_id){
		$query = $this->db->query("SELECT MAX(invoice_id) AS id FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice WHERE seller_id='".(int)$seller_id."'");
	
		if($query->num_rows>0){
					$invoice_id=$query->row['id'];	
				} else {
					$invoice_id=NULL;		
				}
		$query1 = $this->db->query("SELECT status_id FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice WHERE seller_id='".(int)$seller_id."' AND invoice_id='".$invoice_id."'");
			if($query1->num_rows>0){
					return $query1->row['status_id'];	
				} else {
					return NULL;		
				}
		}
	public function getSellerPlansList($data = array()){
		$sql = "SELECT pvsp.id,pvp.validity,pvsp.invoice_id,pvpd.plan_name,pvsp.reminder,pvsp.status,pvsp.start_date,pvsp.end_date,pvsp.created_date,pvsp.modified_date FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan pvp ON(pvp.plan_id=pvsp.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id='" . $data['seller_id'] . "'";

		$sql .= " GROUP BY pvsp.id";
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

		return $query->rows;
		
		
	}
	
			public function getSellerMultiplePlansList1($data = array()){
		$sql = "SELECT pvsp.id,pvp.validity,pvsp.invoice_id,pvpd.plan_name,pvsp.reminder,pvsp.new_status,pvsp.start_date,pvsp.end_date,pvsp.created_date,pvsp.modified_date FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan pvp ON(pvp.plan_id=pvsp.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id='" . $data['seller_id'] . "'";

		$sql .= " GROUP BY pvsp.id";
		$sql .= " ORDER BY pvsp.id DESC";
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
		public function getSellerInvoiceList($data = array()){
		$sql = "SELECT pvsp.id,pvp.validity,pvsp.invoice_id,pvpd.plan_name,pvsp.reminder,pvsp.reminder1,pvsp.reminder2,pvsp.status,pvsp.start_date,pvsp.end_date,pvsp.created_date,pvsp.modified_date FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan pvp ON(pvp.plan_id=pvsp.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id='" . $data['seller_id'] . "' AND pvsp.plan_id='" . $data['plan_id'] . "'";

		$sql .= " GROUP BY pvsp.id";
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

		return $query->rows;
	}
	

		public function getSellerInvoiceList2($data = array()){
		$sql = "SELECT pvsp.id,pvp.validity,pvsp.invoice_id,pvpd.plan_name,pvsp.reminder,pvsp.reminder1,pvsp.reminder2,pvsp.new_status,pvsp.start_date,pvsp.new_end_date,pvsp.created_date,pvsp.modified_date FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan pvp ON(pvp.plan_id=pvsp.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id='" . $data['seller_id'] . "' AND pvsp.plan_id='" . $data['plan_id'] . "'";

		$sql .= " GROUP BY pvsp.id";
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

		return $query->rows;
	}
	
		public function getSellerMultiplePlansList($data = array()){

		$sql = "SELECT pvsp.id,pvp.validity,pvsp.invoice_id,pvpd.plan_name,pvsp.reminder,pvsp.new_status,pvsp.start_date,pvsp.new_end_date,pvsp.created_date,pvsp.modified_date FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan pvp ON(pvp.plan_id=pvsp.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id='" . $data['seller_id'] . "'";

		$sql .= " GROUP BY pvsp.id";
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

		return $query->rows;
		
		
	}
		public function getTotalSellerPlansListForpagination($data = array()){
	
		$sql = "SELECT COUNT(pvsp.plan_id) as total FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan pvp ON(pvp.plan_id=pvsp.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id='" . $data['seller_id'] . "' GROUP BY pvsp.plan_id ";

		$query = $this->db->query($sql);
			if($query->num_rows){
				return $query->row['total'];
			} else {
				return '0';
			}
	}
 	public function getTotalSellerPlansList($data = array()){
		$sql = "SELECT COUNT(*) as total FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan_description pvpd ON (pvpd.plan_id = pvsp.plan_id) LEFT JOIN ". DB_PREFIX ."purpletree_vendor_plan pvp ON(pvp.plan_id=pvsp.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvsp.seller_id='" . $data['seller_id'] . "'";

		$query = $this->db->query($sql);
			if($query->num_rows){
				return $query->row['total'];
			} else {
				return '0';
			}
	} 
	
		public function getPlanName($data = array()){

		$sql = "SELECT pvp.plan_id,pvpd.plan_name FROM " . DB_PREFIX . "purpletree_vendor_plan_description pvpd LEFT JOIN " . DB_PREFIX . "purpletree_vendor_plan pvp ON (pvp.plan_id = pvpd.plan_id) WHERE pvpd.language_id='". (int)$this->config->get('config_language_id') ."' AND pvp.status='1' AND pvp.plan_id NOT IN (SELECT pvsp.plan_id FROM " . DB_PREFIX . "purpletree_vendor_seller_plan pvsp WHERE pvsp.seller_id='".(int)$data['seller_id']."' ) ";

		if (!empty($data['filter_plan_name'])) {
			$sql .= " AND pvpd.plan_name LIKE '%" . $this->db->escape($data['filter_plan_name']) . "%'";
		}

		$sql .= " GROUP BY pvp.plan_id";

		$sort_data = array(
			'plan_name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

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
		if($query->num_rows){
				return $query->rows;
		}else {
			return NULL;
		}
		
		
	}
	 
	public function getInvoiceStatus($invoice_id){
		$query = $this->db->query("SELECT pvpisl.status FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice pvpi LEFT JOIN `".DB_PREFIX."purpletree_vendor_plan_invoice_status` pvpis ON (pvpis.status_id= pvpi.status_id) LEFT JOIN `".DB_PREFIX."purpletree_vendor_plan_invoice_status_languge` pvpisl ON (pvpisl.status_id = pvpis.status_id) WHERE pvpisl.language_id='". (int)$this->config->get('config_language_id') ."' AND pvpi.invoice_id='".$invoice_id."'");
		
		if($query->num_rows){
			return $query->row['status'];
		} else { 
			return '';
			}
		}
	public function getPlanId($plan_name){
		$query = $this->db->query("SELECT plan_id FROM " . DB_PREFIX . "purpletree_vendor_plan_description WHERE language_id='". (int)$this->config->get('config_language_id') ."' AND plan_name='".$plan_name."'");
		
		if($query->num_rows){
			return $query->row['plan_id'];
		} else { 
			return '';
			}
		}
	public function getSellerId($store_name){
		$query = $this->db->query("SELECT seller_id FROM " . DB_PREFIX . "purpletree_vendor_stores WHERE  store_name='".$store_name."'");
		
		if($query->num_rows){
			return $query->row['seller_id'];
		} else { 
			return '';
			}
		}
	public function getSubscriptionplan($seller_id) {
		
		$query = $this->db->query("SELECT status_id FROM " . DB_PREFIX . "purpletree_vendor_plan_subscription WHERE seller_id='".(int)$seller_id."'");
		if($query->num_rows) {
			return $query->row['status_id'];
			
		}
			return 'none';
	}
	
	public function getCustomer($customer_id) {
				$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");
					if ($query->num_rows) {
						return $query->row;
						} else {
						return NULL;
						}				
			}
	public function SellerExist($seller_id) {
				$query=$this->db->query("SELECT id FROM ". DB_PREFIX ."purpletree_vendor_plan_subscription WHERE seller_id='".(int)$seller_id."'");
					if($query->num_rows){
					return true;	
					} else { 
					return false;
					}
			}
			
	public function getCurrentPlanByPlanId($seller_id,$plan_id) {
				$query=$this->db->query("SELECT start_date,end_date,new_end_date FROM ". DB_PREFIX ."purpletree_vendor_seller_plan WHERE seller_id='".(int)$seller_id."' AND plan_id='".$plan_id."' ORDER BY id DESC LIMIT 1");
					if($query->num_rows){
					return $query->row;
					} else { 
					return false;
					}
			}
}
?>