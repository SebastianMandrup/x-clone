<?php
session_start();
try {
	if (!$_SESSION["user"]) {
		throw new Exception("Unauthorized", 401);
	}

	require_once __DIR__ . "/../x.php";

	$repostPk = bin2hex(random_bytes(25));
	$referencePk = validatePk("referencePostPk");
	$postUserFk = $_SESSION["user"]["user_pk"];

	require_once __DIR__ . "/../services/db_connector.php";

	$sql = "
        INSERT INTO posts (post_pk, post_reference, post_user_fk, post_created_at) 
        VALUES (:postPk, :postReference, :postUserFk, UNIX_TIMESTAMP())
    ";
	$stmt = $_db->prepare($sql);
	$stmt->bindValue(":postPk", $repostPk);
	$stmt->bindValue(":postReference", $referencePk);
	$stmt->bindValue(":postUserFk", $postUserFk);
	$stmt->execute();

	echo json_encode([
		"status" => "success",
		"message" => "Post reposted successfully"
	]);
} catch (Exception $ex) {
	http_response_code($e->getCode() ?: 500);
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
