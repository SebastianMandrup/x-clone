<section id='sectionFeaturedPost'>

	<section id='sectionFeaturedPostAuthor'>
		<div>
			<img id='imgFeaturedPostAuthorAvatar' src='https://ui-avatars.com/api/?name=<?php echo urlencode($post['user_name']); ?>&background=random' alt='Author Avatar'>
			<div id='divFeaturedPostAuthorInfo'>
				<a id='aFeaturedPostAuthorName' href='/<?php muoEcho($post['user_handle']); ?>'>
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
		<img id='imgFeaturedPostImage' src='<?php muoEcho($post['post_image']); ?>' alt='Post Image'>
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
		// Convert Unix timestamp to DateTime
		$postDate = DateTime::createFromFormat('U', $post['post_created_at']);
		muoEcho($postDate->format("g:i A") . " · " . $postDate->format("M j, Y") . " · " . count($comments) . " Comment" . (count($comments) !== 1 ? "s" : ""));
		?>
	</p>

</section>