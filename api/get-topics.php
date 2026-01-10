<?php

try {

	require_once __DIR__ . '/../services/x.php';
	$page = validatePage();

	require_once __DIR__ . '/../models/TopicModel.php';
	$topicModel = new TopicModel();
	$topics = $topicModel->getPage($page);

	if (!$topics) {
		throw new Exception("No topics found.");
	}

	$last_page = false;

	// check if there are 4 results
	if (count($topics) < $topicModel::$LIMIT + 1) {
		$last_page = true;
	}

	// remove last item if last page
	if (!$last_page) {
		array_pop($topics);
	}

	echo json_encode([
		'status' => 'success',
		'data' => $topics,
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
