<div id='divAddCommentOverlay' class='hidden'>
	<section id='sectionAddComment'>
		<button id='btnCloseCommentOverlay'>
			&times;
		</button>
		<section id='sectionOriginalPost'>
			<section id='sectionOriginalPostUserInfo'>
				<img id='imgOriginalPostAvatar' />
				<span id='spanOriginalPostUserName'></span>
				<span id='spanOriginalPostUserHandle'></span>
				<span class='spanPostDotSeparator'>
					&#8226;
				</span>
				<span id='spanOriginalPostTime'></span>
			</section>
			<p id='pOriginalPostContent'></p>

		</section>
		<form id='formAddComment'>
			<section id='sectionAddCommentContent'>
				<img src="https://ui-avatars.com/api/?name=<?php muoEcho(($_SESSION['user']['user_name'])); ?>&background=random"
					alt="Avatar" id='imgAddCommentAvatar'>
				<textarea name="comment_content" id="textareaAddComment" placeholder="Post your reply" required></textarea>
			</section>
			<button type='submit' id='btnSubmitAddComment'>
				Reply
			</button>
		</form>
	</section>

</div>