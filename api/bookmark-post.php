<?php

try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../x.php';
	$userFk = $_SESSION["user"]["user_pk"];
	$postFk = validatePk('postPk');

	require_once __DIR__ . '/../models/BookmarkModel.php';
	$bookmarkModel = new BookmarkModel();
	$bookmarkModel->addBookmark($userFk, $postFk);

	require_once __DIR__ . '/../services/backend-dictionary.php';
	$message = $backendDictionary[$_SESSION['user']['user_language']]['bookmark_toggled_successfully'];
	echo json_encode([
		'status' => 'success',
		'message' => $message
	]);
} catch (Exception $e) {

	require_once __DIR__ . '/../services/backend-dictionary.php';
	http_response_code(500);
	$errorMessage = $backendDictionary[$_SESSION['user']['user_language']]['an_unexpected_error_occurred'];
	echo json_encode([
		'status' => 'error',
		'message' => $errorMessage
	]);
}
