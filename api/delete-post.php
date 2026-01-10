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
} catch (Exception $e) {
	http_response_code(500);
	require_once __DIR__ . '/../services/backend-dictionary.php';
	$errorMessage = $backendDictionary[$_SESSION['user']['user_language']]['an_unexpected_error_occurred'];
	echo json_encode([
		'status' => 'error',
		'message' => $errorMessage
	]);
}
