<?php
require_once __DIR__ . "/../x.php";
$translations = initTranslations();
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../../../styling/bookmarks/bookmarks.css">
	<link rel="icon" href="https://abs.twimg.com/responsive-web/client-web/icon-ios.77d25eba.png">
	<script src='../../../scripts/home/home.js' type='module'></script>
	<title> <?php muoEcho($translations['bookmarks']) ?> | <?php muoEcho($_SESSION['user']['user_handle']); ?></title>
</head>

<body>

	<div id='divMainContainer'>

		<?php require __DIR__ . '/../components/nav.php'; ?>

		<main>

			<?php

			require_once __DIR__ . '/../components/sections/bookmarksHeader.php';

			foreach ($posts as $post) {
				require __DIR__ . '/../components/articles/post.php';
			}

			if (count($posts) === 0) {
				require_once __DIR__ . '/../components/sections/noBookmarks.php';
			}

			?>

		</main>

		<?php require_once __DIR__ . '/../components/aside.php'; ?>

	</div>

	<?php require_once __DIR__ . '/../components/modals/commentOverlay.php'; ?>
	<?php require_once __DIR__ . '/../components/modals/replyOverlay.php'; ?>
	<?php require_once __DIR__ . '/../components/modals/analyticsModal.php'; ?>
	<?php require_once __DIR__ . '/../components/templates/reply.php'; ?>

</body>

</html>