<?php

try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../x.php';

	$page = validatePage();

	require_once __DIR__ . '/../models/PostModel.php';

	$postModel = new PostModel();

	$currentUserPk = $_SESSION['user']['user_pk'];

	$posts = $postModel->getAllWithCounts($currentUserPk, $page);

	if (!$posts) {
		throw new Exception("No posts found.");
	}

	$last_page = false;

	// check if there are 4 results
	if (count($posts) < $postModel->getLimit()) {
		$last_page = true;
	}

	// remove last item if last page
	if (!$last_page) {
		array_pop($posts);
	}

	echo json_encode([
		'status' => 'success',
		'data' => $posts,
		'last_page' => $last_page
	]);
} catch (Exception $e) {
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
