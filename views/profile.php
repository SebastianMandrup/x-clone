<?php
require_once __DIR__ . "../../x.php";
muoNoCache();
session_start();

if (!isset($_SESSION["user"])) {
	header("Location: /?errorToast=" . urlencode("You must be logged in to access a profile page."));
	exit();
}

require_once __DIR__ . '../../db_connector.php';

$sql = "
	SELECT 
    users.user_pk, 
    users.user_name, 
    users.user_email, 
    users.user_birthday, 
    users.user_handle,
    COUNT(posts.post_pk) AS post_count
	FROM users 
	LEFT JOIN posts ON users.user_pk = posts.post_user_fk
	WHERE users.user_handle = :userHandle
	GROUP BY users.user_pk, users.user_name, users.user_email, users.user_birthday, users.user_handle
	LIMIT 1;
";
$stmt = $_db->prepare($sql);
$stmt->bindValue(':userHandle', $username);
$stmt->execute();
$user = $stmt->fetch();

if (!$user) {
	header("Location: /home?errorToast=" . urlencode("The requested profile does not exist."));
	exit();
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./styling/profile/profile.css">
	<link rel="icon" href="https://abs.twimg.com/responsive-web/client-web/icon-ios.77d25eba.png">
	<script src='./scripts/profile/profile.js' type='module'></script>
	<title> PROFILE / <?php muoEcho($username); ?></title>
</head>

<body>

	<div id='divMainContainer'>

		<?php require __DIR__ . '/../components/nav.php'; ?>

		<main>

			<?php require_once __DIR__ . '/../components/sections/profileHeader.php'; ?>

			<div class="circle-loader"></div>
		</main>

		<?php require __DIR__ . '/../components/aside.php'; ?>

	</div>

	<?php require __DIR__ . '/../components/commentOverlay.php'; ?>

</body>

</html>