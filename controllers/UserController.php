<?php

class UserController {

	private $userModel;

	public function __construct() {
		require_once __DIR__ . '/../models/UserModel.php';
		$this->userModel = new UserModel();
	}

	public function getWhoToFollow() {
		return $this->userModel->getWhoToFollow();
	}
}
