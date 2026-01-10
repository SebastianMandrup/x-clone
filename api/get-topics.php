<?php

try {
	require_once __DIR__ . '/../services/x.php';
	$page = validatePage();

	require_once __DIR__ . '/../models/TopicModel.php';
	$topicModel = new TopicModel();
	$topics = $topicModel->getPage($page);

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
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Get Topics API: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/handle-exception.php';
	handleException($exception);
}
