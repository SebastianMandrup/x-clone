import { showToast } from '../shared/toasts.js';

const form = document.getElementById('formCreateComment');
const sectionComments = document.getElementById('sectionComments');
const commentCount = document.getElementById('spanFeaturedPostCommentCount');
const commentCountLabel = document.getElementById('spanFeaturedPostCommentLabel');
const commentTemplate = document.getElementById('templateComment');

form.addEventListener('submit', async function submitComment(event) {
	event.preventDefault();
	const formdata = new FormData(event.target);
	const response = await fetch('/api/add-comment', {
		method: 'POST',
		body: formdata
	});

	if (response.ok) {
		showToast('Comment added successfully!', 'success');
		form.reset();

		commentCount.textContent = parseInt(commentCount.textContent) + 1;
		if (commentCount.textContent === '1') {
			commentCountLabel.textContent = 'Comment';
		} else {
			commentCountLabel.textContent = 'Comments';
		}

		const clone = commentTemplate.content.cloneNode(true);
		clone.querySelector('.imgCommentAuthorAvatar').src = document.getElementById('imgCreateCommentAvatar').src;
		clone.querySelector('.imgCommentAuthorAvatar').alt = document.getElementById('imgCreateCommentAvatar').alt;

		clone.querySelector('.aCommentAuthorName').textContent = document.getElementById('spanUserFullName').textContent;
		const userHandle = document.getElementById('spanUserHandle').textContent.replace('@', '');
		clone.querySelector('.aCommentAuthorName').href = `/profile/${userHandle}`;
		clone.querySelector('.pCommentAuthorHandle').textContent = document.getElementById('spanUserHandle').textContent;

		clone.querySelector('.pCommentCreatedAt').textContent = 'Just now';

		clone.querySelector('.pCommentContent').textContent = formdata.get('comment_content');
		sectionComments.prepend(clone);


	} else {
		const errorData = await response.json();
		showToast(errorData.message || 'An error occurred while adding your comment.', 'error');
	}
});