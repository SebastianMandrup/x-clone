<section id='sectionWhoToFollow'>
	<header>
		Who To Follow
	</header>

	<?php

	require_once __DIR__ . '../../../db_connector.php';

	$sql = "SELECT user_pk, user_name, user_handle FROM users WHERE user_pk != :userPk ORDER BY user_pk LIMIT 3;";
	$stmt = $_db->prepare($sql);
	$stmt->bindValue(':userPk', $_SESSION['user']['user_pk']);
	$stmt->execute();

	$users = $stmt->fetchAll();
	foreach ($users as $user) {
		require __DIR__ . '../../articles/personToFollow.php';
	}

	?>
	<button id='btnShowMoreWhoToFollow' class='btnShow' data-next-page='2'>
		Show more
	</button>
	<button id='btnShowLessWhoToFollow' class='btnShow hidden'>
		Show less
	</button>

</section>