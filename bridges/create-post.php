<?php

try {
    require_once __DIR__ . "/../services/protect-endpoint.php";

    require_once __DIR__ . "/../services/x.php";
    $postContent = validatePostContent();
    $postImage = validateAndSavePostImage();
    $postUserFk = $_SESSION["user"]["user_pk"];

    require_once __DIR__ . "/../models/PostModel.php";
    $postModel = new PostModel();
    $postModel->createPost($postContent, $postUserFk, $postImage);

    require_once __DIR__ . "/../services/backend-dictionary.php";
    $message = $backendDictionary[$_SESSION['user']['user_language']]['post_added_successfully'];
    header("Location: ../?successToast=" . rawurlencode($message));
} catch (Exception $exception) {
    require_once __DIR__ . '/../services/logger.php';
    logError('Create Post Bridge: ' . $exception->getMessage());


    $exceptionMessage = $exception->getMessage();
    if (str_contains($exceptionMessage, "muoex_")) {
        $exceptionKey = explode("muoex_", $exceptionMessage)[1];
    } else {
        $exceptionKey = "an_unexpected_error_occurred";
    }

    require_once __DIR__ . "/../services/backend-dictionary.php";
    $userLanguage = $_SESSION['user']['user_language'] ?? 'en';
    $errorMessage = $backendDictionary[$userLanguage][$exceptionKey];
    http_response_code($exception->getCode() ? (int) $exception->getCode() : 500);
    header("Location: ../?errorToast=" . rawurlencode($errorMessage));
}
