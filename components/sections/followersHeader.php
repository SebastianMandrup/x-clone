<header id='headerMainFollowers'>
	<a id='aFollowersBack' href='/user/<?php muoEcho($handle); ?>'>
		&lt;
		<?php muoEcho($handle); ?>
	</a>
</header>

<header id='headerMain'>
	<?php if ($endpoint === 'followers') : ?>
		<button class='selectedHeaderButton'>
			<span>
				Followers
			</span>
		</button>
		<a href="/user/<?php muoEcho($handle); ?>/following">
			Following
		</a>
	<?php else : ?>
		<a href="/user/<?php muoEcho($handle); ?>/followers">
			Followers
		</a>
		<button class='selectedHeaderButton'>
			<span>
				Following
			</span>
		</button>
	<?php endif; ?>
</header>