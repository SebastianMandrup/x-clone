<?php

try {
	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../services/x.php';
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
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Bookmark Post API: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/handle-exception.php';
	handleException($exception);
}
