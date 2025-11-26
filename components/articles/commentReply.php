<article class='articleCommentReply'>
	<img class="imgCommentReplyAvatar" src="https://ui-avatars.com/api/?name=<?php muoEcho($reply['replier_name']); ?>&background=random" alt="User Avatar" />
	<div class='divCommentReplyContent'>
		<div class='divCommentReplyHeader'>
			<a class='aCommentReplyName' href='/<?php muoEcho($reply['replier_handle']); ?>'>
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