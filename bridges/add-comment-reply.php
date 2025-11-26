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

	echo json_encode([
		'status' => 'success',
		'message' => 'Comment reply added successfully'
	]);
} catch (Exception $e) {
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
