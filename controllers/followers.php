<?php

try {
	require_once __DIR__ . '/../services/protect-route.php';

	require_once __DIR__ . '/../models/TopicModel.php';
	$topicModel = new TopicModel();
	$topics = $topicModel->getPage();
	$firstThreeTopics = array_slice($topics, 0, 3);

	require_once __DIR__ . '/../models/FollowModel.php';
	$followModel = new FollowModel();
	$currentUserPk = $_SESSION['user']['user_pk'];
	$users = $followModel->getFollowersByHandle($handle, $currentUserPk);
	$usersToFollow = $followModel->getWhoToFollow();

	$endpoint = 'followers';

	require __DIR__ . '/../views/followersOrFollowing.php';
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError("Followers Controller Error: " . $exception->getMessage());

	require_once __DIR__ . '/../services/backend-dictionary.php';
	$error = $backendDictionary[$_SESSION['user']['user_language']]['an_unexpected_error_occurred'];
	header('Location: /404?error=' . urlencode($error));
}
