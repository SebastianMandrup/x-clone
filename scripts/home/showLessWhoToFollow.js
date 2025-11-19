const btnShowLessWhoToFollow = document.getElementById('btnShowLessWhoToFollow');

btnShowLessWhoToFollow.addEventListener('click', function () {
	const sectionWhoToFollow = document.getElementById('sectionWhoToFollow');

	const header = sectionWhoToFollow.querySelector('header');
	const firstThreePersons = sectionWhoToFollow.querySelectorAll('.articlePersonToFollow:nth-of-type(-n+3)');
	const btnShowMoreWhoToFollow = document.getElementById('btnShowMoreWhoToFollow');

	sectionWhoToFollow.innerHTML = '';
	sectionWhoToFollow.appendChild(header);
	firstThreePersons.forEach(person => {
		sectionWhoToFollow.appendChild(person);
	});
	btnShowMoreWhoToFollow.classList.remove('hidden');
	btnShowLessWhoToFollow.classList.add('hidden');
	btnShowMoreWhoToFollow.dataset.nextPage = 2;
	sectionWhoToFollow.appendChild(btnShowMoreWhoToFollow);
	sectionWhoToFollow.appendChild(btnShowLessWhoToFollow);
});