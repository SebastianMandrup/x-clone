<?php

try {
	require_once __DIR__ . '/../services/protect-route.php';

	require_once __DIR__ . '/../models/UserModel.php';
	$userModel = new UserModel();
	$currentUserPk = $_SESSION['user']['user_pk'];
	$focusedUser = $userModel->getByHandle($handle, $currentUserPk);

	if (!$focusedUser) {
		require_once __DIR__ . '/../services/backend-dictionary.php';
		$errorMessage = $backendDictionary[$_SESSION['user']['user_language']]['profile_not_found'];
		Header('Location: /404?error=' . urlencode($errorMessage));
		exit;
	}

	require_once __DIR__ . '/../models/PostModel.php';
	$postModel = new PostModel();
	$posts = $postModel->getAllFromUserWithCounts($currentUserPk, $focusedUser['user_handle']);

	require_once __DIR__ . '/../models/TopicModel.php';
	$topicModel = new TopicModel();
	$firstThreeTopics = $topicModel->getPage();

	require_once __DIR__ . '/../models/FollowModel.php';
	$followModel = new FollowModel();
	$usersToFollow = $followModel->getWhoToFollow();

	require_once __DIR__ . '/../views/profile.php';
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Profile Controller Error: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/backend-dictionary.php';
	$errorMessage = $backendDictionary[$_SESSION['user']['user_language']]['an_unexpected_error_occurred'];
	Header('Location: /404?error=' . urlencode($errorMessage));
	exit;
}
