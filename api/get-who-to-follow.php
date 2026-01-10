<?php

try {
	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../services/x.php';
	$page = validatePage();

	require_once __DIR__ . '/../models/FollowModel.php';
	$followModel = new FollowModel();
	$whoToFollow = $followModel->getWhoToFollow($page);

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
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Get Who To Follow API: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/handle-exception.php';
	handleException($exception);
}
