<?php

class TopicModel {

	private $_db;

	public function __construct() {
		$this->_db = require __DIR__ . '/../services/db_connector.php';
	}

	public function getFirstThree() {
		$sql = 'SELECT topic_pk, topic_name, topic_field, topic_count, topic_rank FROM topics ORDER BY topic_rank DESC LIMIT 3;';
		$stmt = $this->_db->prepare($sql);
		$stmt->execute();

		$topics = $stmt->fetchAll();
		return $topics;
	}
}
