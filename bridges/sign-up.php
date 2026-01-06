<?php
try {

	require_once __DIR__ . "/../x.php";
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
		throw new Exception("Email already registered.", 400);
	}

	$userByPhone = $userModel->getByPhone($phone);

	if ($userByPhone) {
		throw new Exception("Phone number already registered.", 400);
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
} catch (Exception $ex) {
	http_response_code(500);
	header("Location: ../?errorToast=" . rawurlencode('An unexpected error occurred'));
}
