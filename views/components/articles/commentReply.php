<article class='articleCommentReply'>
	<?php
	if (!isset($reply['replier_avatar']) || $reply['replier_avatar'] === null) {
	?>
		<img class="imgCommentReplyAvatar" src="<?php muoEcho("https://ui-avatars.com/api/?name=" . urlencode($reply['replier_name']) . "&background=random"); ?>" alt="User Avatar" />
	<?php
	} else {
	?>
		<img class="imgCommentReplyAvatar" src="<?php muoEcho('/views/uploads/avatars/' . $reply['replier_avatar']); ?>" alt="User Avatar" />
	<?php
	}
	?>
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