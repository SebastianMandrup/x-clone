document.querySelectorAll('.btnLikeComment').forEach(button => {
	button.addEventListener('click', async function (event) {

		event.stopPropagation();

		const article = this.closest('.articleComment');
		const countElement = article.querySelector('.spanCommentActionCount');

		const formdata = new FormData();
		formdata.append('commentPk', article.dataset.commentPk);

		try {

			const response = await fetch('/api/like-comment', {
				method: 'POST',
				body: formdata
			});

			const data = await response.json();

			if (!response.ok) {
				throw new Error(data.message || 'Failed to like comment');
			}

			this.classList.toggle('triggered');

			const count = parseInt(countElement.textContent.trim());
			const newCount = this.classList.contains('triggered') ? count - 1 : count + 1;
			countElement.textContent = newCount;


		} catch (error) {
			console.error('Error liking comment:', error);
		}
	});
});