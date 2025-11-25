<?php

try {

	session_start();

	if (!isset($_SESSION["user"])) {
		throw new Exception("User not authenticated", 401);
	}

	require_once __DIR__ . '/../x.php';

	$userPk = $_SESSION["user"]["user_pk"];
	$userToUnfollowPk = validatePk('userToUnfollowPk');

	require_once __DIR__ . '/../db_connector.php';

	$sql = "UPDATE follows SET follow_deleted_at = UNIX_TIMESTAMP() WHERE following_user_fk = :userPk AND followed_user_fk = :userToUnfollowPk AND follow_deleted_at IS NULL";
	$stmt = $_db->prepare($sql);
	$stmt->bindParam(':userPk', $userPk);
	$stmt->bindParam(':userToUnfollowPk', $userToUnfollowPk);
	$stmt->execute();

	$isUserUnfollowed = $stmt->rowCount() > 0;

	if (!$isUserUnfollowed) {
		throw new Exception("You are not following this user", 400);
	}

	echo json_encode([
		'status' => 'success',
		'message' => 'User unfollowed successfully'
	]);
} catch (Exception $e) {
	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
