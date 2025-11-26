<?php
try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../x.php';

	$commentPk = validatePk('commentPk');
	$userPk = $_SESSION["user"]["user_pk"];

	require_once __DIR__ . '/../models/CommentModel.php';

	$commentModel = new CommentModel();
	$commentModel->likeComment($commentPk, $userPk);
} catch (Exception $e) {
	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
