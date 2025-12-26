<?php

function initTranslations() {
    $dictionary = require_once __DIR__ . '/services/dictionary.php';
    return $dictionary[$_SESSION['user']['user_language']];
}

// XSS safe echo
function muoEcho($text) {
    if ($text === null) {
        return;
    }
    echo htmlspecialchars($text);
}

// disable caching
function muoNoCache() {
    header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
    header("Pragma: no-cache");
    header("Expires: Thu, 01 Jan 1970 00:00:00 GMT");
    // header('Clear-Site-Data: "cache", "cookies", "storage", "executionContexts"');
}



function validateAndSaveAvatar() {
    // Check if file was uploaded
    if (!isset($_FILES["profile_avatar"]) || $_FILES["profile_avatar"]["error"] === UPLOAD_ERR_NO_FILE) {
        return null;
    }

    $file = $_FILES["profile_avatar"];

    // Basic upload error check
    if ($file["error"] !== UPLOAD_ERR_OK) {
        throw new Exception("File upload failed", 400);
    }

    // Check file size (max 5MB)
    if ($file["size"] > 5 * 1024 * 1024) {
        throw new Exception("File too large (max 5MB)", 400);
    }

    // Get MIME type using mime_content_type (simpler)
    $mimeType = mime_content_type($file["tmp_name"]);

    // Allowed MIME types
    $allowedTypes = [
        'image/jpeg' => 'jpg',
        'image/png' => 'png',
        'image/gif' => 'gif',
        'image/webp' => 'webp'
    ];

    if (!isset($allowedTypes[$mimeType])) {
        throw new Exception("Invalid file type. Only JPEG, PNG, GIF, and WebP allowed", 400);
    }

    // Verify it's actually an image
    $imageInfo = @getimagesize($file["tmp_name"]);
    if (!$imageInfo) {
        throw new Exception("Uploaded file is not a valid image", 400);
    }

    // Check for malicious content
    $fileContent = file_get_contents($file["tmp_name"]);
    if (preg_match('/<\?php|<script|javascript:/i', $fileContent)) {
        throw new Exception("File contains potentially malicious content", 400);
    }

    // Generate UUID filename
    $uuid = bin2hex(random_bytes(16));
    $extension = $allowedTypes[$mimeType];
    $filename = $uuid . '.' . $extension;

    // Ensure uploads directory exists
    $uploadDir = __DIR__ . '/uploads/avatars/';
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0755, true);
    }

    $destination = $uploadDir . $filename;

    // Move uploaded file
    if (!move_uploaded_file($file["tmp_name"], $destination)) {
        throw new Exception("Failed to save file", 500);
    }

    return $filename;
}

function validateAndSaveBanner() {
    if (!isset($_FILES["profile_banner"]) || $_FILES["profile_banner"]["error"] === UPLOAD_ERR_NO_FILE) {
        return null;
    }

    $file = $_FILES["profile_banner"];

    if ($file["error"] !== UPLOAD_ERR_OK) {
        throw new Exception("Banner upload failed", 400);
    }

    // Banner can be larger - 10MB
    if ($file["size"] > 10 * 1024 * 1024) {
        throw new Exception("Banner too large (max 10MB)", 400);
    }

    $mimeType = mime_content_type($file["tmp_name"]);

    $allowedTypes = [
        'image/jpeg' => 'jpg',
        'image/png' => 'png',
        'image/gif' => 'gif',
        'image/webp' => 'webp'
    ];

    if (!isset($allowedTypes[$mimeType])) {
        throw new Exception("Invalid banner file type", 400);
    }

    // Verify it's actually an image
    $imageInfo = @getimagesize($file["tmp_name"]);
    if (!$imageInfo) {
        throw new Exception("Uploaded banner is not a valid image", 400);
    }

    // Check dimensions for banner
    list($width, $height) = $imageInfo;
    if ($width < 800 || $height < 200) {
        throw new Exception("Banner should be at least 800x200 pixels", 400);
    }

    // Check for malicious content
    $fileContent = file_get_contents($file["tmp_name"]);
    if (preg_match('/<\?php|<script|javascript:/i', $fileContent)) {
        throw new Exception("Banner contains potentially malicious content", 400);
    }

    $uuid = bin2hex(random_bytes(16));
    $extension = $allowedTypes[$mimeType];
    $filename = 'banner_' . $uuid . '.' . $extension;

    $uploadDir = __DIR__ . '/uploads/banners/';
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0755, true);
    }

    $destination = $uploadDir . $filename;

    if (!move_uploaded_file($file["tmp_name"], $destination)) {
        throw new Exception("Failed to save banner", 500);
    }

    return $filename;
}

function validateBirthdate() {
    $birthdate = trim($_POST["birthdate"] ?? "");
    return $birthdate;
}

define("searchTermMax", 20);
function validateSearchTerm() {
    $searchTerm = trim($_GET["term"] ?? "");
    if (strlen($searchTerm) > searchTermMax) {
        throw new Exception("Search term must be less than " . searchTermMax . " characters", 400);
    }
    return $searchTerm;
}

define("websiteMax", 50);
function validateWebsite() {
    $website = trim($_POST["website"] ?? "");
    if (strlen($website) > websiteMax) {
        throw new Exception("Website must be less than " . websiteMax . " characters", 400);
    }
    return $website;
}

define("locationMax", 50);
function validateLocation() {
    $location = trim($_POST["location"] ?? "");
    if (strlen($location) > locationMax) {
        throw new Exception("Location must be less than " . locationMax . " characters", 400);
    }
    return $location;
}

define("bioMax", 255);
function validateBio() {
    $bio = trim($_POST["bio"] ?? "");
    if (strlen($bio) > bioMax) {
        throw new Exception("Bio must be less than " . bioMax . " characters", 400);
    }
    return $bio;
}

define("pageMax", 100);
function validatePage() {
    $page = (int) ($_GET["page"] ?? 1);
    if ($page < 1) {
        $page = 1;
    }
    if ($page > pageMax) {
        throw new Exception("Page must be less than " . pageMax, 400);
    }
    return $page;
}

define("pkMax", 50);
function validatePk($pkName) {
    $pk = trim($_POST[$pkName] ?? "");
    if (strlen($pk) > pkMax) {
        throw new Exception("PK must be less than " . pkMax . " characters", 400);
    }
    return $pk;
}

define("commentReplyContentMax", 255);
function validateCommentReplyContent() {
    $commentReplyContent = trim($_POST["comment_reply_content"] ?? "");
    if (strlen($commentReplyContent) == 0) {
        throw new Exception("Comment reply content cannot be empty", 400);
    }
    if (strlen($commentReplyContent) > commentReplyContentMax) {
        throw new Exception("Comment reply content must be less than " . commentReplyContentMax . " characters", 400);
    }
    return $commentReplyContent;
}

define("commentContentMax", 255);
function validateCommentContent() {
    $commentContent = trim($_POST["comment_content"] ?? "");
    if (strlen($commentContent) == 0) {
        throw new Exception("Comment content cannot be empty", 400);
    }
    if (strlen($commentContent) > commentContentMax) {
        throw new Exception("Comment content must be less than " . commentContentMax . " characters", 400);
    }
    return $commentContent;
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
