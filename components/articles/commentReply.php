<article class='articleCommentReply'>
	<?php require_once __DIR__ . '/../services/get-user-avatar.php'; ?>
	<img class="imgCommentReplyAvatar" src="<?php muoEcho(getUserAvatar($reply['replier_name'])); ?>" alt="User Avatar" />
	<div class='divCommentReplyContent'>
		<div class='divCommentReplyHeader'>
			<a class='aCommentReplyName' href='/user/<?php muoEcho($reply['replier_handle']); ?>'>
				<?php muoEcho($reply['replier_name']); ?>
			</a>
			<p class='pCommentReplyHandle'>
				@<?php muoEcho($reply['replier_handle']); ?>
			</p>
		</div>
		<div class='divCommentReplyBody'>
			<p>
				<?php muoEcho($reply['reply_content']) ?>
			</p>
		</div>
	</div>
</article>