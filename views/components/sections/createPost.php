<section id='sectionCreatePost'>
	<form action="/bridges/create-post" method='POST' id='formCreatePost' enctype="multipart/form-data">
		<section id='sectionCreatePostInputs'>
			<?php require_once __DIR__ . '/../../../services/get-user-avatar.php'; ?>
			<img src="<?php muoEcho(getUserAvatar($_SESSION['user'])); ?>"
				alt="Avatar" id='imgCreatePostAvatar'>
			<input name="post_content" type="text" placeholder="<?php muoEcho($translations['whats_happening']) ?>" id='inputCreatePost'>
		</section>

		<section id='sectionCreatePostTypes'>
			<input type="file" id='inputCreatePostImage' name='post_image' accept="image/*" />
			<label for="inputCreatePostImage">
				<?php require __DIR__ . '/../icons/picture-icon.php'; ?>
			</label>
			<div>
				<?php require __DIR__ . '/../icons/gif-icon.php'; ?>
			</div>
			<div>
				<?php require __DIR__ . '/../icons/muook-icon.php'; ?>
			</div>
			<div>
				<?php require __DIR__ . '/../icons/emoji-icon.php'; ?>
			</div>
			<button id='btnSubmitPost' type='submit'>
				<?php muoEcho($translations['post']) ?>
			</button>
		</section>
	</form>

</section>