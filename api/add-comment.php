<?php

require_once __DIR__ . '/../services/protect-endpoint.php';
require_once __DIR__ . '/../x.php';
require_once __DIR__ . '/../services/backend-dictionary.php';

try {


	$userPk = $_SESSION["user"]["user_pk"];
	$postPk = validatePk('postPk');
	$commentContent = validateCommentContent();

	require_once __DIR__ . '/../models/CommentModel.php';
	$commentModel = new CommentModel();
	$commentModel->createComment($userPk, $postPk, $commentContent);

	$message = $backendDictionary[$_SESSION['user']['user_language']]['comment_added_successfully'];
	echo json_encode([
		'status' => 'success',
		'message' => $message
	]);
} catch (Exception $exception) {

	http_response_code($exception->getCode() ? (int) $exception->getCode() : 500);

	switch ($exception->getMessage()) {
		case 'Comment content cannot be empty':
			$errorMessageKey = 'comment_content_cannot_be_empty';
			break;
		default:
			http_response_code(500);
			echo json_encode([
				'status' => 'error',
				'message' => 'An unexpected error occurred'
			]);
			break;
	}
}
