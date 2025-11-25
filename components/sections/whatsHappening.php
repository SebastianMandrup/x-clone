<?php
if (!isset($firstThreeTopics)) {
	throw new Exception('First three topics not provided to whatsHappening section.');
}
?>

<section id='sectionWhatsHappening'>
	<header>
		What's happening
	</header>

	<?php
	foreach ($firstThreeTopics as $topic) {
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