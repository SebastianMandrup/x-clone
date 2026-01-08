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
	<a href="/premium" id='aPremium'>
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
	<div id='divNavMobileLogo'>
		&#120132;
	</div>
</nav>