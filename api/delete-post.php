<?php
try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../x.php';

	$postPk = validatePk('postPk');
	$userPk = $_SESSION["user"]["user_pk"];

	require_once __DIR__ . '/../models/PostModel.php';
	$postModel = new PostModel();

	$postModel->deletePost($postPk, $userPk);
	echo json_encode([
		'status' => 'success',
		'message' => 'Post deleted successfully.'
	]);
} catch (Exception $e) {
	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
