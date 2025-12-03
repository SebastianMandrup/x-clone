<?php

try {

	require_once __DIR__ . '/../services/protect-endpoint.php';

	require_once __DIR__ . '/../x.php';

	$userFk = $_SESSION["user"]["user_pk"];
	$postFk = validatePk('postPk');

	require_once __DIR__ . '/../models/BookmarkModel.php';
	$bookmarkModel = new BookmarkModel();
	$bookmarkModel->addBookmark($userFk, $postFk);

	echo json_encode([
		'status' => 'success',
		'message' => 'bookmark toggled successfully'
	]);
} catch (Exception $e) {
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
