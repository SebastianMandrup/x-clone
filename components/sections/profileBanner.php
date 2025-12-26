<section id='sectionProfileBanner'>

	<?php if (!$focusedUser["user_banner"]) : ?>
		<div id='divDefaultBanner'></div>
	<?php else : ?>
		<img id='imgProfileBanner' src="/uploads/banners/<?php muoEcho($focusedUser["user_banner"]); ?>" alt="Profile Banner Image">
	<?php endif; ?>
	<section id='sectionUserDetails'>

		<?php require_once __DIR__ . '/../../services/get-user-avatar.php'; ?>

		<img id='imgUserAvatarBanner' src="<?php muoEcho(getUserAvatar($focusedUser)); ?>"
			alt="Avatar">

		<?php if ($focusedUser["user_pk"] === $_SESSION["user"]["user_pk"]) : ?>
			<button id='buttonEditProfile'>
				<?php muoEcho($translations['edit_profile']) ?>
			</button>
		<?php else : ?>
			<button class='btnFollow <?php muoEcho($focusedUser["is_following"] ? 'hidden' : ''); ?>' data-user-pk='<?php muoEcho($focusedUser["user_pk"]); ?>'>
				<?php muoEcho($translations['follow']) ?>
			</button>
			<button class='btnUnfollow <?php muoEcho($focusedUser["is_following"] ? '' : 'hidden'); ?>' data-user-pk='<?php muoEcho($focusedUser["user_pk"]); ?>'>
				<?php muoEcho($translations['unfollow']) ?>
			</button>
		<?php endif; ?>
	</section>
	<section id='sectionUserData'>
		<h2 id='h2UserNameBanner'>
			<?php muoEcho($focusedUser["user_name"]); ?>
		</h2>
		<p id='pUserHandleBanner'>
			@<?php muoEcho($focusedUser["user_handle"]); ?>
		</p>
		<p id='pUserBioBanner'>
			<?php
			if (isset($focusedUser["user_bio"]) && !empty($focusedUser["user_bio"])) {
				muoEcho($focusedUser["user_bio"]);
			} else {
				muoEcho($translations['no_bio_set']);
			}
			?>
		</p>
		<section id='sectionUserFollowingBanner'>
			<a class='aFollowCountBanner' href="/user/<?php muoEcho($focusedUser["user_handle"]); ?>/following">
				<span>
					<?php muoEcho($focusedUser["following_count"]); ?>
				</span>
				<?php muoEcho($translations['following']); ?>
			</a>
			<a class='aFollowCountBanner' href="/user/<?php muoEcho($focusedUser["user_handle"]); ?>/followers">
				<span>
					<?php muoEcho($focusedUser["followers_count"]); ?>
				</span>
				<?php muoEcho($translations['followers']); ?>
			</a>
		</section>

	</section>
</section>