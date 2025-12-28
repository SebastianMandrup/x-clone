<?php

require_once __DIR__ . '/../services/protect-route.php';

require __DIR__ . '/../models/PostModel.php';
require __DIR__ . '/../models/TopicModel.php';
require __DIR__ . '/../models/FollowModel.php';

$postModel = new PostModel();
$topicModel = new TopicModel();
$followModel = new FollowModel();

try {

	$currentUserPk = $_SESSION['user']['user_pk'];
	$posts = $postModel->getBookmarks($currentUserPk);

	$firstThreeTopics = $topicModel->getPage();
	$usersToFollow = $followModel->getWhoToFollow();

	require_once __DIR__ . '/../views/bookmarks.php';
} catch (Exception $e) {
	$post = null;
	$error = $e->getMessage();
	header('Location: /404?error=' . urlencode($error));
}
