<?php

try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../x.php';

	$userPk = $_SESSION["user"]["user_pk"];
	$userToFollowPk = validatePk('userToFollowPk');

	require_once __DIR__ . '/../models/FollowModel.php';
	$followModel = new FollowModel();
	$followModel->followUser($userPk, $userToFollowPk);

	echo json_encode([
		'status' => 'success',
		'message' => 'User followed successfully'
	]);
} catch (Exception $e) {

	if (str_contains($e->getMessage(), "Duplicate entry")) {
		$e = new Exception("You are already following this user", 400);
	}

	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
