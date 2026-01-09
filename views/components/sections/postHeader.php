<header id='headerMainPost'>
	<a id='aPostBackButton' href='javascript:history.back()'>
		&lt;
	</a>
	<h1 id='h1Post'>
		<?php
		if ($post['ref_post_pk']) {
			muoEcho($translations['repost']);
		} else {
			muoEcho($translations['post']);
		}
		?>
	</h1>
</header>