<?php
session_start();
if (!isset($_SESSION["user"])) {
	throw new Exception("User not authenticated", 401);
}
