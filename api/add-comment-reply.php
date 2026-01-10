<?php
try {
	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../services/x.php';
	$userPk = $_SESSION["user"]["user_pk"];
	$commentPk = validatePk('comment_pk');
	$commentReplyContent = validateCommentReplyContent();

	require_once __DIR__ . '/../models/CommentModel.php';
	$commentModel = new CommentModel();
	$commentModel->createCommentReply($userPk, $commentPk, $commentReplyContent);

	require_once __DIR__ . '/../services/backend-dictionary.php';
	$message = $backendDictionary[$_SESSION['user']['user_language']]['reply_added_successfully'];
	echo json_encode([
		'status' => 'success',
		'message' => $message
	]);
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/handle-exception.php';
	handleException($exception);
}
