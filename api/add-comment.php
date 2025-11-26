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

	echo json_encode([
		'status' => 'success',
		'message' => 'Comment added successfully'
	]);
} catch (Exception $e) {
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
