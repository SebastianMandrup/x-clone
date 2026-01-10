<?php

try {
	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . "/../services/x.php";
	$referencePk = validatePk("referencePostPk");
	$postUserFk = $_SESSION["user"]["user_pk"];

	require_once __DIR__ . '/../models/PostModel.php';
	$postModel = new PostModel();
	$postModel->repost($referencePk, $postUserFk);

	require_once __DIR__ . '/../services/backend-dictionary.php';
	echo json_encode([
		"status" => "success",
		"message" => $backendDictionary[$_SESSION['user']['user_language']]['post_reposted_successfully']
	]);
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Repost API: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/handle-exception.php';
	handleException($exception);
}
