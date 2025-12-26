<header id='headerMain'>
	<?php if ($isForYou === true) : ?>
		<button class='selectedHeaderButton'>
			<span>
				<?php muoEcho($translations['for_you']) ?>
			</span>
		</button>
		<a href="/following">
			<?php muoEcho($translations['following']) ?>
		</a>
	<?php else : ?>
		<a href="/home">
			<?php muoEcho($translations['for_you']) ?>
		</a>
		<button class='selectedHeaderButton'>
			<span>
				<?php muoEcho($translations['following']) ?>
			</span>
		</button>
	<?php endif; ?>
</header>