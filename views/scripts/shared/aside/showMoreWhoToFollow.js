const btnShowMoreWhoToFollow = document.getElementById('btnShowMoreWhoToFollow');

btnShowMoreWhoToFollow && btnShowMoreWhoToFollow.addEventListener('click', async function () {

	const sectionWhoToFollow = document.getElementById('sectionWhoToFollow');
	const sectionWhoToFollowHeader = sectionWhoToFollow.querySelector('header');

	try {

		const response = await fetch(`/api/get-who-to-follow?page=${btnShowMoreWhoToFollow.dataset.nextPage}`, {
			method: 'GET'
		});

		if (!response.ok) {
			throw new Error(`HTTP ${response.status}: ${response.statusText}`);
		}

		const data = await response.json();

		const template = document.getElementById('templateUserToFollow');
		const fragment = document.createDocumentFragment();

		data.data.forEach(user => {

			const article = template.content.cloneNode(true);

			if (!user.user_avatar) {
				article.querySelector('.imgPersonToFollowAvatar').src = `https://ui-avatars.com/api/?name=${encodeURIComponent(user.user_name)}&background=random`;
			} else {
				article.querySelector('.imgPersonToFollowAvatar').src = `/uploads/avatars/${user.user_avatar}`;
			}

			article.querySelector('.imgPersonToFollowAvatar').alt = `Avatar of ${user.user_name}`;
			article.querySelector('.aPersonToFollowFullName').href = `/user/${user.user_handle}`;
			article.querySelector('.aPersonToFollowFullName').textContent = user.user_name;
			article.querySelector('.pPersonToFollowHandle').textContent = `@${user.user_handle}`;
			article.querySelector('.btnFollow').dataset.userPk = user.user_pk;
			article.querySelector('.btnUnfollow').dataset.userPk = user.user_pk;

			fragment.appendChild(article);
		});

		sectionWhoToFollow.insertBefore(fragment, btnShowMoreWhoToFollow);

		import('../followUser.js').then(module => {
			module.setupFollowButtons();
		});

		import('../unfollowUser.js').then(module => {
			module.setupUnfollowButtons();
		});

		if (data.last_page) {
			btnShowMoreWhoToFollow.classList.add('hidden');
			const btnShowLessWhoToFollow = document.getElementById('btnShowLessWhoToFollow');
			btnShowLessWhoToFollow.classList.remove('hidden');
		} else {
			btnShowMoreWhoToFollow.dataset.nextPage = parseInt(btnShowMoreWhoToFollow.dataset.nextPage) + 1;
		}

	} catch (error) {
		console.error('An error occurred while fetching more who to follow:', error);
		sectionWhoToFollow.innerHTML = sectionWhoToFollowHeader.outerHTML + `
			<p>An error occurred while loading more suggestions.</p>
		`
	}

});