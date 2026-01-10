<?php

try {
	require_once __DIR__ . '/../services/protect-route.php';

	require_once __DIR__ . '/../services/x.php';
	$searchTerm = validateSearchTerm();

	require_once __DIR__ . '/../models/PostModel.php';
	$postModel = new PostModel();
	$currentUserPk = $_SESSION['user']['user_pk'];
	$posts = $postModel->search($currentUserPk, $searchTerm);

	require_once __DIR__ . '/../models/TopicModel.php';
	$topicModel = new TopicModel();
	$firstThreeTopics = $topicModel->getPage();

	require_once __DIR__ . '/../models/FollowModel.php';
	$followModel = new FollowModel();
	$usersToFollow = $followModel->getWhoToFollow();

	require_once __DIR__ . '/../views/search.php';
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError("Search Controller Error: " . $exception->getMessage());

	require_once __DIR__ . '/../services/backend-dictionary.php';
	$error = $backendDictionary[$_SESSION['user']['user_language']]['an_unexpected_error_occurred'];
	header('Location: /404?error=' . urlencode($error));
}
