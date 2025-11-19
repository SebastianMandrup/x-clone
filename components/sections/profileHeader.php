<header id='headerMainProfile'>
	<a id='aProfileBackButton' href='/home'>
		&lt;
	</a>
	<section id='sectionProfileHeaderInfo'>
		<h1 id='h1ProfileUsername'>
			<?php muoEcho($user["user_handle"]); ?>
		</h1>
		<p id='pProfilePostCount'>
			<?php muoEcho($user["post_count"]); ?> Posts
		</p>
	</section>
</header>