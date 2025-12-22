<article class='articleComment' data-comment-pk='<?php muoEcho($comment['comment_pk']); ?>'>
	<section class='sectionCommentOptions'>
		<button class='btnCommentOptions btnMoreOptions' title='More options'>
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"
				aria-hidden="true" class="icon-more-horizontal">
				<circle cx="5" cy="12" r="2"></circle>
				<circle cx="12" cy="12" r="2"></circle>
				<circle cx="19" cy="12" r="2"></circle>
			</svg>
		</button>
	</section>
	<section class='sectionCommentAuthorInfo'>
		<?php require_once __DIR__ . '/../services/get-user-avatar.php'; ?>
		<img class='imgCommentAuthorAvatar' src='<?php muoEcho(getUserAvatar($comment)); ?>' alt='Comment Author Avatar'>
		<div class='divCommentAuthorText'>
			<a class='aCommentAuthorName' href='/user<?php muoEcho($comment['commenter_handle']); ?>'>
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
					echo 'Just now';
				} elseif ($timeAgo < 3600) {
					echo floor($timeAgo / 60) . ' min ago';
				} elseif ($timeAgo < 86400) {
					echo floor($timeAgo / 3600) . ' hours ago';
				} else {
					echo floor($timeAgo / 86400) . ' days ago';
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
				replies
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
			<svg xmlns=" http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"
				aria-hidden="true" class="icon-comment">
				<path
					d="M1.751 10c0-4.42 3.584-8 8.005-8h4.366c4.49 0 8.129 3.64 8.129 8.13 0 2.96-1.607 5.68-4.196 7.11l-8.054 4.46v-3.69h-.067c-4.49.1-8.183-3.51-8.183-8.01zm8.005-6c-3.317 0-6.005 2.69-6.005 6 0 3.37 2.77 6.08 6.138 6.01l.351-.01h1.761v2.3l5.087-2.81c1.951-1.08 3.163-3.13 3.163-5.36 0-3.39-2.744-6.13-6.129-6.13H9.756z">
				</path>
			</svg>
			<span class='spanCommentActionCount'>
				<?php muoEcho($comment['comment_replies_count']) ?>
			</span>
		</button>
		<button class='btnCommentAction btnLikeComment<?php if ($comment['is_liked_by_current_user']) muoEcho(" triggered") ?>' title="Like">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"
				aria-hidden="true" class="icon-like">
				<path
					d="M16.697 5.5c-1.222-.06-2.679.51-3.89 2.16l-.805 1.09-.806-1.09C9.984 6.01 8.526 5.44 7.304 5.5c-1.243.07-2.349.78-2.91 1.91-.552 1.12-.633 2.78.479 4.82 1.074 1.97 3.257 4.27 7.129 6.61 3.87-2.34 6.052-4.64 7.126-6.61 1.111-2.04 1.03-3.7.477-4.82-.561-1.13-1.666-1.84-2.908-1.91zm4.187 7.69c-1.351 2.48-4.001 5.12-8.379 7.67l-.503.3-.504-.3c-4.379-2.55-7.029-5.19-8.382-7.67-1.36-2.5-1.41-4.86-.514-6.67.887-1.79 2.647-2.91 4.601-3.01 1.651-.09 3.368.56 4.798 2.01 1.429-1.45 3.146-2.1 4.796-2.01 1.954.1 3.714 1.22 4.601 3.01.896 1.81.846 4.17-.514 6.67z">
				</path>
			</svg>
			<span class='spanCommentActionCount'>
				<?php muoEcho($comment['comment_likes_count']) ?>
			</span>
		</button>
		<button class='btnCommentAction btnViewAnalytics' title="View Analytics">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"
				aria-hidden="true" class="icon-bars">
				<path d="M8.75 21V3h2v18h-2zM18 21V8.5h2V21h-2zM4 21l.004-10h2L6 21H4zm9.248 0v-7h2v7h-2z">
				</path>
			</svg>
			<span class=spanCommentActionCount>
				9
			</span>
		</button>
		<section class='sectionMoreCommentOptions'>
			<button class='btnCommentOptions' title='Bookmark'>
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"
					aria-hidden="true" class="icon-bookmark">
					<path
						d="M4 4.5C4 3.12 5.119 2 6.5 2h11C18.881 2 20 3.12 20 4.5v18.44l-8-5.71-8 5.71V4.5zM6.5 4c-.276 0-.5.22-.5.5v14.56l6-4.29 6 4.29V4.5c0-.28-.224-.5-.5-.5h-11z">
					</path>
				</svg>
			</button>

			<button class='btnCommentOptions' title='Share'>
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"
					aria-hidden="true" class="icon-upload">
					<path
						d="M12 2.59l5.7 5.7-1.41 1.42L13 6.41V16h-2V6.41l-3.3 3.3-1.41-1.42L12 2.59zM21 15l-.02 3.51c0 1.38-1.12 2.49-2.5 2.49H5.5C4.11 21 3 19.88 3 18.5V15h2v3.5c0 .28.22.5.5.5h12.98c.28 0 .5-.22.5-.5L19 15h2z">
					</path>
				</svg>
			</button>
		</section>
	</footer>
</article>