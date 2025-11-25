<?php
try {

	require_once __DIR__ . '/../x.php';

	session_start();

	if (!isset($_SESSION["user"])) {
		throw new Exception("User not authenticated", 401);
	}

	$commentPk = validatePk('commentPk');
	$userPk = $_SESSION["user"]["user_pk"];

	require_once __DIR__ . '/../services/db_connector.php';

	$sql = "SELECT * FROM comment_likes WHERE comment_fk = :commentPk AND user_fk = :userPk";
	$stmt = $_db->prepare($sql);

	$stmt->bindValue(":commentPk", $commentPk);
	$stmt->bindValue(":userPk", $userPk);

	$stmt->execute();

	$post_has_like = $stmt->fetch();

	// user has never liked the post before
	if (!$post_has_like) {
		$sql = "INSERT INTO comment_likes (comment_fk, user_fk, like_created_at) VALUES (:commentPk, :userPk, UNIX_TIMESTAMP())";
		$stmt = $_db->prepare($sql);
		$stmt->bindValue(":commentPk", $commentPk);
		$stmt->bindValue(":userPk", $userPk);
		$stmt->execute();

		echo json_encode([
			'status' => 'success',
			'message' => "user liked the comment"
		]);
		exit;
	}

	// user has liked the post before
	if ($post_has_like['like_deleted_at'] == null) {
		$sql = "UPDATE comment_likes SET like_deleted_at = UNIX_TIMESTAMP() WHERE comment_fk = :commentPk AND user_fk = :userPk";
		$stmt = $_db->prepare($sql);
		$stmt->bindValue(":commentPk", $commentPk);
		$stmt->bindValue(":userPk", $userPk);
		$stmt->execute();
		echo json_encode([
			'status' => 'success',
			'message' => "user unliked the comment"
		]);
		exit;
	}

	// user is disliked the post and wants to like it again
	$sql = "UPDATE comment_likes SET like_deleted_at = NULL WHERE comment_fk = :commentPk AND user_fk = :userPk";
	$stmt = $_db->prepare($sql);
	$stmt->bindValue(":commentPk", $commentPk);
	$stmt->bindValue(":userPk", $userPk);
	$stmt->execute();
	echo json_encode([
		'status' => 'success',
		'message' => "user liked the comment"
	]);
} catch (Exception $e) {
	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
