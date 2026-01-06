<?php
try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../x.php';
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
	
} catch (Exception $e) {

	http_response_code(500);
	switch ($e->getMessage()) {
		case 'Comment content cannot be empty':
			$errorMessageKey = 'comment_content_cannot_be_empty';
			break;
		default:
			$errorMessageKey = 'an_unexpected_error_occurred';
			break;
	}

	$errorMessage = $backendDictionary[$_SESSION['user']['user_language']][$errorMessageKey];
	echo json_encode([
		'status' => 'error',
		'message' => $errorMessage
	]);
}
