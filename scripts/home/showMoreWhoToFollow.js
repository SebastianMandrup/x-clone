const btnShowMoreWhoToFollow = document.getElementById('btnShowMoreWhoToFollow');

btnShowMoreWhoToFollow.addEventListener('click', async function () {

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
				<div class="divPersonToFollowNames">
					<span class='spanPersonToFollowFullName'>
						${user.user_name}
					</span>
					<span class='spanPersonToFollowUserName'>
						@${user.user_handle}
					</span>
				</div>
				<button class='btnFollow'>Follow</button>
			`;
			sectionWhoToFollow.insertBefore(articlePersonToFollow, btnShowMoreWhoToFollow);
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