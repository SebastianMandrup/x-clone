<?php

require_once __DIR__ . '/../x.php';
require_once __DIR__ . '/../services/protect-route.php';

require __DIR__ . '/../models/PostModel.php';
require __DIR__ . '/../models/TopicModel.php';
require __DIR__ . '/../models/FollowModel.php';

$postModel = new PostModel();
$topicModel = new TopicModel();
$followModel = new FollowModel();

try {

	$searchTerm = validateSearchTerm();
	$currentUserPk = $_SESSION['user']['user_pk'];
	$posts = $postModel->search($currentUserPk, $searchTerm);

	$firstThreeTopics = $topicModel->getPage();
	$usersToFollow = $followModel->getWhoToFollow();

	require_once __DIR__ . '/../views/search.php';
} catch (Exception $e) {
	$post = null;
	$error = $e->getMessage();
	header('Location: /404?error=' . urlencode($error));
}
