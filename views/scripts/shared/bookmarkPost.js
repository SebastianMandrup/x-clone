import { showToast } from './toasts.js';

const bookmarkButtons = document.querySelectorAll('.btnBookmarkPost');

function addBookmarkListener(button) {

	button.addEventListener('click', async function (event) {
		event.stopPropagation();

		const article = this.closest('.articlePost');

		const formdata = new FormData();
		formdata.append('postPk', article.dataset.postPk);

		try {
			const response = await fetch('/api/bookmark-post', {
				method: 'POST',
				body: formdata
			});

			const data = await response.json();

			if (!response.ok || data.status !== 'success') {
				throw new Error(data.message || 'Failed to like post');
			}

			showToast(data.message, 'success');
			this.classList.toggle('triggered');

		} catch (error) {
			console.error('Error bookmarking post:', error);
			showToast('An error occurred while processing your request.', 'error');
		}
	});
}

bookmarkButtons.forEach(addBookmarkListener);
export { addBookmarkListener };

