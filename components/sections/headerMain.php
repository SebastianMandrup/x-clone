<header id='headerMain'>

	<?php if ($isForYou) : ?>
		<button class='selectedHeaderButton'>
			<span>
				For you
			</span>
		</button>
		<a href="/following">
			Following
		</a>
	<?php else : ?>
		<a href="/home">
			For you
		</a>
		<button class='selectedHeaderButton'>
			<span>
				Following
			</span>
		</button>
	<?php endif; ?>
</header>