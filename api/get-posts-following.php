<?php

try {
	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../services/x.php';
	$page = validatePage();

	require_once __DIR__ . '/../models/PostModel.php';
	$postModel = new PostModel();
	$currentUserPk = $_SESSION['user']['user_pk'];
	$posts = $postModel->getAllFromOthersWithCounts($currentUserPk, $page);

	$last_page = false;

	if (count($posts) < $postModel::$LIMIT + 1) {
		$last_page = true;
	}

	if (!$last_page) {
		array_pop($posts);
	}

	echo json_encode([
		'status' => 'success',
		'data' => $posts,
		'last_page' => $last_page
	]);
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Get Posts Following API: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/handle-exception.php';
	handleException($exception);
}
