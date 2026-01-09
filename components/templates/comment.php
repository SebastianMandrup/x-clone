<template id="templateComment">
	<article class='articleComment' data-comment-pk=''>
		<section class='sectionCommentAuthorInfo'>
			<img class='imgCommentAuthorAvatar' src='' alt=''>

			<div class='divCommentAuthorText'>
				<a class='aCommentAuthorName' href=''>
				</a>
				<p class='pCommentAuthorHandle'>
				</p>
				<p class='pDotSeparator'>
					·
				</p>
				<p class='pCommentCreatedAt'>
				</p>
			</div>
		</section>
		<p class='pCommentContent'>
		</p>
		<section class='sectionCommentReplies'>
			<p class='pCommentRepliesHeader'>
				<?php muoEcho($translations['no_replies_yet']); ?>
			</p>
		</section>

		<footer class='footerCommentActions'>
			<button class='btnCommentAction btnReplyComment' title="Reply">
				<?php include __DIR__ . '/../icons/comment-icon.php' ?>
				<span class='spanCommentActionCount'>
					0
				</span>
			</button>
			<button class='btnCommentAction btnLikeComment' title="Like">
				<?php include __DIR__ . '/../icons/like-icon.php' ?>
				<span class='spanCommentActionCount'>
					0
				</span>
			</button>
			<button class='btnCommentAction btnViewAnalytics' title="View Analytics">
				<?php include __DIR__ . '/../icons/analytics-icon.php' ?>
			</button>
		</footer>
	</article>
</template>