const btnShowLessTrends = document.getElementById('btnShowLessTrends');

btnShowLessTrends.addEventListener('click', function () {

	const sectionWhatsHappening = document.getElementById('sectionWhatsHappening');

	const header = sectionWhatsHappening.querySelector('header');
	const firstThreeArticles = sectionWhatsHappening.querySelectorAll('.articleTrendItem:nth-of-type(-n+3)');
	const btnShowMoreTrends = document.getElementById('btnShowMoreTrends');

	sectionWhatsHappening.innerHTML = '';
	sectionWhatsHappening.appendChild(header);
	firstThreeArticles.forEach(article => {
		sectionWhatsHappening.appendChild(article);
	});
	btnShowMoreTrends.classList.remove('hidden');
	btnShowLessTrends.classList.add('hidden');
	btnShowMoreTrends.dataset.nextPage = 2;
	sectionWhatsHappening.appendChild(btnShowMoreTrends);
	sectionWhatsHappening.appendChild(btnShowLessTrends);
});