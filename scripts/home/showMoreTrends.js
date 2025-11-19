const btnShowMoreTrends = document.getElementById('btnShowMoreTrends');

btnShowMoreTrends.addEventListener('click', async function () {

	const sectionWhatsHappening = document.getElementById('sectionWhatsHappening');

	try {
		const response = await fetch(`/api/get-trends?page=${btnShowMoreTrends.dataset.nextPage}`, {
			method: 'GET'
		});

		const data = await response.json();

		if (response.ok) {
			data.data.forEach(trend => {
				const articleTrendItem = document.createElement('article');
				articleTrendItem.classList.add('articleTrendItem');
				articleTrendItem.innerHTML = `
					<div class="divTrendItemText">
						<p>${trend.topic_field}</p>
						<h2>${trend.topic_name}</h2>
						<p>${trend.topic_count} Posts</p>
					</div>
					<button>
						...
					</button>
				`;
				sectionWhatsHappening.insertBefore(articleTrendItem, btnShowMoreTrends);
			});

			if (data.last_page) {
				btnShowMoreTrends.classList.add('hidden');
				const btnShowLessTrends = document.getElementById('btnShowLessTrends');
				btnShowLessTrends.classList.remove('hidden');
			} else {
				btnShowMoreTrends.dataset.nextPage = parseInt(btnShowMoreTrends.dataset.nextPage) + 1;
			}

		}
	} catch (error) {
		console.error('An error occurred while fetching more trends:', error);
	}
});