document.querySelectorAll('.articlePost').forEach(article => {
	article.addEventListener('click', (event) => {
		if (event.target.closest('section')) {
			return;
		}
		const authorHandle = article.getAttribute('data-author-handle');
		const postPk = article.getAttribute('data-post-pk');
		window.location.href = `/${authorHandle}/posts/${postPk}`;
	});
});