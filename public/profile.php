<?php

require_once __DIR__ . '/../services/protect-route.php';

require_once __DIR__ . '/../controllers/PostController.php';
require_once __DIR__ . '/../controllers/TopicController.php';
require_once __DIR__ . '/../controllers/UserController.php';

$postController = new PostController();
$topicController = new TopicController();
$userController = new UserController();

try {

	// PROTECTED ROUTE STARTS SESSION
	$currentUserPk = $_SESSION['user']['user_pk'];
	$user = $userController->getByHandle($username, $currentUserPk);
	$posts = $postController->getAllWithCounts($user['user_pk']);
	$firstThreeTopics = $topicController->getFirstThree();
	$usersToFollow = $userController->getWhoToFollow();

	require_once __DIR__ . '/../views/profile.php';
} catch (Exception $e) {
	$user = null;
	$error = $e->getMessage();
}
