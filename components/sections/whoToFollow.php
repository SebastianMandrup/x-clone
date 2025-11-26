<?php
if (!isset($usersToFollow)) {
	throw new Exception('Users to follow not provided to whoToFollow section.');
}
?>
<section id='sectionWhoToFollow'>
	<header>
		Who To Follow
	</header>

	<?php

	$usersCount = count($usersToFollow);
	$moreUsersExist = false;

	if ($usersCount === 0) {
	?>
		<article class='articlePersonToFollow'>
			<div class='divPersonToFollowNames'>
				<span class='spanPersonToFollowFullName'>
					No users to follow
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
			Show more
		</button>
		<button id='btnShowLessWhoToFollow' class='btnShow hidden'>
			Show less
		</button>
</section>
<?php
	}
?>