<?php
class ModelExtensionModuleActivity extends Model {
	public function addActivity($key, $data) {
	    date_default_timezone_set('Africa/Lagos');
		$this->db->query("INSERT INTO `" . DB_PREFIX . "user_activity` SET `user_id` = '" . (int)$this->user->getId() . "', `key` = '" . $this->db->escape($key) . "', `data` = '" . $this->db->escape($data) . "', `ip` = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', `date_added` = NOW()");
	}
	
	public function getActivities($data) {
		$sql = "SELECT u.user_id, u.username,CONCAT(u.firstname,' ',u.lastname) AS user, ua.* FROM `" . DB_PREFIX . "user_activity` ua LEFT JOIN `" . DB_PREFIX . "user` u ON (u.user_id = ua.user_id) ORDER BY ua.date_added DESC";

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

	public function getTotalActivities() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "user_activity");

		return $query->row['total'];
	}

	public function deleteActivities() {
		$this->db->query("TRUNCATE TABLE `" . DB_PREFIX . "user_activity`");
	}
}