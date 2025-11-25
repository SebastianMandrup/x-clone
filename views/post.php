<?php
require_once __DIR__ . "/../services/protect-route.php";
require_once __DIR__ . "/../x.php";
$_db = require_once __DIR__ . '/../services/db_connector.php';

$sql = "
        SELECT 
			-- post
			post.post_pk,
			post.post_content,
			post.post_image,
			post.post_reference,
			post.post_created_at,

			-- author
			author.user_pk,
			author.user_handle,
			author.user_name,

			-- referenced post
			rp.post_pk AS ref_post_pk,
			rp.post_content AS ref_post_content,
			rp.post_image AS ref_post_image,
			rp.post_created_at AS ref_post_created_at,

			-- referenced post author
			ru.user_pk AS ref_user_pk,
			ru.user_name AS ref_user_name,
			ru.user_handle AS ref_user_handle

		FROM posts post
		INNER JOIN users author
			ON post.post_user_fk = author.user_pk
		LEFT JOIN comments c
			ON c.comment_post_fk = post.post_pk
		LEFT JOIN posts rp
			ON post.post_reference = rp.post_pk
		LEFT JOIN users ru
			ON rp.post_user_fk = ru.user_pk
		WHERE post.post_pk = :postPk
			AND author.user_handle = :username
			AND post.post_deleted_at IS NULL
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
				u.user_pk as commenter_pk,
				(SELECT COUNT(*) FROM comment_likes cl WHERE cl.comment_fk = c.comment_pk AND cl.user_fk = :currentUserPk AND cl.like_deleted_at IS NULL) AS is_liked_by_current_user,
				(SELECT COUNT(*) FROM comment_likes cl WHERE cl.comment_fk = c.comment_pk AND cl.like_deleted_at IS NULL) AS comment_likes_count
				FROM comments c
				INNER JOIN users u ON c.comment_user_fk = u.user_pk
				WHERE c.comment_post_fk = :postPk
				AND c.comment_deleted_at IS NULL
				ORDER BY c.comment_created_at ASC";
			$stmt = $_db->prepare($sql);
			$stmt->bindValue(':postPk', $postPk);
			$stmt->bindValue(':currentUserPk', $_SESSION['user']['user_pk']);
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