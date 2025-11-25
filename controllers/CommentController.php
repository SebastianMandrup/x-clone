<?php

class CommentController {

	private $commentModel;

	public function __construct() {
		require_once __DIR__ . '/../models/CommentModel.php';
		$this->commentModel = new CommentModel();
	}

	public function getCommentsByPostPk($postPk, $currentUserPk) {
		return $this->commentModel->getCommentsByPostPk($postPk, $currentUserPk);
	}

	public function createComment($userPk, $postPk, $commentContent) {
		return $this->commentModel->createComment($userPk, $postPk, $commentContent);
	}
}
