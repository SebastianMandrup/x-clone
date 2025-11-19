<section id='sectionWhatsHappening'>
	<header>
		What's happening
	</header>

	<?php
	require_once __DIR__ . '../../../db_connector.php';

	$sql = 'SELECT topic_pk, topic_name, topic_field, topic_count, topic_rank FROM topics ORDER BY topic_rank DESC LIMIT 3;';
	$stmt = $_db->prepare($sql);
	$stmt->execute();

	$topics = $stmt->fetchAll();
	foreach ($topics as $topic) {
		require __DIR__ . '../../articles/trendItem.php';
	}
	?>

	<button id='btnShowMoreTrends' class='btnShow' data-next-page='2'>
		Show more
	</button>
	<button id='btnShowLessTrends' class='btnShow hidden'>
		Show less
	</button>
</section>