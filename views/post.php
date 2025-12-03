<?php
require_once __DIR__ . "/../x.php";
$_db = require __DIR__ . '/../services/db_connector.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../../../styling/post/post.css">
	<link rel="icon" href="https://abs.twimg.com/responsive-web/client-web/icon-ios.77d25eba.png">
	<script src='../../../scripts/post/post.js' type='module'></script>
	<title> Post - <?php muoEcho($handle); ?></title>
</head>

<body>

	<div id='divMainContainer'>

		<?php require __DIR__ . '/../components/nav.php'; ?>

		<main>

			<?php

			require_once __DIR__ . '/../components/sections/postHeader.php';

			require_once __DIR__ . '/../components/sections/featuredPost.php';

			require_once __DIR__ . '/../components/sections/commentForm.php';

			foreach ($comments as $comment) {
				require __DIR__ . '/../components/articles/comment.php';
			}

			?>

		</main>

		<?php require_once __DIR__ . '/../components/aside.php'; ?>

	</div>

	<?php require_once __DIR__ . '/../components/replyOverlay.php'; ?>

</body>

</html>