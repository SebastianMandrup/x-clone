<div id='divAnalyticsOverlay' class='hidden'>

	<section id='sectionAnalyticsModal'>

		<button id='btnCloseAnalyticsOverlay'>
			&times;
		</button>

		<h1 id='h1AnalyticsModalTitle'>
			<?php muoEcho($translations['views']) ?>
		</h1>

		<p id='pAnalyticsModalDescription'>
			<?php muoEcho($translations['times_post_viewed']) ?>
			<a href="/home">
				<?php muoEcho($translations['help_center']) ?>
			</a>
		</p>

		<button id='btnDismissAnalyticsOverlay'>
			<?php muoEcho($translations['dismiss']) ?>
		</button>

	</section>

</div>