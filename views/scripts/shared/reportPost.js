import { showToast } from "./toasts.js";

const buttons = document.querySelectorAll('.buttonMoreOptionReportPost');

function addReportListener(button) {

	button.addEventListener('click', async event => {
		event.stopPropagation();


		try {
			const postPk = button.closest('.articlePost').dataset.postPk;

			const formData = new FormData();
			formData.append('postPk', postPk);

			const response = await fetch('/api/report-post', {
				method: 'POST',
				body: formData
			});

			const data = await response.json();

			if (data.status === 'success') {
				showToast(data.message, 'success');
			}

			button.closest('.divMoreOptionsToolTip').classList.add('hidden');

		} catch (error) {
			console.error('Error reporting post:', error);
			showToast('An error occurred while reporting the post.', 'error');
		}

	})
}

if (buttons) {
	buttons.forEach(addReportListener);
}

export { addReportListener };

