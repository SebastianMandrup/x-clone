const divPostsForYou = document.getElementById('divPostsForYou');
const divPostsFollowing = document.getElementById('divPostsFollowing');

const fetchNextPageOfPosts = async (page) => {
	try {
		let url;

		if (divPostsForYou) {
			page = divPostsForYou.getAttribute('data-page');
			url = '/api/get-posts?page=' + (parseInt(page) + 1);
		} else if (divPostsFollowing) {
			page = divPostsFollowing.getAttribute('data-page');
			url = '/api/get-posts-following?page=' + (parseInt(page) + 1);
		}

		if (!url) {
			throw new Error('No valid posts section found.');
		}

		const response = await fetch(url, {
			method: 'GET',
		});

		const json = await response.json();
		return json;

	} catch (error) {
		console.error('Error fetching posts:', error);
	}
};

let isLoading = false;

function getDocumentHeight() {
	return Math.max(
		document.body.scrollHeight,
		document.body.offsetHeight,
		document.documentElement.clientHeight,
		document.documentElement.scrollHeight,
		document.documentElement.offsetHeight
	);
}

window.onscroll = async function () {

	const docHeight = getDocumentHeight();
	if (docHeight <= window.innerHeight) {
		return;
	}

	const threshold = 100;
	const currentPosition = window.innerHeight + window.scrollY;
	const triggerPosition = docHeight - threshold;

	if (currentPosition < triggerPosition) {
		return;
	}

	let page;

	if (divPostsForYou) {
		page = divPostsForYou.getAttribute('data-page');
	} else if (divPostsFollowing) {
		page = divPostsFollowing.getAttribute('data-page');
	}

	if (isLoading || !page) {
		return;
	}

	isLoading = true;

	
	const loader = document.querySelector('.circle-loader');
	if (loader) loader.classList.remove('hidden');

	try {
		const response = await fetchNextPageOfPosts(page);

		if (!response) {
			isLoading = false;
			if (loader) loader.classList.add('hidden');
			return;
		}

		if (response.last_page === true) {
			// Remove scroll event listener when no more pages
			window.onscroll = null;
			if (loader) loader.classList.add('hidden');
			return;
		}

		const posts = response.data;

		// Import modules once instead of for each post
		const modules = await Promise.all([
			import('./likePost.js'),
			import('./commentOverlay.js'),
			import('./sharePost.js'),
			import('./posts.js'),
			import('./modals/analytics.js'),
			import('./bookmarkPost.js')
		]);

		const [
			likeModule,
			commentModule,
			shareModule,
			postsModule,
			analyticsModule,
			bookmarkModule
		] = modules;

		let repostModule = null;
		if (posts.some(post => !post.ref_post_pk)) {
			repostModule = await import('./repost.js');
		}

		posts.forEach(post => {
			const articleFragment = document.getElementById('templatePost').content.cloneNode(true);
			const article = articleFragment.querySelector('.articlePost');

			article.dataset.postPk = post.post_pk;
			article.dataset.authorHandle = post.user_handle;

			if (!post.ref_post_pk) {
				article.querySelector('.sectionRepost').remove();
			} else {
				const repost = article.querySelector('.sectionRepost');

				if (!post.ref_user_avatar) {
					repost.querySelector('.imgRepostAvatar').src = 'https://ui-avatars.com/api/?name=' + encodeURIComponent(post.ref_user_name) + '&background=random';
				} else {
					repost.querySelector('.imgRepostAvatar').src = '/uploads/avatars/' + post.ref_user_avatar;
				}

				repost.querySelector('.aPostUserFullName').href = '/' + post.ref_user_handle;
				repost.querySelector('.aPostUserFullName').textContent = post.ref_user_name;
				repost.querySelector('.pPostUserHandle').textContent = '@' + post.ref_user_handle;

				// Change unix timestamp to readable date
				const now = Math.floor(Date.now() / 1000);
				const diff = now - post.ref_post_created_at;
				if (diff < 60) {
					repost.querySelector('.pPostTime').textContent = diff + 's';
				} else if (diff < 3600) {
					repost.querySelector('.pPostTime').textContent = Math.floor(diff / 60) + 'm';
				} else if (diff < 86400) {
					repost.querySelector('.pPostTime').textContent = Math.floor(diff / 3600) + 'h';
				} else {
					let postDate = new Date(post.ref_post_created_at * 1000);
					repost.querySelector('.pPostTime').textContent = postDate.toDateString();
				}

				repost.querySelector('.pRepostContent').textContent = post.ref_post_content;
				if (post.ref_post_image) {
					repost.querySelector('.sectionRepostPicture img').src = '/uploads/posts/' + post.ref_post_image;
				} else {
					repost.querySelector('.sectionRepostPicture').remove();
				}
			}

			if (!post.post_image) {
				article.querySelector('.sectionPostPicture').remove();
			} else {
				article.querySelector('.sectionPostPicture img').src = '/uploads/posts/' + post.post_image;
			}

			if (!post.user_avatar) {
				article.querySelector('.imgPostAvatar').src = 'https://ui-avatars.com/api/?name=' + encodeURIComponent(post.user_name) + '&background=random';
			} else {
				article.querySelector('.imgPostAvatar').src = '/uploads/avatars/' + post.user_avatar;
			}

			article.querySelector('.aPostUserFullName').href = '/user/' + post.user_handle;
			article.querySelector('.aPostUserFullName').textContent = post.user_name;
			article.querySelector('.pPostUserHandle').textContent = '@' + post.user_handle;

			// Change unix timestamp to readable date
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

			// Footer actions
			article.querySelector('.spanPostActionCommentCount').innerText = post.comment_count;

			if (post.commented_by_user) {
				article.querySelector('.buttonPostActionComment').classList.add('triggered');
			}

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

			if (post.bookmarked_by_user) {
				article.querySelector('.btnBookmarkPost').classList.add('triggered');
			}

			// Add event listeners using imported modules
			likeModule.addLikeListener(article.querySelector('.buttonPostActionLike'));
			commentModule.addCommentListener(article.querySelector('.buttonPostActionComment'));

			if (article.querySelector('.buttonPostActionRepost') && repostModule) {
				repostModule.addRepostListener(article.querySelector('.buttonPostActionRepost'));
			}

			shareModule.addShareListener(article.querySelector('.btnSharePost'));
			postsModule.addPostNavigation(article);
			analyticsModule.addAnalyticsListener(article.querySelector('.buttonPostActionAnalytics'));
			bookmarkModule.addBookmarkListener(article.querySelector('.btnBookmarkPost'));

			// Append to the correct section
			if (divPostsForYou) {
				divPostsForYou.appendChild(articleFragment);
			} else if (divPostsFollowing) {
				divPostsFollowing.appendChild(articleFragment);
			}
		});

		// Update page number
		if (divPostsForYou) {
			divPostsForYou.setAttribute('data-page', parseInt(page) + 1);
		} else if (divPostsFollowing) {
			divPostsFollowing.setAttribute('data-page', parseInt(page) + 1);
		}

	} catch (error) {
		console.error('Error loading more posts:', error);
	} finally {
		isLoading = false;
		const loader = document.querySelector('.circle-loader');
		if (loader) loader.classList.add('hidden');
	}
};