<?php

require_once __DIR__ . '/../services/protect-route.php';

require_once __DIR__ . '/../controllers/PostController.php';
require_once __DIR__ . '/../controllers/TopicController.php';
require_once __DIR__ . '/../controllers/UserController.php';

$postController = new PostController();
$topicController = new TopicController();
$userController = new UserController();


try {
	$currentUserPk = $_SESSION['user']['user_pk'];
	$posts = $postController->getAllWithCounts($currentUserPk);
	$firstThreeTopics = $topicController->getFirstThree();
	$usersToFollow = $userController->getWhoToFollow();
} catch (Exception $e) {
	$usersToFollow = [];
	$firstThreeTopics = [];
	$posts = [];
	$error = $e->getMessage();
}

require __DIR__ . '/../views/home.php';
