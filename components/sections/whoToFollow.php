<section id='sectionWhoToFollow'>
	<header>
		Who To Follow
	</header>

	<?php

	require_once __DIR__ . '../../../db_connector.php';

	$sql = "SELECT user_pk, user_name, user_handle 
			FROM users 
			LEFT JOIN follows ON users.user_pk = follows.followed_user_fk AND follows.following_user_fk = :userPk
			WHERE follows.followed_user_fk IS NULL
			OR follows.follow_deleted_at IS NOT NULL
			AND user_pk != :userPk 
			ORDER BY user_pk 
			LIMIT 4;
	";

	$stmt = $_db->prepare($sql);
	$stmt->bindValue(':userPk', $_SESSION['user']['user_pk']);
	$stmt->execute();

	$users = $stmt->fetchAll();

	$usersCount = count($users);
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
		array_pop($users);
	}

	foreach ($users as $user) {
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