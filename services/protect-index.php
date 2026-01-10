<?php
session_start();
if (isset($_SESSION["user"])) {
	require_once __DIR__ . '/x.php';
	muoNoCache();
	header("Location: /home");
	exit();
}
