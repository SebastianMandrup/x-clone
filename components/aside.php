<aside>
	<section id='sectionSearch'>
		<form action="/api/search.php" method="POST" id='formSearch'>
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16"
				fill="currentColor" aria-hidden="true" class="search-icon">
				<title>
					<?php muoEcho($translations['search']) ?>
				</title>
				<g>
					<path
						d="M10.25 3.75c-3.59 0-6.5 2.91-6.5 6.5s2.91 6.5 6.5 6.5c1.795 0 3.419-.726 4.596-1.904 1.178-1.177 1.904-2.801 1.904-4.596 0-3.59-2.91-6.5-6.5-6.5zm-8.5 6.5c0-4.694 3.806-8.5 8.5-8.5s8.5 3.806 8.5 8.5c0 1.986-.682 3.815-1.824 5.262l4.781 4.781-1.414 1.414-4.781-4.781c-1.447 1.142-3.276 1.824-5.262 1.824-4.694 0-8.5-3.806-8.5-8.5z" />
				</g>
			</svg>
			<input name="search" type="text" placeholder='<?php muoEcho($translations['search']) ?>' autocomplete="off" />
		</form>
	</section>

	<section id='sectionSubscribe'>
		<header>
			<h2>
				<?php muoEcho($translations['subscribe_to_premium']) ?>
			</h2>
		</header>
		<p>
			<?php muoEcho($translations['subscribe_to_unlock_features']) ?>
		</p>
		<button>
			<?php muoEcho($translations['subscribe']) ?>
		</button>
	</section>

	<div id='divTrends'>
		<?php require_once __DIR__ . '../../components/sections/whatsHappening.php'; ?>
		<?php require_once __DIR__ . '../../components/sections/whoToFollow.php'; ?>
	</div>


	<footer id='footerAside'>
		<a href="#">
			<?php muoEcho($translations['terms_of_service']) ?>
		</a>
		<span>|</span>
		<a href="#">
			<?php muoEcho($translations['privacy_policy']) ?>
		</a>
		<span>|</span>
		<a href="#">
			<?php muoEcho($translations['cookie_policy']) ?>
		</a>
		<a href="#">
			<span>|</span>
			<?php muoEcho($translations['accessibility']) ?>
		</a>
		<a href="#">
			<?php muoEcho($translations['ads_info']) ?>
		</a>
		<span>|</span>
		<a href="#">
			<?php muoEcho($translations['more']) ?>
		</a>
		<span>|</span>
		<div id="divFooterCopy">
			<?php muoEcho($translations['footer_copyright']) ?>
		</div>
	</footer>
</aside>

<?php require_once __DIR__ . '/../components/templates/trend.php'; ?>
<?php require_once __DIR__ . '/../components/templates/userToFollow.php'; ?>