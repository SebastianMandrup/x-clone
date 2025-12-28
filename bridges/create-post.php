<?php

require_once __DIR__ . "/../services/protect-endpoint.php";
require_once __DIR__ . "/../x.php";
require_once __DIR__ . "/../services/backend-dictionary.php";

try {

    $postContent = validatePostContent();
    $postImage = validateAndSavePostImage();
    $postUserFk = $_SESSION["user"]["user_pk"];

    require_once __DIR__ . "/../models/PostModel.php";
    $postModel = new PostModel();
    $postModel->createPost($postContent, $postUserFk, $postImage);

    $message = $backendDictionary[$_SESSION['user']['user_language']]['post_added_successfully'];
    header("Location: ../?successToast=" . rawurlencode($message));
} catch (Exception $ex) {
    http_response_code($ex->getCode() ? (int) $ex->getCode() : 500);

    switch ($ex->getMessage()) {
        case 'Post content cannot be empty':
            $exceptionKey = 'post_content_cannot_be_empty';
            break;
        default:
            $exceptionKey = 'an_unexpected_error_occurred';
            break;
    }

    $errorMessage = $backendDictionary[$_SESSION['user']['user_language']][$exceptionKey];
    header("Location: ../?errorToast=" . rawurlencode($exceptionKey));
}
