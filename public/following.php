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
	$posts = $postController->getAllFromOthersWithCounts($currentUserPk);
} catch (Exception $e) {
	$posts = [];
	$error = $e->getMessage();
}

try {
	$topics = $topicController->getFirstThree();
} catch (Exception $e) {
	$topics = [];
	$error = $e->getMessage();
}

try {
	$users = $userController->getWhoToFollow();
} catch (Exception $e) {
	$users = [];
	$error = $e->getMessage();
}

require __DIR__ . '/../views/following.php';
