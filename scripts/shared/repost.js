import { showToast } from './toasts.js';

document.querySelectorAll('.buttonPostActionRepost').forEach(section => {
	section.addEventListener('click', async function (event) {

		const article = this.closest('.articlePost');
		const countElement = this.querySelector('.spanPostActionCount');

		const formdata = new FormData();
		formdata.append('referencePostPk', article.dataset.postPk);

		const response = await fetch('/api/repost', {
			method: 'POST',
			body: formdata
		});

		if (response.ok) {
			this.classList.add('triggered');
			const count = parseInt(countElement.textContent.trim());
			const newCount = count + 1;
			countElement.textContent = newCount;
		} else {
			const errorData = await response.json();
			showToast(errorData.message || 'An error occurred while processing your request.', 'error');
		}

	});
});