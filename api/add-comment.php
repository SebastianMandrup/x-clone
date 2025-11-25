<?php

try {

	require_once __DIR__ . '/../x.php';

	session_start();

	if (!isset($_SESSION["user"])) {
		throw new Exception("User not authenticated", 401);
	}

	$userPk = $_SESSION["user"]["user_pk"];
	$postPk = validatePk('postPk');
	$commentContent = validateCommentContent();
	$commentPk = bin2hex(random_bytes(25));

	require_once __DIR__ . '/../services/db_connector.php';

	$sql = "INSERT INTO comments (comment_pk, comment_user_fk, comment_post_fk, comment_content, comment_created_at, comment_updated_at) VALUES (:comment_pk, :user_pk, :post_pk, :comment_content, UNIX_TIMESTAMP(), UNIX_TIMESTAMP())";
	$stmt = $_db->prepare($sql);
	$stmt->bindParam(':comment_pk', $commentPk);
	$stmt->bindParam(':user_pk', $userPk);
	$stmt->bindParam(':post_pk', $postPk);
	$stmt->bindParam(':comment_content', $commentContent);
	$stmt->execute();

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
