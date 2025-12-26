<header id='headerMainFollowers'>
	<a id='aFollowersBack' href='/user/<?php muoEcho($handle); ?>'>
		&lt;
		<?php muoEcho($handle); ?>
	</a>
</header>

<header id='headerMain'>
	<?php if ($endpoint === 'followers') : ?>
		<a href="/user/<?php muoEcho($handle); ?>/following">
			<?php muoEcho($translations['following']) ?>
		</a>
		<button class='selectedHeaderButton'>
			<span>
				<?php muoEcho($translations['followers']) ?>
			</span>
		</button>
	<?php else : ?>
		<button class='selectedHeaderButton'>
			<span>
				<?php muoEcho($translations['following']) ?>
			</span>
		</button>
		<a href="/user/<?php muoEcho($handle); ?>/followers">
			<?php muoEcho($translations['followers']) ?>
		</a>
	<?php endif; ?>
</header>