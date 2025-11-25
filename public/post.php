<?php

require_once __DIR__ . '/../services/protect-route.php';

require __DIR__ . '/../controllers/PostController.php';
require __DIR__ . '/../controllers/TopicController.php';
require __DIR__ . '/../controllers/UserController.php';
require __DIR__ . '/../controllers/CommentController.php';

$postController = new PostController();
$topicController = new TopicController();
$userController = new UserController();
$commentController = new CommentController();

try {

	$currentUserPk = $_SESSION['user']['user_pk'];
	$post = $postController->getByPk($postPk, $username);

	if (!$post) {
		Header('Location: /home?errorMessage=Post not found');
		exit;
	}

	$comments = $commentController->getCommentsByPostPk($postPk, $currentUserPk);
	$firstThreeTopics = $topicController->getFirstThree();
	$usersToFollow = $userController->getWhoToFollow();

	require_once __DIR__ . '/../views/post.php';
} catch (Exception $e) {
	$post = null;
	$error = $e->getMessage();

	require_once __DIR__ . '/../views/404.php';
}
