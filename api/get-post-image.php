<?php

try {

	if (!isset($_GET['filename']) || empty($_GET['filename'])) {
		throw new Exception("Filename is required", 400);
	}

	$filename = basename($_GET['filename']);
	$filepath = __DIR__ . '/../uploads/posts/' . $filename;

	if (!file_exists($filepath)) {
		throw new Exception("File not found", 404);
	}

	$finfo = finfo_open(FILEINFO_MIME_TYPE);
	$mimeType = finfo_file($finfo, $filepath);

	header('Content-Type: ' . $mimeType);
	readfile($filepath);
} catch (Exception $e) {
	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
