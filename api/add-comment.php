<?php
try {
	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../services/x.php';
	$userPk = $_SESSION["user"]["user_pk"];
	$postPk = validatePk('postPk');
	$commentContent = validateCommentContent();

	require_once __DIR__ . '/../models/CommentModel.php';
	$commentModel = new CommentModel();
	$commentModel->createComment($userPk, $postPk, $commentContent);

	require_once __DIR__ . '/../services/backend-dictionary.php';
	$message = $backendDictionary[$_SESSION['user']['user_language']]['comment_added_successfully'];
	echo json_encode([
		'status' => 'success',
		'message' => $message
	]);
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Add Comment API: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/handle-exception.php';
	handleException($exception);
}
