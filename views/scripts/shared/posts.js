const articlePosts = document.querySelectorAll('.articlePost');

function addPostNavigation(article) {
	article.addEventListener('click', (event) => {
		if (event.target.closest('section')) {
			return;
		}

		const authorHandle = article.getAttribute('data-author-handle');;
		const postPk = article.getAttribute('data-post-pk');
		window.location.href = `/user/${authorHandle}/posts/${postPk}`;

	});
}

articlePosts.forEach(addPostNavigation);
export { addPostNavigation };
