<?php

try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../x.php';
	$page = validatePage();

	require_once __DIR__ . '/../models/FollowModel.php';
	$followModel = new FollowModel();
	$whoToFollow = $followModel->getWhoToFollow($page);

	if (!$whoToFollow) {
		throw new Exception("No users found.");
	}

	$last_page = false;

	// check if there are 4 results
	if (count($whoToFollow) < $followModel->getLimit()) {
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

	require_once __DIR__ . '/../services/backend-dictionary.php';
	http_response_code(500);
	echo json_encode([
		'status' => 'error',
		'message' => $backendDictionary[$_SESSION['user']['user_language']]['an_unexpected_error_occurred']
	]);
}
