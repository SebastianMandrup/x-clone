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
        throw new Exception("muoex_image_upload_failed", 400);
    }

    // Check file size (max 5MB)
    if ($file["size"] > 5 * 1024 * 1024) {
        throw new Exception("muoex_image_too_large", 400);
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
        throw new Exception("muoex_image_invalid_file_type", 400);
    }

    // Verify it's actually an image
    $imageInfo = @getimagesize($file["tmp_name"]);
    if (!$imageInfo) {
        throw new Exception("muoex_image_not_a_valid_image", 400);
    }

    // Check for malicious content
    $fileContent = file_get_contents($file["tmp_name"]);
    if (preg_match('/<\?php|<script|javascript:/i', $fileContent)) {
        throw new Exception("muoex_image_contains_potentially_malicious_content", 400);
    }

    // Generate UUID filename
    $uuid = bin2hex(random_bytes(16));
    $extension = $allowedTypes[$mimeType];
    $filename = $uuid . '.' . $extension;

    // Ensure uploads directory exists
    $uploadDir = __DIR__ . '/../views/uploads/avatars/';
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0755, true);
    }

    $destination = $uploadDir . $filename;

    // Move uploaded file
    if (!move_uploaded_file($file["tmp_name"], $destination)) {
        throw new Exception("muoex_image_save_failed", 500);
    }

    return $filename;
}

function validateAndSaveBanner() {
    if (!isset($_FILES["profile_banner"]) || $_FILES["profile_banner"]["error"] === UPLOAD_ERR_NO_FILE) {
        return null;
    }

    $file = $_FILES["profile_banner"];

    if ($file["error"] !== UPLOAD_ERR_OK) {
        throw new Exception("muoex_image_upload_failed", 400);
    }

    // Banner can be larger - 10MB
    if ($file["size"] > 10 * 1024 * 1024) {
        throw new Exception("muoex_image_too_large", 400);
    }

    $mimeType = mime_content_type($file["tmp_name"]);

    $allowedTypes = [
        'image/jpeg' => 'jpg',
        'image/png' => 'png',
        'image/gif' => 'gif',
        'image/webp' => 'webp'
    ];

    if (!isset($allowedTypes[$mimeType])) {
        throw new Exception("muoex_image_invalid_file_type", 400);
    }

    // Verify it's actually an image
    $imageInfo = @getimagesize($file["tmp_name"]);
    if (!$imageInfo) {
        throw new Exception("muoex_image_not_a_valid_image", 400);
    }

    // Check dimensions for banner
    list($width, $height) = $imageInfo;
    if ($width < 800 || $height < 200) {
        throw new Exception("muoex_banner_too_small", 400);
    }

    // Check for malicious content
    $fileContent = file_get_contents($file["tmp_name"]);
    if (preg_match('/<\?php|<script|javascript:/i', $fileContent)) {
        throw new Exception("muoex_image_contains_potentially_malicious_content", 400);
    }

    $uuid = bin2hex(random_bytes(16));
    $extension = $allowedTypes[$mimeType];
    $filename = $uuid . '.' . $extension;

    $uploadDir = __DIR__ . '/../views/uploads/banners/';
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0755, true);
    }

    $destination = $uploadDir . $filename;

    if (!move_uploaded_file($file["tmp_name"], $destination)) {
        throw new Exception("muoex_image_save_failed", 500);
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
        throw new Exception("muoex_invalid_language", 400);
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
        throw new Exception("muoex_website_must_be_less_than_website_max", 400);
    }
    return $website;
}

define("LOCATION_MAX", 50);
function validateLocation() {
    $location = trim($_POST["location"] ?? "");
    if (strlen($location) > LOCATION_MAX) {
        throw new Exception("muoex_location_must_be_less_than_location_max", 400);
    }
    return $location;
}

define("BIO_MAX", 255);
function validateBio() {
    $bio = trim($_POST["bio"] ?? "");
    if (strlen($bio) > BIO_MAX) {
        throw new Exception("muoex_bio_must_be_less_than_bio_max", 400);
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
        throw new Exception("muoex_page_must_be_less_than_page_max", 400);
    }
    return $page;
}

define("PK_MAX", 50);
function  validatePk($pkName) {
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
        throw new Exception("muoex_comment_reply_content_cannot_be_empty", 400);
    }
    if (strlen($commentReplyContent) > COMMENT_REPLY_CONTENT_MAX) {
        throw new Exception("muoex_comment_reply_content_must_be_less_than_comment_reply_content_max", 400);
    }
    return $commentReplyContent;
}

define("COMMENT_CONTENT_MAX", 255);
function validateCommentContent() {
    $commentContent = trim($_POST["comment_content"] ?? "");
    if (strlen($commentContent) == 0) {
        throw new Exception("muoex_comment_content_cannot_be_empty", 400);
    }
    if (strlen($commentContent) > COMMENT_CONTENT_MAX) {
        throw new Exception("muoex_comment_content_must_be_less_than_comment_content_max", 400);
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
        throw new Exception("muoex_email_must_be_less_than_email_max", 400);
    }
    return $userEmail;
}

function validateEmailOrPhone() {
    $userEmailOrPhone = trim($_POST["emailOrPhone"] ?? "");
    if (empty($userEmailOrPhone)) {
        throw new Exception("muoex_email_or_phone_required", 400);
    }
    return $userEmailOrPhone;
}

define("PASSWORD_MIN", 6);
define("PASSWORD_MAX", 50);
function validatePassword() {
    $userPassword = trim($_POST["password"] ?? "");
    if (strlen($userPassword) < PASSWORD_MIN) {
        throw new Exception("muoex_password_must_be_greater_than_password_min", 400);
    }
    if (strlen($userPassword) > PASSWORD_MAX) {
        throw new Exception("muoex_password_must_be_less_than_password_max", 400);
    }
    return $userPassword;
}

define("NAME_MIN", 2);
define("NAME_MAX", 50);
function validateName() {
    $name = trim($_POST["name"] ?? "");
    if (strlen($name) < NAME_MIN) {
        throw new Exception("muoex_name_must_be_greater_than_name_min", 400);
    }
    if (strlen($name) > NAME_MAX) {
        throw new Exception("muoex_name_must_be_less_than_name_max", 400);
    }
    return $name;
}

define("HANDLE_MIN", 2);
define("HANDLE_MAX", 30);
function validateHandle() {
    $handle = trim($_POST["handle"] ?? "");
    if (strlen($handle) < HANDLE_MIN) {
        throw new Exception("muoex_handle_must_be_greater_than_handle_min", 400);
    }
    if (strlen($handle) > HANDLE_MAX) {
        throw new Exception("muoex_handle_must_be_less_than_handle_max", 400);
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
        throw new Exception("muoex_phone_must_be_less_than_phone_max", 400);
    }
    return $userPhone;
}

define("MONTH_MIN", 1);
define("MONTH_MAX", 12);
function validateMonth() {
    $userMonth = (int) ($_POST["month"] ?? 0);
    if ($userMonth < MONTH_MIN || $userMonth > MONTH_MAX) {
        throw new Exception("muoex_month_must_be_between_month_min_and_month_max", 400);
    }
    return $userMonth;
}

define("DAY_MIN", 1);
define("DAY_MAX", 31);
function validateDay() {
    $userDay = (int) ($_POST["day"] ?? 0);
    if ($userDay < DAY_MIN || $userDay > DAY_MAX) {
        throw new Exception("muoex_day_must_be_between_day_min_and_day_max", 400);
    }
    return $userDay;
}

define("YEAR_MIN", 1900);
define("YEAR_MAX", 2024);
function validateYear() {
    $userYear = (int) ($_POST["year"] ?? 0);
    if ($userYear < YEAR_MIN || $userYear > YEAR_MAX) {
        throw new Exception("muoex_year_must_be_between_year_min_and_year_max", 400);
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
        throw new Exception("muoex_image_upload_failed", 400);
    }

    // Check file size (max 10MB)
    if ($file["size"] > 10 * 1024 * 1024) {
        throw new Exception("muoex_image_too_large", 400);
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
        throw new Exception("muoex_image_invalid_file_type", 400);
    }

    // Verify it's actually an image
    $imageInfo = @getimagesize($file["tmp_name"]);
    if (!$imageInfo) {
        throw new Exception("muoex_image_not_a_valid_image", 400);
    }

    // Check for malicious content
    $fileContent = file_get_contents($file["tmp_name"]);
    if (preg_match('/<\?php|<script|javascript:/i', $fileContent)) {
        throw new Exception("muoex_image_contains_potentially_malicious_content", 400);
    }

    // Generate UUID filename
    $uuid = bin2hex(random_bytes(16));
    $extension = $allowedTypes[$mimeType];
    $filename = $uuid . '.' . $extension;
    // Ensure uploads directory exists
    $uploadDir = __DIR__ . '/../views/uploads/posts/';

    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0755, true);
    }
    $destination = $uploadDir . $filename;
    // Move uploaded file
    if (!move_uploaded_file($file["tmp_name"], $destination)) {
        throw new Exception("muoex_image_save_failed", 500);
    }
    return $filename;
}

define("POST_CONTENT_MIN", 1);
define("POST_CONTENT_MAX", 255);
function validatePostContent() {
    $postContent = trim($_POST["post_content"] ?? "");
    if (strlen($postContent) < POST_CONTENT_MIN) {
        throw new Exception("muoex_post_content_cannot_be_empty", 400);
    }
    if (strlen($postContent) > POST_CONTENT_MAX) {
        throw new Exception("muoex_post_content_must_be_less_than_post_content_max", 400);
    }
    return $postContent;
}

function validateConnectWithEmailPhone() {
    return isset($_POST["connectWithEmailPhone"]) ? 1 : 0;
}

function validatePersonalizedAds() {
    return isset($_POST["personalizedAds"]) ? 1 : 0;
}
