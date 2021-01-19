<?php
class ModelExtensionPurpletreeMultivendorSubscriptionplanInvoice extends Model {
	
	 public function getinvoice($id) {
		 	$query = $this->db->query("SELECT * FROM `".DB_PREFIX."purpletree_vendor_plan_invoice` WHERE invoice_id='". (int)$id ."'");
			if($query->num_rows){
				return $query->row;	
			} else {
				return NUll;		
			}
	 }
	 public function getsellerfromInvoice($invoice_id) {
		 	$query = $this->db->query("SELECT seller_id FROM `".DB_PREFIX."purpletree_vendor_seller_plan` WHERE invoice_id='". (int)$invoice_id ."'");
			if($query->num_rows){
				return $query->row['seller_id'];	
			} else {
				return NUll;		
			}
	 }
	 public function getsellerplanid($invoice_id) {
		 	$query = $this->db->query("SELECT plan_id FROM `".DB_PREFIX."purpletree_vendor_seller_plan` WHERE invoice_id='". (int)$invoice_id ."'");
			if($query->num_rows){
				return $query->row['plan_id'];	
			} else {
				return NUll;		
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
	 		public function getStoreDetail($customer_id){
		$query = $this->db->query("SELECT pvs.* FROM " . DB_PREFIX . "purpletree_vendor_stores pvs where pvs.seller_id='".(int)$customer_id."'");
		return $query->row;
		}
		public function getInvoiceHistory($invoice_id){

	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice_history where invoice_id='".(int)$invoice_id."' ORDER BY id DESC");
			if($query->num_rows){
				return $query->rows;	
			} else {
				return NUll;		
			}

	}		
	 public function getstausfromid($id) {
		 	$query = $this->db->query("SELECT pvpisl.status FROM `".DB_PREFIX."purpletree_vendor_plan_invoice_status` pvpis LEFT JOIN `".DB_PREFIX."purpletree_vendor_plan_invoice_status_languge` pvpisl ON (pvpisl.status_id = pvpis.status_id) WHERE pvpisl.language_id='". (int)$this->config->get('config_language_id') ."' AND pvpisl.status_id ='". $id ."'");
			if($query->num_rows){
				return $query->row['status'];	
			} else {
				return NUll;		
			}
	 }
	 public function getstatuslist() {
		 	$query = $this->db->query("SELECT pvpis.status_id,pvpisl.status FROM `".DB_PREFIX."purpletree_vendor_plan_invoice_status` pvpis LEFT JOIN `".DB_PREFIX."purpletree_vendor_plan_invoice_status_languge` pvpisl ON (pvpisl.status_id = pvpis.status_id) WHERE pvpisl.language_id='". (int)$this->config->get('config_language_id') ."'");
			if($query->num_rows){
				return $query->rows;	
			} else {
				return NUll;		
			}
	 }
	 public function addOfflinePayment($data,$invoice_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "purpletree_vendor_plan_invoice_history SET invoice_id = '" . (int)$invoice_id . "', `status_id` = '" . (int)$data['status_id'] . "',  	payment_mode = 'offline',transaction_id = '" . (int)$data['transaction_id'] . "',comment = '" . $data['comment'] . "', modified_date = NOW(), created_date = NOW()");
				$this->db->query("UPDATE `".  DB_PREFIX ."purpletree_vendor_plan_invoice` SET status_id='".$data['status_id']."' WHERE invoice_id='".$invoice_id."'");
	 }
	 public function getPlanId($invoice_id,$old_invoice_id){
			$invoice=array();
			$old_invoice=array();
			$data=array();
			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice where invoice_id='".(int)$invoice_id."'");
			//old invoice id


				if($query->num_rows){
					$invoice=$query->row;
					$sts 	= $this->getstausfromid($invoice['status_id']);
					$data['invoice']=array();
					$data['invoice']['seller_id']=$invoice['seller_id'];
					$data['invoice']['plan_id']=$invoice['plan_id'];
					$data['invoice']['payment_mode']=$invoice['payment_mode'];
					$data['invoice']['status_id']=$sts;
					$data['invoice']['created_date']=date('d/m/Y',strtotime($invoice['created_date']));
					// print_r($data['invoice']);
					$query1 = $this->db->query("SELECT * FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice_item where invoice_id='".(int)$invoice_id."'");
					if($query1->num_rows){
						$invoice1=$query1->rows;
						$data['invoice']['item']=array();
						foreach($query1->rows as $item){

							if($item['code']!='previous_balance'){
							$data['invoice']['item'][]=array(
							'title'=>$item['title'],
							'code'=>$item['code'],
							'price'=>$item['price']
							);
							} else {
				$old_invoice_data = $this->db->query("SELECT * FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice_item where invoice_id='".(int)$old_invoice_id."'");

				if($old_invoice_data->num_rows){
				foreach($old_invoice_data->rows as $olditem){

					if($olditem['code']=='previous_balance'){
					$data['invoice']['item'][]=array(
					'title'=>$olditem['title'],
					'code'=>$olditem['code'],
					'price'=>$olditem['price']
					);
					}
				}
			}
							}
						}

					}
				}
			return $data;
		}
		public function getInvoiceId($seller_id){
		$query = $this->db->query("SELECT invoice_id FROM " . DB_PREFIX . "purpletree_vendor_seller_plan WHERE seller_id='".(int)$seller_id."' AND status=1");
	
		if($query->num_rows>0){
					return $query->row['invoice_id'];	
				} else {
					return NULL;		
				}
		}
		public function getCurrentPlanByPlanId($invoice_id) {
				$query=$this->db->query("SELECT start_date,end_date,new_end_date FROM ". DB_PREFIX ."purpletree_vendor_seller_plan WHERE invoice_id='".(int)$invoice_id."'");
					if($query->num_rows){
					return $query->row;
					} else { 
					return false;
					}
			}
		public function enableSubscription($invoice_id) {
			 $query= $this->db->query("SELECT seller_id FROM " . DB_PREFIX . "purpletree_vendor_plan_invoice WHERE invoice_id='".(int)$invoice_id."' AND status_id=2");
			 if($query->num_rows>0){
				 $query= $this->db->query("UPDATE " . DB_PREFIX . "purpletree_vendor_plan_subscription SET status_id=1 WHERE seller_id='".$query->row['seller_id']."'");
			 }
		}
}