<article class='articleUser'>
	<?php require_once __DIR__ . '/../../services/get-user-avatar.php'; ?>
	<img class='imgUser' src="<?php muoEcho(getUserAvatar($user)); ?>">
	<section class='sectionUserNames'>
		<a class='aUserFullName' href="/user/<?php muoEcho($user["user_handle"]); ?>">
			<?php muoEcho($user["user_name"]); ?>
		</a>
		<p class='pUserHandle'>
			@<?php muoEcho($user["user_handle"]); ?>
		</p>
	</section>

	<?php
	if ($user["is_followed"]) {
	?>
		<button class='btnFollow hidden' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">
			<?php muoEcho($translations['follow']) ?>
		</button>
		<button class='btnUnfollow' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">
			<?php muoEcho($translations['unfollow']) ?>
		</button>
	<?php
	} else {
	?>
		<button class='btnFollow' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">
			<?php muoEcho($translations['follow']) ?>
		</button>
		<button class='btnUnfollow hidden' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">
			<?php muoEcho($translations['unfollow']) ?>
		</button>
	<?php
	}
	?>
</article>