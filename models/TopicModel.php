<?php

class TopicModel {

	private $_db;

	public function __construct() {
		$this->_db = require __DIR__ . '/../services/db_connector.php';
	}

	/**
	 * Fetch topics with options.
	 *
	 * Options:
	 *  - orderBy: string ('rank'|'count')
	 *  - firstThree: bool
	 */
	public function get(array $options) {

		$selects = [
			't.topic_pk',
			't.topic_name',
			't.topic_field',
			't.topic_count',
			't.topic_rank'
		];

		$limit = '';

		if (!empty($options['firstThree'])) {
			$limit = 'LIMIT 3';
		}

		$orderBy = 't.topic_rank DESC';

		$sql = "
			SELECT " . implode(", ", $selects) . "
			FROM topics t
			ORDER BY {$orderBy}
			{$limit}
		";
		$stmt = $this->_db->prepare($sql);
		$stmt->execute();

		$topics = $stmt->fetchAll();
		return $topics;
	}
}
