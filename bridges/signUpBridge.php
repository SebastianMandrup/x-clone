<?php
try {
	require_once __DIR__ . "/../x.php";
	$name = validateName();
	$phone = validatePhone();
	$email = validateEmail();
	$password = validatePassword();
	$day = validateDay();
	$month = validateMonth();
	$year = validateYear();
	$personalizedAds = validatePersonalizedAds();
	$connectWithEmailPhone = validateConnectWithEmailPhone();

	$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

	require_once __DIR__ . "/../db.php";

	if (!$email && !$phone) {
		throw new Exception("Either email or phone number must be provided.", 400);
	}

	// Optional: check if email already exists

	if ($email) {
		$checkSql = "SELECT COUNT(*) FROM users WHERE user_email = :email";
		$checkStmt = $_db->prepare($checkSql);
		$checkStmt->bindValue(":email", $email);
		$checkStmt->execute();
		if ($checkStmt->fetchColumn() > 0) {
			throw new Exception("Email already registered.", 400);
		}
	}


	// Optional: check if phone already exists
	if ($day) {
		$checkSql = "SELECT COUNT(*) FROM users WHERE user_phone = :phone";
		$checkStmt = $_db->prepare($checkSql);
		$checkStmt->bindValue(":phone", $phone);
		$checkStmt->execute();

		if ($checkStmt->fetchColumn() > 0) {
			throw new Exception("Phone number already registered.", 400);
		}
	}

	$sql = "INSERT INTO users (
                user_pk, 
                user_name, 
                user_phone, 
                user_email, 
                user_password, 
                user_birthday, 
                user_personalized_ads, 
                user_connect_with_email_phone
            ) VALUES (
                :pk, :name, :phone, :email, :password, :birthday, :personalizedAds, :connectWithEmailPhone
            )";

	$stmt = $_db->prepare($sql);

	$birthday = sprintf("%04d-%02d-%02d", $year, $month, $day);
	$userPk = uniqid('user_', true);

	$stmt->bindValue(":pk", $userPk);
	$stmt->bindValue(":name", $name);
	$stmt->bindValue(":phone", $phone);
	$stmt->bindValue(":password", $hashedPassword);
	$stmt->bindValue(":birthday", $birthday);
	$stmt->bindValue(":personalizedAds", $personalizedAds);
	$stmt->bindValue(":connectWithEmailPhone", $connectWithEmailPhone);
	$stmt->bindValue(":email", $email);

	$stmt->execute();

	header("Location: ../?successToast=" . urlencode("Sign up successful! Please log in."));
} catch (Exception $ex) {
	http_response_code($ex->getCode() ? (int)$ex->getCode() : 500);
	header("Location: ../?errorToast=" . urlencode($ex->getMessage()));
}
