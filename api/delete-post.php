<?php
try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../services/x.php';
	$postPk = validatePk('postPk');
	$userPk = $_SESSION["user"]["user_pk"];

	require_once __DIR__ . '/../models/PostModel.php';
	$postModel = new PostModel();
	$postModel->deletePost($postPk, $userPk);

	require_once __DIR__ . '/../services/backend-dictionary.php';
	echo json_encode([
		'status' => 'success',
		'message' => $backendDictionary[$_SESSION['user']['user_language']]['post_deleted_successfully']
	]);
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Delete Post API: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/handle-exception.php';
	handleException($exception);
}
