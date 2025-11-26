<?php
try {

    require_once __DIR__ . "/../services/protect-endpoint.php";

    require_once __DIR__ . "/../x.php";

    $postContent = validatePostContent();
    $postUserFk = $_SESSION["user"]["user_pk"];

    require_once __DIR__ . "/../models/PostModel.php";
    $postModel = new PostModel();
    $postModel->createPost($postContent, $postUserFk);

    header("Location: ../?successToast=" . rawurlencode("Succesfully added post."));
} catch (Exception $ex) {
    http_response_code($ex->getCode() ? (int) $ex->getCode() : 500);
    header("Location: ../?errorToast=" . rawurlencode($ex->getMessage()));
}
