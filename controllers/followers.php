<?php

require_once __DIR__ . '/../services/protect-route.php';

require_once __DIR__ . '/../models/UserModel.php';
require_once __DIR__ . '/../models/TopicModel.php';
require_once __DIR__ . '/../models/FollowModel.php';

$userModel = new UserModel();
$topicModel = new TopicModel();
$followModel = new FollowModel();

try {

	$endpoint = 'followers';

	$topics = $topicModel->getPage();
	$firstThreeTopics = array_slice($topics, 0, 3);
	$usersToFollow = $followModel->getWhoToFollow();

	$currentUserPk = $_SESSION['user']['user_pk'];

	$users = $followModel->getFollowersByHandle($handle, $currentUserPk);

	require __DIR__ . '/../views/followersOrFollowing.php';
} catch (Exception $e) {
	echo "Error: " . $e->getMessage();
}
