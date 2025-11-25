<?php

class PostController {

	private $postModel;

	public function __construct() {
		require_once __DIR__ . '/../models/PostModel.php';
		$this->postModel = new PostModel();
	}

	public function getAllWithCounts($currentUserPk) {
		return $this->postModel->getAll($currentUserPk, [
			'includeLikes' => true,
			'includeComments' => true,
			'includeReposts' => true,
			'includeReference' => true
		]);
	}

	public function getAllFromOthersWithCounts($currentUserPk) {
		return $this->postModel->getAll($currentUserPk, [
			'includeLikes' => true,
			'includeComments' => true,
			'includeReposts' => true,
			'includeReference' => true,
			'onlyOthers' => true
		]);
	}

	public function getBypk($postPk, $currentUserPk) {
		return $this->postModel->getByPk($postPk, $currentUserPk);
	}
}
