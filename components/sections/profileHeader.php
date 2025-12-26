<header id='headerMainProfile'>
	<a id='aProfileBackButton' href='/home'>
		&lt;
	</a>
	<section id='sectionProfileHeaderInfo'>
		<h1 id='h1ProfileUsername'>
			<?php muoEcho($focusedUser["user_handle"]); ?>
		</h1>
		<p id='pProfilePostCount'>
			<?php muoEcho($focusedUser["post_count"] . ' ' . $translations['posts']); ?>
		</p>
	</section>
</header>