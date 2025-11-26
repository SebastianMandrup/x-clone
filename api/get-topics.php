<?php

try {

	require_once __DIR__ . '/../x.php';

	$page = validatePage();

	require_once __DIR__ . '/../models/TopicModel.php';

	$topicModel = new TopicModel();

	$topics = $topicModel->getPage($page);

	if (!$topics) {
		throw new Exception("No trends found.");
	}

	$last_page = false;

	// check if there are 4 results
	if (count($topics) < $topicModel->getLimit()) {
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
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
