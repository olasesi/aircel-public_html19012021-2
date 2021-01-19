<?php

/**
 * Class ModelExtensionGetresponse
 */
class ModelExtensionGetresponse extends Model
{
    /**
     * @return array
     */
	public function getContacts() {
		$query = $this->db->query("SELECT
            cu.firstname,
            cu.lastname,
            cu.email,
            cu.telephone,
            cu.ip,
            ad.address_1 as address,
            ad.postcode,
            ad.city,
            ca.name AS country
            FROM " . DB_PREFIX . "customer cu
            LEFT JOIN " . DB_PREFIX . "address ad ON ad.customer_id = cu.customer_id
            LEFT JOIN " . DB_PREFIX . "country ca ON ad.country_id = ca.country_id
            WHERE cu.newsletter = 1");

		return $query->rows;
	}
}
