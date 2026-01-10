<?php
session_start();
if (!isset($_SESSION["user"])) {
	throw new Exception("muoex_user_not_authenticated", 401);
}
