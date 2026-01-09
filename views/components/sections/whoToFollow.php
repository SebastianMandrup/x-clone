<?php
if (!isset($usersToFollow)) {
	throw new Exception('Users to follow not provided to whoToFollow section.');
}
?>
<section id='sectionWhoToFollow'>
	<header>
		<h4>
			<?php muoEcho($translations['who_to_follow']) ?>
		</h4>
	</header>

	<?php

	$usersCount = count($usersToFollow);
	$moreUsersExist = false;

	if ($usersCount === 0) {
	?>
		<article class='articlePersonToFollow'>
			<div class='divPersonToFollowNames'>
				<span class='spanPersonToFollowFullName'>
					<?php muoEcho($translations['no_users_to_follow']) ?>
				</span>
			</div>
		</article>
	<?php
		return;
	}

	if ($usersCount < 4) {
		$moreUsersExist = false;
	} else {
			$moreUsersExist = true;
		array_pop($usersToFollow);
	}

	foreach ($usersToFollow as $user) {
		require __DIR__ . '../../articles/personToFollow.php';
	}

	if ($moreUsersExist) {
	?>
		<button id='btnShowMoreWhoToFollow' class='btnShow' data-next-page='2'>
			<?php muoEcho($translations['show_more']) ?>
		</button>
		<button id='btnShowLessWhoToFollow' class='btnShow hidden'>
			<?php muoEcho($translations['show_less']) ?>
		</button>
</section>
<?php
	}
?>