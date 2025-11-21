<?php
require_once __DIR__ . "/../services/protect-route.php";
require_once __DIR__ . "../../x.php";
require_once __DIR__ . '../../db_connector.php';

$sql = "
        SELECT 
			p.post_pk,
			p.post_content,
			p.post_image,
			p.post_reference,
			p.post_created_at,
			u.user_pk,
			u.user_handle,
			u.user_name
		FROM posts p
		INNER JOIN users u
			ON p.post_user_fk = u.user_pk
		LEFT JOIN comments c
			ON c.comment_post_fk = p.post_pk
		WHERE p.post_pk = :postPk
			AND u.user_handle = :username
			AND p.post_deleted_at IS NULL
	";
$stmt = $_db->prepare($sql);
$stmt->bindValue(':postPk', $postPk);
$stmt->bindValue(':username', $username);
$stmt->execute();
$post = $stmt->fetch();

if (!$post) {
	header("Location: /home?errorToast=" . urlencode("The requested post does not exist."));
	exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../../styling/post/post.css">
	<link rel="icon" href="https://abs.twimg.com/responsive-web/client-web/icon-ios.77d25eba.png">
	<script src='../../scripts/post/post.js' type='module'></script>
	<title> Post - <?php muoEcho($username); ?></title>
</head>

<body>

	<div id='divMainContainer'>

		<?php require __DIR__ . '/../components/nav.php'; ?>

		<main>

			<?php

			require_once __DIR__ . '/../components/sections/postHeader.php';

			$sql = "SELECT
						c.comment_pk,
						c.comment_content,
						c.comment_created_at,
						u.user_handle as commenter_handle,
						u.user_name as commenter_name,
						u.user_pk as commenter_pk
						FROM comments c
						INNER JOIN users u
						ON c.comment_user_fk = u.user_pk
						WHERE c.comment_post_fk = :postPk
						AND c.comment_deleted_at IS NULL
						ORDER BY c.comment_created_at ASC";
			$stmt = $_db->prepare($sql);
			$stmt->bindValue(':postPk', $postPk);
			$stmt->execute();
			$comments = $stmt->fetchAll();

			require_once __DIR__ . '/../components/sections/featuredPost.php';

			require_once __DIR__ . '/../components/sections/commentForm.php';

			foreach ($comments as $comment) {
				require __DIR__ . '/../components/articles/comment.php';
			}

			?>

		</main>

		<?php require __DIR__ . '/../components/aside.php'; ?>

	</div>

	<?php require __DIR__ . '/../components/commentOverlay.php'; ?>

</body>

</html>