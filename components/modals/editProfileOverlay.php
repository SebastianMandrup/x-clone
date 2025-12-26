<div id='divEditProfileOverlay' class='hidden'>
	<section id='sectionEditProfile'>
		<form id='formEditProfile' method='post' action='/bridges/edit-profile' enctype='multipart/form-data'>

			<header id='headerEditProfile'>
				<div id='divEditProfileHeaderLeft'>
					<button id='btnCloseEditProfileOverlay' type='button' aria-label='Close Edit Profile'>
						&times;
					</button>
					<h2>
						<?php muoEcho($translations['edit_profile']); ?>
					</h2>
				</div>
				<button id='btnSaveProfileChanges' type='submit'>
					<?php muoEcho($translations['save']); ?>
				</button>
			</header>

			<div id='divEditProfileContent'>
				<section id='sectionEditProfileBanner'>
					<?php if (isset($focusedUser['user_banner'])) : ?>
						<img id='imgEditProfileBanner' src="/uploads/banners/<?php muoEcho($focusedUser['user_banner']); ?>" alt="Profile Banner" />
					<?php endif; ?>
					<input type='file' name='profile_banner' id='inputEditProfileBanner' accept='image/*' />
					<label for="inputEditProfileBanner" id='labelEditProfileBannerUpload' title='<?php muoEcho($translations['add_photo']); ?>'>
						<?php require __DIR__ . '/../icons/camera-icon.php'; ?>
					</label>
				</section>

				<section id='sectionEditProfileAvatar'>
					<?php require_once __DIR__ . '/../../services/get-user-avatar.php'; ?>
					<img id='imgEditProfileAvatar' src="<?php muoEcho(getUserAvatar($focusedUser)); ?>"
						alt="Avatar" />
					<input id='inputEditProfileAvatar' type='file' name='profile_avatar' accept='image/*' />
					<label id='labelEditProfileAvatarUpload' for='inputEditProfileAvatar' title='<?php muoEcho($translations['add_photo']); ?>'>
						<?php require __DIR__ . '/../icons/camera-icon.php'; ?>
					</label>
				</section>

				<section id='sectionEditProfileFields'>
					<label for='inputEditProfileName'>
						<?php muoEcho($translations['name']); ?>
						<input type='text' name='name' id='inputEditProfileName' maxlength='50' value="<?php muoEcho($focusedUser['user_name']); ?>" required>
					</label>

					<label for='inputEditProfileBio'>
						<?php muoEcho($translations['bio']); ?>
						<textarea name='bio' id='inputEditProfileBio' maxlength='255'><?php if (isset($focusedUser['user_bio'])) {
																							muoEcho($focusedUser['user_bio']);
																						} ?></textarea>
					</label>

					<label for='inputEditProfileLocation'>
						<?php muoEcho($translations['location']); ?>
						<input type='text' name='location' id='inputEditProfileLocation' maxlength='30' value="<?php if (isset($focusedUser['user_location'])) {
																													muoEcho($focusedUser['user_location']);
																												} ?>" />
					</label>

					<label for='inputEditProfileWebsite'>
						<?php muoEcho($translations['website']); ?>
						<input type='url' name='website' id='inputEditProfileWebsite' maxlength='100' value="<?php if (isset($focusedUser['user_website'])) {
																													muoEcho($focusedUser['user_website']);
																												} ?>" />
					</label>

					<label for='inputEditProfileBirthdate'>
						<?php muoEcho($translations['birthdate']); ?>
						<input type='date' name='birthdate' onfocus="this.showPicker()" id='inputEditProfileBirthdate' value="<?php if (isset($focusedUser['user_birthday'])) {
																																	muoEcho($focusedUser['user_birthday']);
																																} ?>" />
					</label>
				</section>
			</div>
		</form>
	</section>
</div>