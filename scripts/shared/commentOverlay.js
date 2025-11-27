import { showToast } from './toasts.js';

const overlay = document.getElementById('divAddCommentOverlay');

document.getElementById('btnCloseCommentOverlay').addEventListener('click', function () {
	overlay.classList.add('hidden');
	document.body.classList.remove('modalOpen');
});

document.getElementById('divAddCommentOverlay').addEventListener('click', (event) => {
	if (event.target === overlay) {
		overlay.classList.add('hidden');
		document.body.classList.remove('modalOpen');
	}
});

function setupCommentOverlays() {
	document.querySelectorAll('.buttonPostActionComment').forEach(button => {
		button.addEventListener('click', function (event) {
			event.stopPropagation();

			const article = this.closest('.articlePost');
			const commentCount = article.querySelector('.spanPostActionCount');
			const imgAvatar = article.querySelector('.imgPostAvatar');
			const userName = article.querySelector('.aPostUserFullName').textContent.trim();
			const userHandle = article.querySelector('.pPostUserHandle').textContent.trim();
			const postTime = article.querySelector('.pPostTime').textContent.trim();
			const postContent = article.querySelector('.pPostContent').textContent.trim();

			overlay.classList.remove('hidden');
			document.body.classList.add('modalOpen');

			overlay.querySelector('#imgOriginalPostAvatar').src = imgAvatar.src;
			overlay.querySelector('#spanOriginalPostUserName').textContent = userName;
			overlay.querySelector('#spanOriginalPostUserHandle').textContent = userHandle;
			overlay.querySelector('#spanOriginalPostTime').textContent = postTime;
			overlay.querySelector('#pOriginalPostContent').textContent = postContent;

			const postPk = this.closest('.articlePost').dataset.postPk;
			const form = overlay.querySelector('#formAddComment');

			form.addEventListener('submit', async function submitComment(event) {
				event.preventDefault();
				const formdata = new FormData(form);
				formdata.append('postPk', postPk);
				const response = await fetch('/api/add-comment', {
					method: 'POST',
					body: formdata
				});

				if (response.ok) {
					showToast('Comment added successfully!', 'success');
					overlay.classList.add('hidden');
					document.body.classList.remove('modalOpen');
					form.reset();
					const count = parseInt(commentCount.textContent.trim());
					commentCount.textContent = count + 1;
				} else {
					const errorData = await response.json();
					showToast(errorData.message || 'An error occurred while adding your comment.', 'error');
				}
			});

		});
	})
}
setupCommentOverlays();
export { setupCommentOverlays };
