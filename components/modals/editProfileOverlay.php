<div id='divEditProfileOverlay' class='hidden'>
	<section id='sectionEditProfile'>
		<form id='formEditProfile' method='post' action='/bridges/edit-profile'>

			<header id='headerEditProfile'>
				<div id='divEditProfileHeaderLeft'>
					<button id='btnCloseEditProfileOverlay' type='button' aria-label='Close Edit Profile'>
						&times;
					</button>
					<h2>Edit Profile</h2>
				</div>
				<button id='btnSaveProfileChanges' type='submit'>
					Save
				</button>
			</header>

			<div id='divEditProfileContent'>
				<section id='sectionEditProfileBanner'>
					<?php if ($user['user_banner']) : ?>
						<img id='imgEditProfileBanner' src="<?php muoEcho($user['user_banner']); ?>" alt="Profile Banner" />
					<?php endif; ?>
					<input type='file' name='profile_banner' id='inputEditProfileBanner' accept='image/*' />
					<label for="inputEditProfileBanner" id='labelEditProfileBannerUpload' title='Add Photo'>
						<svg class="svgIcon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
							<rect x="2" y="5" width="20" height="14" rx="2" fill="none" stroke="currentColor" stroke-width="2" />
							<circle cx="12" cy="12" r="4" fill="none" stroke="currentColor" stroke-width="2" />
							<path d="M16 6V4M8 6V4" stroke="currentColor" stroke-width="2" />
						</svg>
					</label>
				</section>

				<section id='sectionEditProfileAvatar'>
					<img id='imgEditProfileAvatar' src="https://ui-avatars.com/api/?name=<?php muoEcho(($user['user_name'])); ?>&background=random"
						alt="Avatar" />
					<input id='inputEditProfileAvatar' type='file' name='profile_avatar' accept='image/*' />
					<label id='labelEditProfileAvatarUpload' for='inputEditProfileAvatar' title='Add Photo'>
						<svg class='svgIcon' viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
							<path d="M12 15.5A3.5 3.5 0 1 0 12 8.5a3.5 3.5 0 0 0 0 7z" />
							<path d="M21 6.5h-3.5l-1.5-2h-6l-1.5 2H6a2 2 0 0 0-2 2v9a2 2 0 0 0 2 2h15a2 2 0 0 0 2-2v-9a2 2 0 0 0-2-2z" />
						</svg>
					</label>
				</section>

				<section id='sectionEditProfileFields'>
					<label for='inputEditProfileName'>Name
						<input type='text' name='name' id='inputEditProfileName' maxlength='50' value="<?php muoEcho($user['user_name']); ?>" required>
					</label>

					<label for='inputEditProfileBio'>
						Bio
						<textarea name='bio' id='inputEditProfileBio' maxlength='255'><?php if (isset($user['user_bio'])) {
																							muoEcho($user['user_bio']);
																						} ?></textarea>
					</label>

					<label for='inputEditProfileLocation'>
						Location
						<input type='text' name='location' id='inputEditProfileLocation' maxlength='30' value="<?php if (isset($user['user_location'])) {
																													muoEcho($user['user_location']);
																												} ?>" />
					</label>

					<label for='inputEditProfileWebsite'>
						Website
						<input type='url' name='website' id='inputEditProfileWebsite' maxlength='100' value="<?php if (isset($user['user_website'])) {
																													muoEcho($user['user_website']);
																												} ?>" />
					</label>

					<label for='inputEditProfileBirthdate'>
						Birthdate
						<input type='date' name='birthdate' onfocus="this.showPicker()" id='inputEditProfileBirthdate' value="<?php if (isset($user['user_birthday'])) {
																																	muoEcho($user['user_birthday']);
																																} ?>" />
					</label>
				</section>
			</div>
		</form>
	</section>
</div>