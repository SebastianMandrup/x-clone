<?php

require_once __DIR__ . '/../services/protect-route.php';

require_once __DIR__ . '/../controllers/PostController.php';

$postController = new PostController();

try {
	$currentUserPk = $_SESSION['user']['user_pk'];
	// $post = $postController->getByPk($postPk, $currentUserPk);

	// echo (json_encode($post));
	// if (!$post) {
	// 	header("Location: /home?errorToast=" . urlencode("The requested post does not exist."));
	// 	exit();
	// }

	require_once __DIR__ . '/../views/post.php';
} catch (Exception $e) {
	$post = null;
	$error = $e->getMessage();
}
