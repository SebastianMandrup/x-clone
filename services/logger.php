<?php

function logError(string $message): void {
	$logFile = __DIR__ . '/../.misc/logs/error.log';

	$timestamp = date('Y-m-d H:i:s');
	$entry = "[$timestamp] $message" . PHP_EOL;

	file_put_contents($logFile, $entry, FILE_APPEND);
}
