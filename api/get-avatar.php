<?php

try {
	if (!isset($_GET['filename']) || empty($_GET['filename'])) {
		throw new Exception("muoex_filename_required", 400);
	}

	$filename = basename($_GET['filename']);
	$filepath = __DIR__ . '/../views/uploads/avatars/' . $filename;

	if (!file_exists($filepath)) {
		throw new Exception("muoex_file_not_found", 404);
	}

	$finfo = finfo_open(FILEINFO_MIME_TYPE);
	$mimeType = finfo_file($finfo, $filepath);

	header('Content-Type: ' . $mimeType);
	readfile($filepath);
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Get Avatar API: ' . $exception->getMessage());

	require_once __DIR__ . '/../services/handle-exception.php';
	handleException($exception);
}
