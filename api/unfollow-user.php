<?php

try {
	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../services/x.php';
	$userPk = $_SESSION["user"]["user_pk"];
	$userToUnfollowPk = validatePk('userToUnfollowPk');

	require_once __DIR__ . '/../models/FollowModel.php';
	$followModel = new FollowModel();
	$followModel->unfollowUser($userPk, $userToUnfollowPk);

	require_once __DIR__ . '/../services/backend-dictionary.php';
	$userLanguage = $_SESSION['user']['user_language'] ?? 'en';
	echo json_encode([
		'status' => 'success',
		'message' => $backendDictionary[$userLanguage]['user_unfollowed_successfully']
	]);
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Unfollow User API: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/handle-exception.php';
	handleException($exception);
}
