<?php

require_once __DIR__ . '/../services/protect-route.php';

require_once __DIR__ . '/../models/PostModel.php';
require_once __DIR__ . '/../models/TopicModel.php';
require_once __DIR__ . '/../models/UserModel.php';
require_once __DIR__ . '/../models/FollowModel.php';

$postModel = new PostModel();
$topicModel = new TopicModel();
$userModel = new UserModel();
$followModel = new FollowModel();


try {
	$currentUserPk = $_SESSION['user']['user_pk'];
	$posts = $postModel->getAllWithCounts($currentUserPk);
	$firstThreeTopics = $topicModel->getPage();
	$usersToFollow = $followModel->getWhoToFollow();
} catch (Exception $e) {
	$usersToFollow = [];
	$firstThreeTopics = [];
	$posts = [];
	$error = $e->getMessage();
}

require __DIR__ . '/../views/home.php';
