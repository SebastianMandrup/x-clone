<?php
try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . "/../x.php";

	$referencePk = validatePk("referencePostPk");
	$postUserFk = $_SESSION["user"]["user_pk"];

	require_once __DIR__ . '/../models/PostModel.php';

	$postModel = new PostModel();
	$postModel->repost($referencePk, $postUserFk);

	echo json_encode([
		"status" => "success",
		"message" => "Post reposted successfully"
	]);
} catch (Exception $ex) {
	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
