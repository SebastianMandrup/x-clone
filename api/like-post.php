<?php

try {
	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../services/x.php';
	$postPk = validatePk('postPk');
	$userPk = $_SESSION["user"]["user_pk"];

	// MUO_INTEREST
	require_once __DIR__ . '/../models/PostModel.php';
	$postModel = new PostModel();
	$dbResponse = $postModel->likePost($postPk, $userPk);

	require_once __DIR__ . '/../services/backend-dictionary.php';
	echo json_encode([
		'status' => 'success',
		'message' => $backendDictionary[$_SESSION['user']['user_language']][$dbResponse]
	]);
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Like Post API: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/handle-exception.php';
	handleException($exception);
}
