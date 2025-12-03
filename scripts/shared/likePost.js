import { showToast } from './toasts.js';

let likeButtonListeners = [];

function setupLikeButtons() {

	likeButtonListeners.forEach(({ button, listener }) => {
		button.removeEventListener('click', listener);
	});

	likeButtonListeners = [];

	document.querySelectorAll('.buttonPostActionLike').forEach(button => {
		const listener = async function (event) {
			event.stopPropagation();

			const article = this.closest('.articlePost');
			const countElement = this.querySelector('.spanPostActionCount');

			const formdata = new FormData();
			formdata.append('postPk', article.dataset.postPk);

			try {
				const response = await fetch('/api/like-post', {
					method: 'POST',
					body: formdata
				});

				const data = await response.json();

				if (!response.ok) {
					throw new Error(data.message || 'Failed to like post');
				}

				this.classList.toggle('triggered');
				const count = parseInt(countElement.textContent.trim());
				const newCount = this.classList.contains('triggered') ? count + 1 : count - 1;
				countElement.textContent = newCount;

			} catch (error) {
				console.error('Error liking post:', error);
				showToast('An error occurred while processing your request.', 'error');
			}
		}

		button.addEventListener('click', listener);
		likeButtonListeners.push({ button, listener });
	});
}

setupLikeButtons();
export { setupLikeButtons };

