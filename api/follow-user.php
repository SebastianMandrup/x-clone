<?php

try {
	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../services/x.php';
	$userPk = $_SESSION["user"]["user_pk"];
	$userToFollowPk = validatePk('userToFollowPk');

	require_once __DIR__ . '/../models/FollowModel.php';
	$followModel = new FollowModel();
	$followModel->followUser($userPk, $userToFollowPk);

	require_once __DIR__ . '/../services/backend-dictionary.php';
	echo json_encode([
		'status' => 'success',
		'message' => $backendDictionary[$_SESSION['user']['user_language']]['user_followed_successfully']
	]);
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Follow User API: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/handle-exception.php';
	handleException($exception);
}
