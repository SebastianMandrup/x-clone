<?php

try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../x.php';
	$userPk = $_SESSION["user"]["user_pk"];
	$userToUnfollowPk = validatePk('userToUnfollowPk');

	require_once __DIR__ . '/../models/FollowModel.php';
	$followModel = new FollowModel();
	$followModel->unfollowUser($userPk, $userToUnfollowPk);

	require_once __DIR__ . '/../services/backend-dictionary.php';
	echo json_encode([
		'status' => 'success',
		'message' => $backendDictionary[$_SESSION['user']['user_language']]['user_unfollowed_successfully']
	]);
} catch (Exception $e) {
	require_once __DIR__ . '/../services/backend-dictionary.php';
	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $backendDictionary[$_SESSION['user']['user_language']]['an_unexpected_error_occurred']
	]);
}
