<?php

try {
	require_once __DIR__ . '/../services/protect-route.php';

	require_once __DIR__ . '/../models/PostModel.php';
	$postModel = new PostModel();
	$currentUserPk = $_SESSION['user']['user_pk'];
	$posts = $postModel->getAllWithCounts($currentUserPk);

	$last_page = false;

	if (count($posts) < $postModel::$LIMIT + 1) {
		$last_page = true;
	}

	if (!$last_page) {
		array_pop($posts);
	}

	require_once __DIR__ . '/../models/TopicModel.php';
	$topicModel = new TopicModel();
	$topics = $topicModel->getPage();
	$firstThreeTopics = array_slice($topics, 0, 3);

	require_once __DIR__ . '/../models/FollowModel.php';
	$followModel = new FollowModel();
	$usersToFollow = $followModel->getWhoToFollow();

	$isForYou = true;
	require_once __DIR__ . '/../views/home.php';
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError("Home Controller Error: " . $exception->getMessage());

	require_once __DIR__ . '/../services/backend-dictionary.php';
	$error = $backendDictionary[$_SESSION['user']['user_language']]['an_unexpected_error_occurred'];
	header('Location: /404?error=' . urlencode($error));
}
