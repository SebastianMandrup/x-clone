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

	// PROTECTED ROUTE STARTS SESSION
	$currentUserPk = $_SESSION['user']['user_pk'];
	$user = $userModel->getByHandle($handle, $currentUserPk);

	if (!$user) {
		throw new Exception("User not found");
	}

	$posts = $postModel->getAllWithCounts($user['user_pk']);
	$firstThreeTopics = $topicModel->getPage();
	$usersToFollow = $followModel->getWhoToFollow();

	require_once __DIR__ . '/../views/profile.php';
} catch (Exception $e) {
	$user = null;
	$error = $e->getMessage();
	header("Location: /404?error=" . urlencode($error));
	exit();
}
