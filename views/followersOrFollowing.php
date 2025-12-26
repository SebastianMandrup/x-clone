<?php
require_once __DIR__ . "../../x.php";
$translations = initTranslations();
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/styling/profile/followersPage.css">
	<link rel="icon" href="https://abs.twimg.com/responsive-web/client-web/icon-ios.77d25eba.png">
	<script src="/scripts/profile/followers.js" type="module"></script>
	<title><?php muoEcho($translations[$endpoint]) ?> | <?php muoEcho($handle) ?></title>
</head>

<body>

	<div id='divMainContainer'>

		<?php require __DIR__ . '/../components/nav.php'; ?>

		<main>

			<?php require __DIR__ . '/../components/sections/followersHeader.php'; ?>


			<?php

			foreach ($users as $user) {
				require __DIR__ . '/../components/articles/user.php';
			}

			?>

			<div class="circle-loader"></div>

		</main>

		<?php require __DIR__ . '/../components/aside.php'; ?>

	</div>

</body>

</html>