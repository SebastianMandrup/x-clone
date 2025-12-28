<?php
try {

	require_once __DIR__ . "/../services/protect-route.php";

	require_once __DIR__ . "/../x.php";

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

	header("Location: /user/" . rawurlencode($_SESSION['user']['user_handle']) . "?successToast=" . rawurlencode("Succesfully edited profile"));
} catch (Exception $ex) {
	http_response_code($ex->getCode() ? (int) $ex->getCode() : 500);
	header("Location: /user/" . rawurlencode($_SESSION['user']['user_handle']) . "?errorToast=" . rawurlencode($ex->getMessage()));
}
