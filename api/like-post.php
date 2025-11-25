<?php
try {

	require_once __DIR__ . '/../x.php';

	session_start();

	if (!isset($_SESSION["user"])) {
		throw new Exception("User not authenticated", 401);
	}

	$postPk = validatePk('postPk');
	$userPk = $_SESSION["user"]["user_pk"];

	require_once __DIR__ . '/../services/db_connector.php';

	$sql = "SELECT * FROM post_likes WHERE post_fk = :postPk AND user_fk = :userPk";
	$stmt = $_db->prepare($sql);

	$stmt->bindValue(":postPk", $postPk);
	$stmt->bindValue(":userPk", $userPk);

	$stmt->execute();

	$post_has_like = $stmt->fetch();

	// user has never liked the post before
	if (!$post_has_like) {
		$sql = "INSERT INTO post_likes (post_fk, user_fk, like_created_at) VALUES (:postPk, :userPk, UNIX_TIMESTAMP())";
		$stmt = $_db->prepare($sql);
		$stmt->bindValue(":postPk", $postPk);
		$stmt->bindValue(":userPk", $userPk);
		$stmt->execute();

		echo json_encode([
			'status' => 'success',
			'message' => "user liked the post"
		]);
		exit;
	}

	// user has liked the post before
	if ($post_has_like['like_deleted_at'] == null) {
		$sql = "UPDATE post_likes SET like_deleted_at = UNIX_TIMESTAMP() WHERE post_fk = :postPk AND user_fk = :userPk";
		$stmt = $_db->prepare($sql);
		$stmt->bindValue(":postPk", $postPk);
		$stmt->bindValue(":userPk", $userPk);
		$stmt->execute();
		echo json_encode([
			'status' => 'success',
			'message' => "user unliked the post"
		]);
		exit;
	}

	// user is disliked the post and wants to like it again
	$sql = "UPDATE post_likes SET like_deleted_at = NULL WHERE post_fk = :postPk AND user_fk = :userPk";
	$stmt = $_db->prepare($sql);
	$stmt->bindValue(":postPk", $postPk);
	$stmt->bindValue(":userPk", $userPk);
	$stmt->execute();
	echo json_encode([
		'status' => 'success',
		'message' => "user liked the post"
	]);
} catch (Exception $e) {
	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
