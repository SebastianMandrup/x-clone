<?php

try {

	session_start();

	if (!isset($_SESSION['user'])) {
		throw new Exception("User not logged in.", 401);
	}

	require_once __DIR__ . '/../x.php';

	$page = validatePage();

	require_once __DIR__ . '/../db_connector.php';

	$LIMIT = 4;
	$OFFSET = ($page - 1) * ($LIMIT - 1);

	$sql = "SELECT user_pk, user_name, user_handle 
			FROM users 
			LEFT JOIN follows ON users.user_pk = follows.followed_user_fk AND follows.following_user_fk = :userPk
			WHERE follows.followed_user_fk IS NULL
			AND user_pk != :userPk 
			ORDER BY user_pk 
			LIMIT :_limit OFFSET :offset;
	";
	$stmt = $_db->prepare($sql);
	$stmt->bindValue(':userPk', $_SESSION['user']['user_pk']);
	$stmt->bindValue(':_limit', $LIMIT, PDO::PARAM_INT);
	$stmt->bindValue(':offset', $OFFSET, PDO::PARAM_INT);

	$stmt->execute();

	$whoToFollow = $stmt->fetchall();

	if (!$whoToFollow) {
		throw new Exception("No users found.");
	}

	$last_page = false;

	// check if there are 4 results
	if (count($whoToFollow) < $LIMIT) {
		$last_page = true;
	}

	// remove last item if last page
	if (!$last_page) {
		array_pop($whoToFollow);
	}

	echo json_encode([
		'status' => 'success',
		'data' => $whoToFollow,
		'last_page' => $last_page
	]);
} catch (Exception $e) {
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
