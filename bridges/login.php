<?php
try {
    require_once __DIR__ . "/../x.php";
    $userEmailOrPhone = validateEmailOrPhone();
    $userPassword = validatePassword();

    require_once __DIR__ . "/../models/UserModel.php";
    $userModel = new UserModel();
    $user = $userModel->getByEmailOrPhone($userEmailOrPhone);

    if (!$user) {
        header("Location: ../?errorToast=" . rawurlencode("User not found"));
        exit();
    }

    if (!password_verify($userPassword, $user["user_password"])) {
        header("Location: ../?errorToast=" . rawurlencode("Incorrect password"));
        exit();
    }

    session_start();
    unset($user["user_password"]);
    $_SESSION["user"] = $user;

    header("Location: /home?successToast=" . rawurlencode("Login successful"));
} catch (Exception $ex) {
    http_response_code($ex->getCode());
    header("Location: /login?errorToast=" . rawurlencode($ex->getMessage()));
}
