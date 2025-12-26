<form action="/api/add-comment" method='POST' id='formCreateComment'>
	<section id='sectionCreatePostInputs'>
		<?php require_once __DIR__ . '/../../services/get-user-avatar.php'; ?>
		<img id='imgCreateCommentAvatar' src="<?php muoEcho(getUserAvatar($_SESSION['user'])); ?>" alt="<?php muoEcho($translations['your_avatar']); ?>" class='imgCreateCommentAvatar'>
		<input type="hidden" name="postPk" value="<?php muoEcho($post["post_pk"]); ?>">
		<input name="comment_content" type="text" placeholder="<?php muoEcho($translations['post_your_reply']) ?>" id='inputCreateComment'>
	</section>

	<section id='sectionCreateCommentTypes'>
		<button>
			<?php include __DIR__ . '/../icons/picture-icon.php' ?>
		</button>
		<button>
			<?php include __DIR__ . '/../icons/gif-icon.php' ?>
		</button>
		<button>
			<?php include __DIR__ . '/../icons/muook-icon.php' ?>
		</button>
		<button>
			<?php include __DIR__ . '/../icons/emoji-icon.php' ?>
		</button>
		<button id='btnSubmitComment' type='submit'>
			<?php muoEcho($translations['reply']) ?>
		</button>
	</section>
</form>