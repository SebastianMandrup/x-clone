<?php

function initTranslations() {
    $dictionary = require_once __DIR__ . '/dictionary.php';
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
    $uploadDir = __DIR__ . '/views/uploads/avatars/';
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
    $filename = $uuid . '.' . $extension;

    $uploadDir = __DIR__ . '/views/uploads/banners/';
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

function validateLanguage() {
    $language = trim($_POST["language"] ?? "en");
    $allowedLanguages = ['en', 'da'];
    if (!in_array($language, $allowedLanguages)) {
        throw new Exception("Invalid language selected", 400);
    }
    return $language;
}

define("SEARCH_TERM_MAX", 50);
function validateSearchTerm() {
    $searchTerm = trim($_GET["term"] ?? "");
    if (strlen($searchTerm) > SEARCH_TERM_MAX) {
        throw new Exception("Search term must be less than " . SEARCH_TERM_MAX . " characters", 400);
    }
    return $searchTerm;
}

define("WEBSITE_MAX", 50);
function validateWebsite() {
    $website = trim($_POST["website"] ?? "");
    if (strlen($website) > WEBSITE_MAX) {
        throw new Exception("Website must be less than " . WEBSITE_MAX . " characters", 400);
    }
    return $website;
}

define("LOCATION_MAX", 50);
function validateLocation() {
    $location = trim($_POST["location"] ?? "");
    if (strlen($location) > LOCATION_MAX) {
        throw new Exception("Location must be less than " . LOCATION_MAX . " characters", 400);
    }
    return $location;
}

define("BIO_MAX", 255);
function validateBio() {
    $bio = trim($_POST["bio"] ?? "");
    if (strlen($bio) > BIO_MAX) {
        throw new Exception("Bio must be less than " . BIO_MAX . " characters", 400);
    }
    return $bio;
}

define("PAGE_MAX", 100);
function validatePage() {
    $page = (int) ($_GET["page"] ?? 1);
    if ($page < 1) {
        $page = 1;
    }
    if ($page > PAGE_MAX) {
        throw new Exception("Page must be less than " . PAGE_MAX, 400);
    }
    return $page;
}

define("PK_MAX", 50);
function validatePk($pkName) {
    $pk = trim($_POST[$pkName] ?? "");
    if (strlen($pk) > PK_MAX) {
        throw new Exception("muoex_pk_must_be_less_than_pk_max", 400);
    }
    return $pk;
}

define("COMMENT_REPLY_CONTENT_MAX", 255);
function validateCommentReplyContent() {
    $commentReplyContent = trim($_POST["comment_reply_content"] ?? "");
    if (strlen($commentReplyContent) == 0) {
        throw new Exception("Comment reply content cannot be empty", 400);
    }
    if (strlen($commentReplyContent) > COMMENT_REPLY_CONTENT_MAX) {
        throw new Exception("Comment reply content must be less than " . COMMENT_REPLY_CONTENT_MAX . " characters", 400);
    }
    return $commentReplyContent;
}

define("COMMENT_CONTENT_MAX", 255);
function validateCommentContent() {
    $commentContent = trim($_POST["comment_content"] ?? "");
    if (strlen($commentContent) == 0) {
        throw new Exception("Comment content cannot be empty", 400);
    }
    if (strlen($commentContent) > COMMENT_CONTENT_MAX) {
        throw new Exception("Comment content must be less than " . COMMENT_CONTENT_MAX . " characters", 400);
    }
    return $commentContent;
}

define("EMAIL_MAX", 50);
function validateEmail() {
    $userEmail = trim($_POST["email"]);

    if ($userEmail == "" || $userEmail == null) {
        return null;
    }

    if (strlen($userEmail) > EMAIL_MAX) {
        throw new Exception("User email must be less than " . EMAIL_MAX . " characters", 400);
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

define("PASSWORD_MIN", 6);
define("PASSWORD_MAX", 50);
function validatePassword() {
    $userPassword = trim($_POST["password"] ?? "");
    if (strlen($userPassword) < PASSWORD_MIN) {
        throw new Exception("User password must be greater than " . PASSWORD_MIN . " characters", 400);
    }
    if (strlen($userPassword) > PASSWORD_MAX) {
        throw new Exception("User password must be less than " . PASSWORD_MAX . " characters", 400);
    }
    return $userPassword;
}

define("NAME_MIN", 2);
define("NAME_MAX", 50);
function validateName() {
    $name = trim($_POST["name"] ?? "");
    if (strlen($name) < NAME_MIN) {
        throw new Exception("Name must be greater than " . NAME_MIN . " characters", 400);
    }
    if (strlen($name) > NAME_MAX) {
        throw new Exception("Name must be less than " . NAME_MAX . " characters", 400);
    }
    return $name;
}

define("HANDLE_MIN", 2);
define("HANDLE_MAX", 30);
function validateHandle() {
    $handle = trim($_POST["handle"] ?? "");
    if (strlen($handle) < HANDLE_MIN) {
        throw new Exception("Handle must be greater than " . HANDLE_MIN . " characters", 400);
    }
    if (strlen($handle) > HANDLE_MAX) {
        throw new Exception("Handle must be less than " . HANDLE_MAX . " characters", 400);
    }
    return $handle;
}

define("PHONE_MAX", 15);
function validatePhone() {
    $userPhone = trim($_POST["phone"]);
    if ($userPhone == "" || $userPhone == null) {
        return null;
    }
    if (strlen($userPhone) > PHONE_MAX) {
        throw new Exception("Phone number must be less than " . PHONE_MAX . " characters", 400);
    }
    return $userPhone;
}

define("MONTH_MIN", 1);
define("MONTH_MAX", 12);
function validateMonth() {
    $userMonth = (int) ($_POST["month"] ?? 0);
    if ($userMonth < MONTH_MIN || $userMonth > MONTH_MAX) {
        throw new Exception("Month must be between " . MONTH_MIN . " and " . MONTH_MAX . " inclusive", 400);
    }
    return $userMonth;
}

define("DAY_MIN", 1);
define("DAY_MAX", 31);
function validateDay() {
    $userDay = (int) ($_POST["day"] ?? 0);
    if ($userDay < DAY_MIN || $userDay > DAY_MAX) {
        throw new Exception("Day must be between " . DAY_MIN . " and " . DAY_MAX . " inclusive", 400);
    }
    return $userDay;
}

define("YEAR_MIN", 1900);
define("YEAR_MAX", 2024);
function validateYear() {
    $userYear = (int) ($_POST["year"] ?? 0);
    if ($userYear < YEAR_MIN || $userYear > YEAR_MAX) {
        throw new Exception("Year must be between " . YEAR_MIN . " and " . YEAR_MAX . " inclusive", 400);
    }
    return $userYear;
}

function validateAndSavePostImage() {
    // Check if file was uploaded
    if (!isset($_FILES["post_image"]) || $_FILES["post_image"]["error"] === UPLOAD_ERR_NO_FILE) {
        return null;
    }

    $file = $_FILES["post_image"];

    // Basic upload error check
    if ($file["error"] !== UPLOAD_ERR_OK) {
        throw new Exception("Post image upload failed", 400);
    }

    // Check file size (max 10MB)
    if ($file["size"] > 10 * 1024 * 1024) {
        throw new Exception("Post image too large (max 10MB)", 400);
    }

    // Get MIME type using mime_content_type
    $mimeType = mime_content_type($file["tmp_name"]);

    // Allowed MIME types
    $allowedTypes = [
        'image/jpeg' => 'jpg',
        'image/png' => 'png',
        'image/gif' => 'gif',
        'image/webp' => 'webp'
    ];

    if (!isset($allowedTypes[$mimeType])) {
        throw new Exception("Invalid post image file type. Only JPEG, PNG, GIF, and WebP allowed", 400);
    }

    // Verify it's actually an image
    $imageInfo = @getimagesize($file["tmp_name"]);
    if (!$imageInfo) {
        throw new Exception("Uploaded post image is not a valid image", 400);
    }

    // Check for malicious content
    $fileContent = file_get_contents($file["tmp_name"]);
    if (preg_match('/<\?php|<script|javascript:/i', $fileContent)) {
        throw new Exception("Post image contains potentially malicious content", 400);
    }

    // Generate UUID filename
    $uuid = bin2hex(random_bytes(16));
    $extension = $allowedTypes[$mimeType];
    $filename = $uuid . '.' . $extension;
    // Ensure uploads directory exists
    $uploadDir = __DIR__ . '/views/uploads/posts/';

    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0755, true);
    }
    $destination = $uploadDir . $filename;
    // Move uploaded file
    if (!move_uploaded_file($file["tmp_name"], $destination)) {
        throw new Exception("Failed to save post image", 500);
    }
    return $filename;
}

define("POST_CONTENT_MIN", 1);
define("POST_CONTENT_MAX", 200);
function validatePostContent() {
    $postContent = trim($_POST["post_content"] ?? "");
    if (strlen($postContent) < POST_CONTENT_MIN) {
        throw new Exception("Post content must be greater than " . POST_CONTENT_MIN . " characters", 400);
    }
    if (strlen($postContent) > POST_CONTENT_MAX) {
        throw new Exception("Post content must be less than " . POST_CONTENT_MAX . " characters", 400);
    }
    return $postContent;
}

function validateConnectWithEmailPhone() {
    return isset($_POST["connectWithEmailPhone"]) ? 1 : 0;
}

function validatePersonalizedAds() {
    return isset($_POST["personalizedAds"]) ? 1 : 0;
}
