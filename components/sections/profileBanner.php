<section id='sectionProfileBanner'>

	<?php if (!$user["user_banner"]) : ?>
		<div id='divDefaultBanner'></div>
	<?php else : ?>
		<img id='imgProfileBanner' src="<?php muoEcho($user["user_banner"]); ?>" alt="Profile Banner Image">
	<?php endif; ?>
	<section id='sectionUserDetails'>
		<img id='imgUserAvatarBanner' src="https://ui-avatars.com/api/?name=<?php muoEcho($user['user_name']); ?>&background=random"
			alt="Avatar">

		<?php if ($user["user_pk"] === $_SESSION["user"]["user_pk"]) : ?>
			<button id='buttonEditProfile'>
				Edit profile
			</button>
		<?php else : ?>
			<button class='btnFollow <?php muoEcho($user["is_following"] ? 'hidden' : ''); ?>' data-user-pk='<?php muoEcho($user["user_pk"]); ?>'>
				Follow
			</button>
			<button class='btnUnfollow <?php muoEcho($user["is_following"] ? '' : 'hidden'); ?>' data-user-pk='<?php muoEcho($user["user_pk"]); ?>'>
				Unfollow
			</button>
		<?php endif; ?>
	</section>
	<section id='sectionUserData'>
		<h2 id='h2UserNameBanner'>
			<?php muoEcho($user["user_name"]); ?>
		</h2>
		<p id='pUserHandleBanner'>
			@<?php muoEcho($user["user_handle"]); ?>
		</p>
		<p id='pUserBioBanner'>
			<?php
			if (isset($user["user_bio"]) && !empty($user["user_bio"])) {
				muoEcho($user["user_bio"]);
			} else {
				muoEcho("This user has not set a bio yet.");
			}
			?>
		</p>
		<section id='sectionUserFollowingBanner'>
			<a class='aFollowCountBanner' href="/user/<?php muoEcho($user["user_handle"]); ?>/following">
				<span>
					<?php muoEcho($user["following_count"]); ?>
				</span>
				Following
			</a>
			<a class='aFollowCountBanner' href="/user/<?php muoEcho($user["user_handle"]); ?>/followers">
				<span>
					<?php muoEcho($user["followers_count"]); ?>
				</span>
				Followers
			</a>
		</section>

	</section>
</section>