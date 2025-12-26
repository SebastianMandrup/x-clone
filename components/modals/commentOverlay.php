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
				<?php require_once __DIR__ . '/../../services/get-user-avatar.php'; ?>
				<img src="<?php muoEcho(getUserAvatar($_SESSION['user'])) ?>"
					alt="Avatar" id='imgAddCommentAvatar'>
				<textarea name="comment_content" id="textareaAddComment" placeholder="<?php muoEcho($translations['post_your_reply']) ?>" required></textarea>
			</section>
			<button type='submit' id='btnSubmitAddComment'>
				<?php muoEcho($translations['reply']) ?>
			</button>
		</form>
	</section>

</div>