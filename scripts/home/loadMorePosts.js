const divPostsForYou = document.getElementById('divPostsForYou');
const divPostsFollowing = document.getElementById('divPostsFollowing');
let isLoading = false;


// if page is at bottom
window.onscroll = async function () {
	if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {

		if (isLoading) {
			return;
		}

		isLoading = true;

		let url = '';
		let page = 0;
		if (divPostsForYou) {
			page = divPostsForYou.getAttribute('data-page');
			url = '/api/get-posts?page=' + (parseInt(page) + 1);
		} else if (divPostsFollowing) {
			page = divPostsFollowing.getAttribute('data-page');
			url = '/api/get-posts-following?page=' + (parseInt(page) + 1);
		}

		if (!url || !page) {
			console.error('No URL or page found for loading more posts');
			return;
		}

		try {

			const response = await fetch(url, {
				method: 'GET',
			});

			const data = await response.json();

			const posts = data.data;

			if (posts.length === 0) {
				console.log('No more posts to load');
				return;
			}

			console.log('posts', posts);

			posts.forEach(post => {
				if (divPostsForYou) {

					console.log('post', post);

					const articleFragment = document.getElementById('templatePost').content.cloneNode(true);
					const article = articleFragment.querySelector('.articlePost');
					console.log('article', article);

					article.dataset.postPk = post.post_pk;
					article.dataset.authorHandle = post.user_handle;

					if (!post.ref_post_pk) {
						article.querySelector('.sectionRepost').remove();
					} else {
						// TODO: Fill in repost info
					}

					if (!post.post_image) {
						article.querySelector('.sectionPostPicture').remove();
					} else {
						article.querySelector('.sectionPostPicture img').src = post.post_image;
					}

					article.querySelector('.imgPostAvatar').src = 'https://ui-avatars.com/api/?name=' + encodeURIComponent(post.user_name) + '&background=random';
					console.log(article.querySelector('.imgPostAvatar').src);
					article.querySelector('.aPostUserFullName').href = '/' + post.user_handle;
					article.querySelector('.aPostUserFullName').textContent = post.user_name;
					article.querySelector('.pPostUserHandle').textContent = '@' + post.user_handle;

					// change unix timestamp to readable date
					const now = Math.floor(Date.now() / 1000);
					const diff = now - post.post_created_at;
					if (diff < 60) {
						article.querySelector('.pPostTime').textContent = diff + 's';
					} else if (diff < 3600) {
						article.querySelector('.pPostTime').textContent = Math.floor(diff / 60) + 'm';
					} else if (diff < 86400) {
						article.querySelector('.pPostTime').textContent = Math.floor(diff / 3600) + 'h';
					} else {
						let postDate = new Date(post.post_created_at * 1000);
						article.querySelector('.pPostTime').textContent = postDate.toDateString();
					}
					article.querySelector('.pPostContent').textContent = post.post_content;

					article.querySelector('.spanPostActionCommentCount').innerText = post.comment_count;

					if (post.ref_post_pk) {
						article.querySelector('.buttonPostActionRepost').remove();
					} else {
						if (post.reposted_by_user) {
							article.querySelector('.buttonPostActionRepost').classList.add('triggered');
						}
						article.querySelector('.spanPostActionRepostCount').textContent = post.repost_count;
					}

					if (post.liked_by_user) {
						article.querySelector('.buttonPostActionLike').classList.add('triggered');
					} else {
						article.querySelector('.buttonPostActionLike').classList.remove('triggered');
					}

					article.querySelector('.spanPostActionLikeCount').innerText = post.like_count;

					divPostsForYou.appendChild(articleFragment);

					import('../shared/likePost.js').then(module => {
						module.setupLikeButtons();
					});
					import('../shared/commentOverlay.js').then(module => {
						module.setupCommentOverlays();
					});
					import('../shared/repost.js').then(module => {
						module.setupRepostButtons();
					});

				} else if (divPostsFollowing) {
					// TODO
				}
			});



			if (divPostsForYou) {
				divPostsForYou.setAttribute('data-page', parseInt(page) + 1);
			} else if (divPostsFollowing) {
				divPostsFollowing.setAttribute('data-page', parseInt(page) + 1);
			}

			if (data.last_page) {
				console.log('Last page reached, no more posts to load');
				window.onscroll = null; // remove scroll event listener
				this.document.querySelector('.circle-loader').classList.add('hidden');
			}

			isLoading = false;

		} catch (error) {
			console.error('Error loading more posts:', error);
		}
	}
}
