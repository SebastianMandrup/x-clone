<?php

class PostController {

	private $postModel;

	public function __construct() {
		require_once __DIR__ . '/../models/PostModel.php';
		$this->postModel = new PostModel();
	}

	public function getAllWithCounts($currentUserPk) {
		return $this->postModel->getAllWithCounts($currentUserPk);
	}

	public function getAllFromOthersWithCounts($currentUserPk) {
		return $this->postModel->getAllFromOthersWithCounts($currentUserPk);
	}
}
