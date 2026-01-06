<?php
try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../x.php';
	$userPk = $_SESSION["user"]["user_pk"];
	$userToFollowPk = validatePk('userToFollowPk');

	require_once __DIR__ . '/../models/FollowModel.php';
	$followModel = new FollowModel();
	$followModel->followUser($userPk, $userToFollowPk);

	require_once __DIR__ . '/../services/backend-dictionary.php';
	echo json_encode([
		'status' => 'success',
		'message' => $backendDictionary[$_SESSION['user']['user_language']]['user_followed_successfully']
	]);
} catch (Exception $e) {
	http_response_code(500);
	
	require_once __DIR__ . '/../services/backend-dictionary.php';
	if (str_contains($e->getMessage(), "Duplicate entry")) {
		$errorMessage = $backendDictionary[$_SESSION['user']['user_language']]['user_already_followed'];
		echo json_encode([
			'status' => 'error',
			'message' => $errorMessage
		]);
		return;
	}

	echo json_encode([
		'status' => 'error',
		'message' => $backendDictionary[$_SESSION['user']['user_language']]['an_unexpected_error_occurred']
	]);
}
