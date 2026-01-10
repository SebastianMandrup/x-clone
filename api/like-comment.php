<?php
try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../services/x.php';
	$commentPk = validatePk('commentPk');
	$userPk = $_SESSION["user"]["user_pk"];

	require_once __DIR__ . '/../models/CommentModel.php';
	$commentModel = new CommentModel();
	$dbResponse = $commentModel->likeComment($commentPk, $userPk);

	require_once __DIR__ . '/../services/backend-dictionary.php';
	echo json_encode([
		'status' => 'success',
		'message' => $backendDictionary[$_SESSION['user']['user_language']][$dbResponse]
	]);
} catch (Exception $e) {
	require_once __DIR__ . '/../services/backend-dictionary.php';
	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $backendDictionary[$_SESSION['user']['user_language']]['an_unexpected_error_occurred']
	]);
}
