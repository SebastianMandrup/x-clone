<?php
try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . "/../x.php";
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
} catch (Exception $ex) {
	require_once __DIR__ . '/../services/backend-dictionary.php';
	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $backendDictionary[$_SESSION['user']['user_language']]['an_unexpected_error_occurred']
	]);
}
