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

	header("Location: /?successToast=" . rawurlencode("Succesfully added reply."));
} catch (Exception $e) {
	http_response_code($e->getCode() ? (int) $e->getCode() : 500);
	header("Location: /?errorToast=" . rawurlencode($e->getMessage()));
}
