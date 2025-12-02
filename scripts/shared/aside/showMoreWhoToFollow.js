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

		data.data.forEach(user => {
			const articlePersonToFollow = document.createElement('article');
			articlePersonToFollow.classList.add('articlePersonToFollow');
			articlePersonToFollow.innerHTML = `
				<img src="https://ui-avatars.com/api/?name=${encodeURIComponent(user.user_name)}&background=random" class='imgPersonToFollowAvatar' alt="Avatar of ${user.user_name}" />
				<section class="sectionPersonToFollowNames">
					<a class='aPersonToFollowFullName' href='/${user.user_handle}'>
						${user.user_name}
					</a>
					<p class='pPersonToFollowHandle'>
						@${user.user_handle}
					</p>
				</section>
				<button class='btnFollow' data-user-pk='${user.user_pk}'>
					Follow
				</button>
				<button class="btnUnfollow hidden" data-user-pk="${user.user_pk}">Unfollow</button>
			`;
			sectionWhoToFollow.insertBefore(articlePersonToFollow, btnShowMoreWhoToFollow);
		});

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