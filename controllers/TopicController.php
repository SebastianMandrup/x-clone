<?php

class TopicController {

	private $topicModel;

	public function __construct() {
		require_once __DIR__ . '/../models/TopicModel.php';
		$this->topicModel = new TopicModel();
	}

	public function getFirstThree() {
		return $this->topicModel->get(['firstThree' => true]);
	}
}
