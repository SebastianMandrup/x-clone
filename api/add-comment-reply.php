<?php
try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../x.php';
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
} catch (Exception $e) {
	http_response_code(500);

	switch ($e->getMessage()) {
		case 'Comment reply content cannot be empty':
			http_response_code(400);
			$exceptionKey = 'post_content_cannot_be_empty';
			break;
		default:
			$exceptionKey = 'an_unexpected_error_occurred';
			break;
	}
	$errorMessage = $backendDictionary[$_SESSION['user']['user_language']][$exceptionKey];
	echo json_encode([
		'status' => 'error',
		'message' => $errorMessage
	]);
}
