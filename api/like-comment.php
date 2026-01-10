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
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Like Comment API: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/handle-exception.php';
	handleException($exception);
}
