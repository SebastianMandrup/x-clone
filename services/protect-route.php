<?php

session_start();
if (!isset($_SESSION["user"])) {
	header("Location: /?errorToast=" . urlencode("You must be logged in to access this page."));
	exit();
}
