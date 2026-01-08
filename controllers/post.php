<?php

try {
	require_once __DIR__ . '/../services/protect-route.php';

	require_once __DIR__ . '/../models/PostModel.php';
	$postModel = new PostModel();
	$post = $postModel->getByPk($postPk, $handle);

	require_once __DIR__ . '/../models/TopicModel.php';
	$topicModel = new TopicModel();
	$firstThreeTopics = $topicModel->getPage();

	require_once __DIR__ . '/../models/FollowModel.php';
	$followModel = new FollowModel();
	$usersToFollow = $followModel->getWhoToFollow();

	require_once __DIR__ . '/../models/CommentModel.php';
	$commentModel = new CommentModel();
	$currentUserPk = $_SESSION['user']['user_pk'];
	$comments = $commentModel->getCommentsByPostPk($postPk, $currentUserPk);

	require_once __DIR__ . '/../services/backend-dictionary.php';
	$errorMessage = $backendDictionary[$_SESSION['user']['user_language']]['post_not_found'];
	if (!$post) {
		Header('Location: /404?error=' . urlencode($errorMessage));
		exit;
	}

	require_once __DIR__ . '/../views/post.php';
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Post Controller Error: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/backend-dictionary.php';
	$errorMessage = $backendDictionary[$_SESSION['user']['user_language']]['an_unexpected_error_occurred'];
	Header('Location: /404?error=' . urlencode($errorMessage));
	exit;
}
