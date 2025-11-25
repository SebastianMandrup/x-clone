<?php

try {

	session_start();

	if (!isset($_SESSION["user"])) {
		throw new Exception("User not authenticated", 401);
	}

	require_once __DIR__ . '/../x.php';

	$userPk = $_SESSION["user"]["user_pk"];
	$userToFollowPk = validatePk('userToFollowPk');

	require_once __DIR__ . '/../services/db_connector.php';

	$sql = "UPDATE follows SET follow_deleted_at = NULL WHERE following_user_fk = :userPk AND followed_user_fk = :userToFollowPk";
	$stmt = $_db->prepare($sql);
	$stmt->bindParam(':userPk', $userPk);
	$stmt->bindParam(':userToFollowPk', $userToFollowPk);
	$stmt->execute();


	$succes = $stmt->rowCount() > 0;

	if (!$succes) {
		$sql = "INSERT INTO follows (following_user_fk, followed_user_fk, follow_created_at) VALUES (:userPk, :userToFollowPk, UNIX_TIMESTAMP())";
		$stmt = $_db->prepare($sql);
		$stmt->bindParam(':userPk', $userPk);
		$stmt->bindParam(':userToFollowPk', $userToFollowPk);
		$stmt->execute();
	}

	echo json_encode([
		'status' => 'success',
		'message' => 'User followed successfully'
	]);
} catch (Exception $e) {

	if (str_contains($e->getMessage(), "Duplicate entry")) {
		$e = new Exception("You are already following this user", 400);
	}

	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
