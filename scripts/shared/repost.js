import { showToast } from './toasts.js';

let repostButtonListeners = [];

function setupRepostButtons() {
	// Remove existing listeners
	repostButtonListeners.forEach(({ button, listener }) => {
		button.removeEventListener('click', listener);
	});
	repostButtonListeners = [];

	// Add new listeners
	document.querySelectorAll('.buttonPostActionRepost').forEach(button => {
		const listener = async function (event) {
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
		};

		button.addEventListener('click', listener);
		repostButtonListeners.push({ button, listener });
	});
}

setupRepostButtons();
export { setupRepostButtons };
