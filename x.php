<?php

// protect against injection
function muoEcho($text) {
    echo htmlspecialchars($text);
}

// disable caching
function muoNoCache() {
    header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
    header("Pragma: no-cache");
    header("Expires: Thu, 01 Jan 1970 00:00:00 GMT");
    // header('Clear-Site-Data: "cache", "cookies", "storage", "executionContexts"');
}

define("emailMax", 50);
function validateEmail() {
    $userEmail = trim($_POST["email"]);

    if ($userEmail == "" || $userEmail == null) {
        return null;
    }

    if (strlen($userEmail) > emailMax) {
        throw new Exception("User email must be less than " . emailMax . " characters", 400);
    }
    return $userEmail;
}

function validateEmailOrPhone() {
    $userEmailOrPhone = trim($_POST["emailOrPhone"] ?? "");
    if (empty($userEmailOrPhone)) {
        throw new Exception("Email or phone is required", 400);
    }
    return $userEmailOrPhone;
}

define("passwordMin", 6);
define("passwordMax", 50);
function validatePassword() {
    $userPassword = trim($_POST["password"] ?? "");
    if (strlen($userPassword) < passwordMin) {
        throw new Exception("User password must be greater than " . passwordMin . " characters", 400);
    }
    if (strlen($userPassword) > passwordMax) {
        throw new Exception("" . passwordMax . "", 400);
    }
    return $userPassword;
}

define("nameMin", 2);
define("nameMax", 50);
function validateName() {
    $name = trim($_POST["name"] ?? "");
    if (strlen($name) < nameMin) {
        throw new Exception("Name must be greater than " . nameMin . " characters", 400);
    }
    if (strlen($name) > nameMax) {
        throw new Exception("Name must be less than " . nameMax . " characters", 400);
    }
    return $name;
}

define("handleMin", 2);
define("handleMax", 30);
function validateHandle() {
    $handle = trim($_POST["handle"] ?? "");
    if (strlen($handle) < handleMin) {
        throw new Exception("Handle must be greater than " . handleMin . " characters", 400);
    }
    if (strlen($handle) > handleMax) {
        throw new Exception("Handle must be less than " . handleMax . " characters", 400);
    }
    return $handle;
}

define("phoneMax", 15);
function validatePhone() {
    $userPhone = trim($_POST["phone"]);
    if ($userPhone == "" || $userPhone == null) {
        return null;
    }
    if (strlen($userPhone) > phoneMax) {
        throw new Exception("Phone number must be less than " . phoneMax . " characters", 400);
    }
    return $userPhone;
}

define("monthMin", 1);
define("monthMax", 12);
function validateMonth() {
    $userMonth = (int) ($_POST["month"] ?? 0);
    if ($userMonth < monthMin || $userMonth > monthMax) {
        throw new Exception("Month must be between " . monthMin . " and " . monthMax . " inclusive", 400);
    }
    return $userMonth;
}

define("dayMin", 1);
define("dayMax", 31);
function validateDay() {
    $userDay = (int) ($_POST["day"] ?? 0);
    if ($userDay < dayMin || $userDay > dayMax) {
        throw new Exception("Day must be between " . dayMin . " and " . dayMax . " inclusive", 400);
    }
    return $userDay;
}

define("yearMin", 1900);
define("yearMax", 2024);
function validateYear() {
    $userYear = (int) ($_POST["year"] ?? 0);
    if ($userYear < yearMin || $userYear > yearMax) {
        throw new Exception("Year must be between " . yearMin . " and " . yearMax . " inclusive", 400);
    }
    return $userYear;
}

define("postContentMin", 1);
define("postContentMax", 200);
function validatePostContent() {
    $postContent = trim($_POST["post_content"] ?? "");
    if (strlen($postContent) < postContentMin) {
        throw new Exception("Post content must be greater than " . postContentMin . " characters", 400);
    }
    if (strlen($postContent) > postContentMax) {
        throw new Exception("Post content must be less than " . postContentMax . " characters", 400);
    }
    return $postContent;
}

function validateConnectWithEmailPhone() {
    return isset($_POST["connectWithEmailPhone"]) ? 1 : 0;
}

function validatePersonalizedAds() {
    return isset($_POST["personalizedAds"]) ? 1 : 0;
}
