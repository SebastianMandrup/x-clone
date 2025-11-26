<?php

require_once __DIR__ . '/../services/protect-route.php';

require __DIR__ . '/../models/PostModel.php';
require __DIR__ . '/../models/TopicModel.php';
require __DIR__ . '/../models/FollowModel.php';
require __DIR__ . '/../models/CommentModel.php';

$postModel = new PostModel();
$topicModel = new TopicModel();
$followModel = new FollowModel();
$commentModel = new CommentModel();

try {

	$currentUserPk = $_SESSION['user']['user_pk'];
	$post = $postModel->getByPk($postPk, $handle);
	$comments = $commentModel->getCommentsByPostPk($postPk, $currentUserPk);

	if (!$post) {
		Header('Location: /home?errorMessage=Post not found');
		exit;
	}

	$firstThreeTopics = $topicModel->getPage();
	$usersToFollow = $followModel->getWhoToFollow();

	require_once __DIR__ . '/../views/post.php';
} catch (Exception $e) {
	$post = null;
	$error = $e->getMessage();
	echo $error;
	// require_once __DIR__ . '/../views/404.php';
}
