<?php

try {

	require_once __DIR__ . "/../services/protect-route.php";

	require_once __DIR__ . "/../services/x.php";
	$userPk = $_SESSION['user']['user_pk'];
	$avatarFileName = validateAndSaveAvatar();
	$bannerFileName = validateAndSaveBanner();
	$newName = validateName();
	$newLanguage = validateLanguage();
	$newBio = validateBio();
	$newLocation = validateLocation();
	$newWebsite = validateWebsite();
	$newBirthdate = validateBirthdate();

	require_once __DIR__ . "/../models/UserModel.php";
	$userModel = new UserModel();
	$userModel->updateUser(
		$userPk,
		$newName,
		$newLanguage,
		$avatarFileName,
		$bannerFileName,
		$newBio,
		$newLocation,
		$newWebsite,
		$newBirthdate
	);

	$newSessionUser = $userModel->getByPk($userPk);
	unset($newSessionUser["user_password"]);
	$_SESSION['user'] = $newSessionUser;

	require_once __DIR__ . "/../services/backend-dictionary.php";
	$message = $backendDictionary[$_SESSION['user']['user_language']]['profile_updated_successfully'];
	header("Location: /user/" . rawurlencode($_SESSION['user']['user_handle']) . "?successToast=" . rawurlencode($message));
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	logError('Edit Profile Bridge: ' . $exception->getMessage());

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
	header("Location: /user/" . rawurlencode($_SESSION['user']['user_handle']) . "?errorToast=" . rawurlencode($errorMessage));
}
