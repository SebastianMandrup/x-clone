import { showToast } from './toasts.js';

document.querySelectorAll('.btnUnfollow').forEach(button => {
	button.addEventListener('click', async (event) => {
		const userToUnfollowPk = button.getAttribute('data-user-pk');
		try {

			const formData = new FormData();
			formData.append('userToUnfollowPk', userToUnfollowPk);
			const response = await fetch('/api/unfollow-user', {
				method: 'POST',
				body: formData
			});

			const data = await response.json();
			if (data.status === 'success') {

				event.target.classList.add('hidden');
				event.target.previousElementSibling.classList.remove('hidden');

			} else {
				showToast(data.message || 'An error occurred while trying to follow the user.', 'error');
			}
		} catch (error) {
			showToast('An unexpected error occurred.', 'error');
			console.error(error);
		}
	});
});
