import { showToast } from "./toasts.js";

const buttons = document.querySelectorAll('.buttonMoreOptionDeletePost');

function addDeleteListener(button) {

	button.addEventListener('click', async event => {
		event.stopPropagation();


		try {
			const postPk = button.closest('.articlePost').dataset.postPk;

			const formData = new FormData();
			formData.append('postPk', postPk);

			const response = await fetch('/api/delete-post', {
				method: 'POST',
				body: formData
			});

			const data = await response.json();

			if (data.status === 'success') {
				showToast(data.message, 'success');
				button.closest('.articlePost').remove();
			}
		} catch (error) {
			console.error('Error deleting post:', error);
			showToast('An error occurred while deleting the post.', 'error');
		}

	})
}

if (buttons) {
	buttons.forEach(addDeleteListener);
}

export { addDeleteListener };

