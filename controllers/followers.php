<?php

require_once __DIR__ . '/../services/protect-route.php';

require_once __DIR__ . '/../models/UserModel.php';

$userModel = new UserModel();

try {

	$user = $userModel->getByHandle($handle, $_SESSION['user']['user_pk']);

	require __DIR__ . '/../views/followers.php';
} catch (Exception $e) {
	echo "Error: " . $e->getMessage();
}
