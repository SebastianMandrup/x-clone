import { showToast } from './toasts.js';

document.querySelectorAll('.buttonPostActionLike').forEach(section => {
	section.addEventListener('click', async function (event) {

		event.stopPropagation();

		const article = this.closest('.articlePost');
		const countElement = this.querySelector('.spanPostActionCount');

		const formdata = new FormData();
		formdata.append('postPk', article.dataset.postPk);

		const response = await fetch('/api/like-post', {
			method: 'POST',
			body: formdata
		});

		const data = await response.json();

		if (response.ok) {
			this.classList.toggle('triggered');
			const count = parseInt(countElement.textContent.trim());
			const newCount = this.classList.contains('triggered') ? count + 1 : count - 1;
			countElement.textContent = newCount;
		} else {
			const errorData = await response.json();
			showToast(errorData.message || 'An error occurred while processing your request.', 'error');
		}

	});
});