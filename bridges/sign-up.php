<?php

try {

	require_once __DIR__ . "/../services/x.php";
	$name = validateName();
	$handle = validateHandle();
	$phone = validatePhone();
	$email = validateEmail();
	$password = validatePassword();
	$day = validateDay();
	$month = validateMonth();
	$year = validateYear();
	$personalizedAds = validatePersonalizedAds();
	$connectWithEmailPhone = validateConnectWithEmailPhone();

	$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

	if (!$email && !$phone) {
		throw new Exception("Either email or phone number must be provided.", 400);
	}

	require_once __DIR__ . "/../models/UserModel.php";
	$userModel = new UserModel();

	$userByEmail = $userModel->getByEmail($email);

	if ($userByEmail) {
		throw new Exception("Email already registered.", 409);
	}

	$userByPhone = $userModel->getByPhone($phone);

	if ($userByPhone) {
		throw new Exception("Phone number already registered.", 409);
	}

	$birthday = sprintf("%04d-%02d-%02d", $year, $month, $day);
	$userModel->createUser(
		$name,
		$handle,
		$phone,
		$email,
		$hashedPassword,
		$birthday,
		$personalizedAds,
		$connectWithEmailPhone
	);

	header("Location: ../?successToast=" . rawurlencode("Sign up successful! Please log in."));
} catch (Exception $exception) {
	require_once __DIR__ . '/../services/logger.php';
	$errorMessage =  $exception->getMessage();
	logError('Sign-up Bridge: ' . $errorMessage);

	if (str_contains($errorMessage, 'muoex_')) {
		$exceptionKey = str_replace('muoex_', '', $errorMessage);

		require_once __DIR__ . "/../services/backend-dictionary.php";
		$errorMessage = $backendDictionary['en'][$exceptionKey];
		http_response_code($exception->getCode() ? (int) $exception->getCode() : 400);
		header("Location: ../?errorToast=" . rawurlencode($errorMessage));
		exit();
	}
	http_response_code($exception->getCode() ? (int) $exception->getCode() : 500);
	header("Location: ../?errorToast=" . rawurlencode('An unexpected error occurred'));
}
