<?php
if (!isset($firstThreeTopics)) {
	throw new Exception('First three topics not provided to whatsHappening section.');
}
?>

<section id='sectionWhatsHappening'>
	<header>
		<h3>
			<?php muoEcho($translations['whats_happening']) ?>
		</h3>
	</header>

	<?php
	foreach ($firstThreeTopics as $topic) {
		require __DIR__ . '../../articles/trendItem.php';
	}
	?>

	<button id='btnShowMoreTrends' class='btnShow' data-next-page='2'>
		<?php muoEcho($translations['show_more']) ?>
	</button>
	<button id='btnShowLessTrends' class='btnShow hidden'>
		<?php muoEcho($translations['show_less']) ?>
	</button>
</section>