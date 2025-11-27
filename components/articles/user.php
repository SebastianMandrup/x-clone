<article class='articleUser'>
	<img class='imgUser' src="https://ui-avatars.com/api/?name=<?php muoEcho($user["user_name"]); ?>&background=random">
	<section class='sectionUserNames'>
		<a class='aUserFullName' href="/<?php muoEcho($user["user_handle"]); ?>">
			<?php muoEcho($user["user_name"]); ?>
		</a>
		<p class='pUserHandle'>
			@<?php muoEcho($user["user_handle"]); ?>
		</p>
	</section>

	<?php
	if ($user["is_followed"]) {
	?>
		<button class='btnFollow hidden' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">Follow</button>
		<button class='btnUnfollow' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">Unfollow</button>
	<?php
	} else {
	?>
		<button class='btnFollow' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">Follow</button>
		<button class='btnUnfollow hidden' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">Unfollow</button>
	<?php
	}
	?>
</article>