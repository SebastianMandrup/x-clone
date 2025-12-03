<header id='headerMainFollowers'>
	<a id='aFollowersBack' href='/user/<?php muoEcho($handle); ?>'>
		&lt;
		<?php muoEcho($handle); ?>
	</a>
</header>

<header id='headerMain'>
	<?php if ($endpoint === 'followers') : ?>
		<a href="/user/<?php muoEcho($handle); ?>/following">
			Following
		</a>
		<button class='selectedHeaderButton'>
			<span>
				Followers
			</span>
		</button>
	<?php else : ?>
		<button class='selectedHeaderButton'>
			<span>
				Following
			</span>
		</button>
		<a href="/user/<?php muoEcho($handle); ?>/followers">
			Followers
		</a>
	<?php endif; ?>
</header>