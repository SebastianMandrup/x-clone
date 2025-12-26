<article class='articleComment' data-comment-pk='<?php muoEcho($comment['comment_pk']); ?>'>
	<section class='sectionCommentOptions'>
		<button class='btnCommentOptions btnMoreOptions' title='<?php muoEcho($translations['more_options']); ?>'>
			<?php include __DIR__ . '/../icons/simple-more-icon.php' ?>
		</button>
	</section>
	<section class='sectionCommentAuthorInfo'>
		<?php
		if (!isset($comment['commenter_avatar']) || empty($comment['commenter_avatar'])) {
		?>
			<img class='imgCommentAuthorAvatar' src='https://ui-avatars.com/api/?name=<?php muoEcho($comment['commenter_name']); ?>&background=random' alt='<?php muoEcho($translations['comment_author_avatar']) ?>'>
		<?php
		} else {
		?>
			<img class='imgCommentAuthorAvatar' src='/uploads/avatars/<?php muoEcho($comment['commenter_avatar']); ?>' alt='<?php muoEcho($translations['comment_author_avatar']) ?>'>
		<?php
		}
		?>
		<div class='divCommentAuthorText'>
			<a class='aCommentAuthorName' href='/user/<?php muoEcho($comment['commenter_handle']); ?>'>
				<?php muoEcho($comment['commenter_name']); ?>
			</a>
			<p class='pCommentAuthorHandle'>
				@<?php muoEcho($comment['commenter_handle']); ?>
			</p>
			<p class='pDotSeparator'>
				·
			</p>
			<p class='pCommentCreatedAt'>
				<?php
				$timeAgo = time() - $comment['comment_created_at'];
				if ($timeAgo < 60) {
					muoEcho($translations['just_now']);
				} elseif ($timeAgo < 3600) {
					muoEcho(floor($timeAgo / 60) . ' ' . $translations['min_ago']);
				} elseif ($timeAgo < 86400) {
					muoEcho(floor($timeAgo / 3600) . ' ' . $translations['hours_ago']);
				} else {
					muoEcho(floor($timeAgo / 86400) . ' ' . $translations['days_ago']);
				}
				?>
			</p>
		</div>
	</section>
	<p class='pCommentContent'>
		<?php muoEcho($comment['comment_content']); ?>
	</p>

	<?php
	if (isset($comment['replies']) && is_array($comment['replies']) && count($comment['replies']) > 0) {
	?>
		<section class='sectionCommentReplies'>
			<p class='pCommentRepliesHeader'>
				<?php muoEcho(count($comment['replies']) . ' ' . $translations['replies']); ?>
			</p>
			<?php
			foreach ($comment['replies'] as $reply) {
				require __DIR__ . '/commentReply.php';
			}
			?>
		</section>
	<?php
	}
	?>

	<footer class='footerCommentActions'>
		<button class='btnCommentAction btnReplyComment <?php if ($comment['is_replied_by_current_user']) muoEcho('triggered') ?>' title="Reply">
			<?php include __DIR__ . '/../icons/comment-icon.php' ?>
			<span class='spanCommentActionCount'>
				<?php muoEcho($comment['comment_replies_count']) ?>
			</span>
		</button>
		<button class='btnCommentAction btnLikeComment<?php if ($comment['is_liked_by_current_user']) muoEcho(" triggered") ?>' title="Like">
			<?php include __DIR__ . '/../icons/like-icon.php' ?>
			<span class='spanCommentActionCount'>
				<?php muoEcho($comment['comment_likes_count']) ?>
			</span>
		</button>
		<button class='btnCommentAction btnViewAnalytics' title="View Analytics">
			<?php include __DIR__ . '/../icons/analytics-icon.php' ?>
		</button>
		<section class='sectionMoreCommentOptions'>
			<button class='btnCommentOptions' title='Bookmark'>
				<?php include __DIR__ . '/../icons/bookmark-icon.php' ?>
			</button>
			<button class='btnCommentOptions' title='Share'>
				<?php include __DIR__ . '/../icons/share-icon.php' ?>
			</button>
		</section>
	</footer>
</article>