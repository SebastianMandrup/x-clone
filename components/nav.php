<nav id='navMain'>
	<a href="/home" id='aXLogo'>
		&#120132;
	</a>
	<a href="/home">
		<?php require __DIR__ . '/icons/home-icon.php'; ?>
		<?php muoEcho($translations['home']) ?>
	</a>
	<a href='/explore'>
		<?php require __DIR__ . '/icons/search-icon.php'; ?>
		<?php muoEcho($translations['explore']) ?>
	</a>
	<a href="/notification" id='aNotification'>
		<?php require __DIR__ . '/icons/notification-icon.php'; ?>
		<?php muoEcho($translations['notifications']) ?>
	</a>
	<a href="/messages" id='aMessages'>
		<?php require __DIR__ . '/icons/message-icon.php'; ?>
		<?php muoEcho($translations['messages']) ?>
	</a>
	<a href="/grok">
		<?php require __DIR__ . '/icons/muook-icon.php'; ?>
		<?php muoEcho($translations['muook']) ?>
	</a>
	<a href="/communities" id='aCommunities'>
		<?php require __DIR__ . '/icons/communities-icon.php'; ?>
		<?php muoEcho($translations['communities']) ?>
	</a>
	<a href="/verified-orgs">
		<?php require __DIR__ . '/icons/lightening-icon.php'; ?>
		<?php muoEcho($translations['premium']) ?>
	</a>
	<a href="/user/<?php muoEcho($_SESSION['user']['user_handle']); ?>">
		<?php require __DIR__ . '/icons/profile-icon.php'; ?>
		<?php muoEcho($translations['profile']) ?>
	</a>
	<a href="/bookmarks">
		<?php require __DIR__ . '/icons/bookmark-icon.php'; ?>
		<?php muoEcho($translations['bookmarks']) ?>
	</a>
	<button id='btnPost'>
		<?php muoEcho($translations['post']) ?>
	</button>
	<button id='btnPostMobile'>
		<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="20" height="20" aria-hidden="true">
			<path
				d="M12.745 20.54l10.97-8.19c.539-.4 1.307-.244 1.564.38 1.349 3.288.746 7.241-1.938 9.955-2.683 2.714-6.417 3.31-9.83 1.954l-3.728 1.745c5.347 3.697 11.84 2.782 15.898-1.324 3.219-3.255 4.216-7.692 3.284-11.693l.008.009c-1.351-5.878.332-8.227 3.782-13.031L33 0l-4.54 4.59v-.014L12.743 20.544m-2.263 1.987c-3.837-3.707-3.175-9.446.1-12.755 2.42-2.449 6.388-3.448 9.852-1.979l3.72-1.737c-.67-.49-1.53-1.017-2.515-1.387-4.455-1.854-9.789-.931-13.41 2.728-3.483 3.523-4.579 8.94-2.697 13.561 1.405 3.454-.899 5.898-3.22 8.364C1.49 30.2-.334 31.074-.999 32l10.478-9.466" />
		</svg>
	</button>
	<section id='sectionUserActions' class='hidden'>
		<button>
			<?php muoEcho($translations['add_an_existing_account']) ?>
		</button>
		<button id='btnLogout'>
			<?php muoEcho($translations['log_out_of']) ?>
			<?php muoEcho($_SESSION["user"]["user_name"]); ?>
		</button>
	</section>
	<section id='sectionUserInfo'>
		<?php require_once __DIR__ . '/../services/get-user-avatar.php'; ?>
		<img src="<?php muoEcho(getUserAvatar($_SESSION['user'])); ?>"
			alt="Avatar" id='imgUserAvatar'>
		<div id='divUserNames'>
			<span id='spanUserFullName'>
				<?php muoEcho($_SESSION["user"]["user_name"]); ?>
			</span>
			<span id='spanUserHandle'>
				@<?php muoEcho($_SESSION["user"]["user_handle"]); ?>
			</span>
		</div>
		<div id='divMoreOptions'>
			<?php require __DIR__ . '/icons/simple-more-icon.php'; ?>
		</div>
	</section>
</nav>

<nav id='navMobile'>
	<section id='sectionUserInfoMobile'>
		<img src="<?php muoEcho(getUserAvatar($_SESSION['user'])); ?>"
			alt="Avatar" id='imgUserAvatarMobile'>
	</section>
	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true">
		<path
			d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
	</svg>
</nav>