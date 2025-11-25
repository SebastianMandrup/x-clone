<?php
require_once __DIR__ . "/../services/protect-route.php";
require_once __DIR__ . "../../x.php";
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./styling/home/home.css">
	<link rel="icon" href="https://abs.twimg.com/responsive-web/client-web/icon-ios.77d25eba.png">
	<script src='./scripts/home/home.js' type='module'></script>
	<title>Following / MUO</title>
</head>

<body>

	<div id='divMainContainer'>

		<?php require __DIR__ . '/../components/nav.php'; ?>

		<main>
			<header id='headerMain'>
				<a href="/home">
					For you
				</a>
				<button class='selectedHeaderButton'>
					<span>
						Following
					</span>
				</button>
			</header>

			<?php require_once __DIR__ . '/../components/sections/createPost.php'; ?>

			<section id='sectionLoadMorePosts'>
				<button id='btnLoadMorePosts'>
					Show 140 Posts
				</button>
			</section>


			<?php
			require_once __DIR__ . '../../db_connector.php';


			$sql = "SELECT 
                p.post_pk,
                p.post_content,
                p.post_image,
                p.post_created_at,
                u.user_pk,
                u.user_name,
                u.user_handle,
                
                -- referenced post fields
                rp.post_pk AS ref_post_pk,
                rp.post_content AS ref_post_content,
                rp.post_image AS ref_post_image,
                rp.post_created_at AS ref_post_created_at,
                ru.user_pk AS ref_user_pk,
                ru.user_name AS ref_user_name,
                ru.user_handle AS ref_user_handle,

                -- like information (subquery to avoid duplicates)
                (SELECT COUNT(*) FROM post_likes WHERE post_fk = p.post_pk AND like_deleted_at IS NULL) AS like_count,
                (SELECT 1 FROM post_likes WHERE post_fk = p.post_pk AND user_fk = :current_user_pk AND like_deleted_at IS NULL LIMIT 1) AS liked_by_user,

                -- comment count
                (SELECT COUNT(*) FROM comments WHERE comment_post_fk = p.post_pk AND comment_deleted_at IS NULL) AS comment_count,

                -- repost information (subquery to avoid duplicates)
                (SELECT COUNT(*) FROM posts WHERE post_reference = p.post_pk AND post_deleted_at IS NULL) AS repost_count,
                (SELECT 1 FROM posts WHERE post_reference = p.post_pk AND post_user_fk = :current_user_pk AND post_deleted_at IS NULL LIMIT 1) AS reposted_by_user

            FROM posts p
            INNER JOIN users u 
                ON p.post_user_fk = u.user_pk
            
            -- Join with follows table to get users you're following
            INNER JOIN follows f 
                ON u.user_pk = f.followed_user_fk  -- The user being followed (post author)
                AND f.following_user_fk = :current_user_pk  -- You are the follower
                AND f.follow_deleted_at IS NULL

            -- self join to bring in the referenced post
            LEFT JOIN posts rp 
                ON p.post_reference = rp.post_pk
            LEFT JOIN users ru 
                ON rp.post_user_fk = ru.user_pk

            WHERE p.post_deleted_at IS NULL
            ORDER BY p.post_created_at DESC";


			$stmt = $_db->prepare($sql);
			$stmt->bindValue(':current_user_pk', $_SESSION['user']['user_pk']);
			$stmt->execute();

			$posts = $stmt->fetchAll();
			foreach ($posts as $post) {
				require __DIR__ . '../../components/articles/post.php';
			}

			?>

			<div class="circle-loader"></div>
		</main>

		<?php require __DIR__ . '/../components/aside.php'; ?>

	</div>

	<?php require __DIR__ . '/../components/commentOverlay.php'; ?>

</body>

</html>