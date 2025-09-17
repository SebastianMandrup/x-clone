<?php

// protect against injection
function muoEcho($text)
{
    echo htmlspecialchars($text);
}

// disable caching
function muoNoCache()
{
    header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
    header("Pragma: no-cache");
    header("Expires: Thu, 01 Jan 1970 00:00:00 GMT");
    // header('Clear-Site-Data: "cache", "cookies", "storage", "executionContexts"');
}

define("emailMin", 6);
define("emailMax", 50);
function validateEmail()
{
    $userEmail = trim($_POST["email"] ?? "");


    if (strlen($userEmail) < emailMin) {
        throw new Exception("User email must be greater than " . emailMin . " characters", 400);
    }

    if (strlen($userEmail) > emailMax) {
        throw new Exception("User email must be less than " . emailMax . " characters", 400);
    }
    return $userEmail;
}

define("passwordMin", 6);
define("passwordMax", 50);
function validatePassword()
{
    $userPassword = trim($_POST["password"] ?? "");
    if (strlen($userPassword) < passwordMin) {
        throw new Exception("User password must be greater than " . passwordMin . " characters", 400);
    }
    if (strlen($userPassword) > passwordMax) {
        throw new Exception("" . passwordMax . "", 400);
    }
    return $userPassword;
}

?>