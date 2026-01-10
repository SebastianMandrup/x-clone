<?php

function handleException(Exception $exception) {
	http_response_code($exception->getCode() ?: 500);

	$exceptionMessage = $exception->getMessage();

	if (!str_contains($exceptionMessage, 'muoex_')) {
		$exceptionMessage = 'an_unexpected_error_occurred';
	} else {
		$exceptionMessage = str_replace('muoex_', '', $exceptionMessage);
	}

	require_once __DIR__ . '/../services/backend-dictionary.php';
	$language = $_SESSION['user']['user_language'] ?? 'en';
	$errorMessage = $backendDictionary[$language][$exceptionMessage];
	echo json_encode([
		'status' => 'error',
		'message' => $errorMessage
	]);
}
