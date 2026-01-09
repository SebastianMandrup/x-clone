<section id='sectionFeaturedPost'>

	<section id='sectionFeaturedPostAuthor'>
		<div>
			<?php require_once __DIR__ . '/../../../services/get-user-avatar.php'; ?>
			<img id='imgFeaturedPostAuthorAvatar' src='<?php muoEcho(getUserAvatar($post)); ?>' alt='Author Avatar'>
			<div id='divFeaturedPostAuthorInfo'>
				<a id='aFeaturedPostAuthorName' href='/user/<?php muoEcho($post['user_handle']); ?>'>
					<?php muoEcho($post['user_name']); ?>
				</a>
				<p id='pFeaturedPostAuthorHandle'>
					@<?php muoEcho($post['user_handle']); ?>
				</p>
			</div>
		</div>
		<div>
			<button id='btnFeaturedPostOptions' aria-label='Post Options'>
				...
			</button>
		</div>
	</section>

	<p id='pFeaturedPostContent'>
		<?php muoEcho($post['post_content']); ?>
	</p>

	<?php
	if (isset($post['post_image']) && !empty($post['post_image'])) {
	?>
		<img id='imgFeaturedPostImage' src='<?php muoEcho('/uploads/posts/' . $post['post_image']); ?>' alt='Post Image'>
	<?php
	}
	?>


	<?php
	if ($post['ref_post_pk']) {
		include __DIR__ . '/../articles/repost.php';
	}
	?>

	<p id='pFeaturedPostCreatedAt'>
		<?php
		$commentCount = count($comments);
		// Convert Unix timestamp to DateTime
		$postDate = DateTime::createFromFormat('U', $post['post_created_at']);
		muoEcho($postDate->format("g:i A") . " · " . $postDate->format("M j, Y") . " · ");

		?>
		<span id='spanFeaturedPostCommentCount'>
			<?php muoEcho($commentCount); ?>
		</span>
		<span id='spanFeaturedPostCommentLabel'>
			<?php muoEcho($commentCount === 1 ? $translations['comment'] : $translations['comments']);
			?>
		</span>
	</p>

</section>