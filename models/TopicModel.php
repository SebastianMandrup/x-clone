<?php

class TopicModel {

	private $_db;

	static $LIMIT = 4;

	public function __construct() {
		$this->_db = require __DIR__ . '/../services/db_connector.php';
	}

	public function getPage($page = 1) {
		$LIMIT = $this::$LIMIT;
		$OFFSET = ($page - 1) * ($LIMIT - 1);

		$sql = "SELECT topic_pk, topic_name, topic_field, topic_count, topic_rank 
				FROM topics 
				ORDER BY topic_rank DESC 
				LIMIT :_limit OFFSET :offset";

		$stmt = $this->_db->prepare($sql);
		$stmt->bindParam(':_limit', $LIMIT, PDO::PARAM_INT);
		$stmt->bindParam(':offset', $OFFSET, PDO::PARAM_INT);
		$stmt->execute();

		return $stmt->fetchAll();
	}
}
