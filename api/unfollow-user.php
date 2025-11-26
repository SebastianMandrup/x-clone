<?php

try {

	session_start();

	if (!isset($_SESSION["user"])) {
		throw new Exception("User not authenticated", 401);
	}

	require_once __DIR__ . '/../x.php';

	$userPk = $_SESSION["user"]["user_pk"];
	$userToUnfollowPk = validatePk('userToUnfollowPk');

	require_once __DIR__ . '/../models/FollowModel.php';
	$followModel = new FollowModel();

	$followModel->unfollowUser($userPk, $userToUnfollowPk);

	echo json_encode([
		'status' => 'success',
		'message' => 'User unfollowed successfully'
	]);
} catch (Exception $e) {
	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
