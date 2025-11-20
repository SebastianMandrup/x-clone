import { showToast } from './toasts.js';

document.querySelectorAll('.btnFollow').forEach(button => {
	button.addEventListener('click', async (event) => {
		const userToFollowPk = button.getAttribute('data-user-pk');
		try {

			const formData = new FormData();
			formData.append('userToFollowPk', userToFollowPk);

			const response = await fetch('/api/follow-user', {
				method: 'POST',
				body: formData
			});

			const data = await response.json();

			if (data.status === 'success') {
				event.target.classList.add('hidden');
				event.target.nextElementSibling.classList.remove('hidden');
			} else {
				showToast(data.message || 'An error occurred while trying to follow the user.', 'error');
			}
		} catch (error) {
			showToast('An unexpected error occurred.', 'error');
			console.error(error);
		}
	});
});
