const btnShowMoreTrends = document.getElementById('btnShowMoreTrends');

btnShowMoreTrends.addEventListener('click', async function () {

	const sectionWhatsHappening = document.getElementById('sectionWhatsHappening');
	const sectionWhatsHappeningHeader = sectionWhatsHappening.querySelector('header');

	try {
		const response = await fetch(`/api/get-topics?page=${btnShowMoreTrends.dataset.nextPage}`, {
			method: 'GET'
		});

		if (!response.ok) {
			throw new Error(`HTTP ${response.status}: ${response.statusText}`);
		}

		const data = await response.json();

		const template = document.getElementById('templateTrendItem');
		const fragment = document.createDocumentFragment();

		data.data.forEach(trend => {
			const articleTrendItem = template.content.cloneNode(true);
			articleTrendItem.querySelector('.pTrendItemField').textContent = trend.topic_field;
			articleTrendItem.querySelector('.h2TrendItemName').textContent = trend.topic_name;
			articleTrendItem.querySelector('.pTrendItemCount').textContent = `${trend.topic_count} Posts`;
			fragment.appendChild(articleTrendItem);
		});

		sectionWhatsHappening.insertBefore(fragment, btnShowMoreTrends);

		if (data.last_page) {
			btnShowMoreTrends.classList.add('hidden');
			const btnShowLessTrends = document.getElementById('btnShowLessTrends');
			btnShowLessTrends.classList.remove('hidden');
		} else {
			btnShowMoreTrends.dataset.nextPage = parseInt(btnShowMoreTrends.dataset.nextPage) + 1;
		}

	} catch (error) {
		console.error('An error occurred while fetching more trends:', error);
		sectionWhatsHappening.innerHTML = sectionWhatsHappeningHeader.outerHTML + `
			<p>An error occurred while loading more trends.</p>
		`;
	}
});