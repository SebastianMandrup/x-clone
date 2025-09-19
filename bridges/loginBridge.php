<?php
try {
    require_once __DIR__ . "/../x.php";
    $userEmailOrPhone = validateEmailOrPhone();
    $userPassword = validatePassword();

    require_once __DIR__ . "/../db.php";
    $sql = "SELECT * FROM users WHERE user_email = :emailOrPhone OR user_phone = :emailOrPhone";
    $stmt = $_db->prepare($sql);

    $stmt->bindValue(":emailOrPhone", $userEmailOrPhone);

    $stmt->execute();

    $user = $stmt->fetch();

    // check if the user is in the db
    if (!$user) {
        header("Location: ../?errorToast=" . urlencode("User not found"));
        exit();
    }

    // verify password hash
    if (!password_verify($userPassword, $user["user_password"])) {
        header("Location: ../?errorToast=" . urlencode("Incorrect password"));
        exit();
    }

    // everything is ok - put data in the session
    session_start();
    unset($user["user_password"]); // remove password from session
    $_SESSION["user"] = $user;

    header("Location: ../home?successToast=" . urlencode("Login successful"));
} catch (Exception $ex) {
    http_response_code($ex->getCode());
    header("Location: ../?errorToast=" . urlencode($ex->getMessage()));
}
