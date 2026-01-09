const replyOverlay = document.getElementById('divReplyOverlay');
const replyButtons = document.querySelectorAll('.btnReplyComment');

const addReplyListener = btn => {
	btn.addEventListener('click', event => {
		replyOverlay.classList.remove('hidden');

		const article = btn.closest('.articleComment');
		const commentPk = article.getAttribute('data-comment-pk');
		const imgSrc = article.querySelector('.imgCommentAuthorAvatar').getAttribute('src');
		const username = article.querySelector('.aCommentAuthorName').innerText;
		const handle = article.querySelector('.pCommentAuthorHandle').innerText;
		const time = article.querySelector('.pCommentCreatedAt').innerText;
		const content = article.querySelector('.pCommentContent').innerText;

		replyOverlay.querySelector('#inputReplyCommentPk').value = commentPk;
		replyOverlay.querySelector('#imgReplyToAvatar').setAttribute('src', imgSrc);
		replyOverlay.querySelector('#imgReplyToAvatar').setAttribute('alt', 'Avatar of ' + username);

		replyOverlay.querySelector('#pReplyToUsername').innerText = username;
		replyOverlay.querySelector('#pReplyToHandle').innerText = handle;
		replyOverlay.querySelector('#pReplyToTime').innerText = time;
		replyOverlay.querySelector('#pReplyToContent').innerText = content;

	});
};

document.getElementById('formReplyToPost').addEventListener('submit', async event => {
	event.preventDefault();
	const btnSubmit = replyOverlay.querySelector('#btnSubmitReply');
	btnSubmit.disabled = true;
	btnSubmit.innerText = 'Replying...';

	const formData = new FormData(event.target);

	try {

		const response = await fetch('/api/add-comment-reply', {
			method: 'POST',
			body: formData
		});

		const data = await response.json();

		if (data.status === 'success') {

			const commentPk = formData.get('comment_pk');
			const articleComment = document.querySelector(`.articleComment[data-comment-pk='${commentPk}']`);
			const sectionCommentReplies = articleComment.querySelector('.sectionCommentReplies');
			const replyButton = articleComment.querySelector('.btnReplyComment');
			const commentRepliesHeader = sectionCommentReplies.querySelector('.pCommentRepliesHeader');

			let currentCount = 0;
			if (commentRepliesHeader.innerText.trim() === '' || commentRepliesHeader.innerText.includes('No replies yet')) {
				commentRepliesHeader.innerText = '1 Reply';
			} else {
				currentCount = parseInt(commentRepliesHeader.innerText);
				commentRepliesHeader.innerText = (currentCount + 1) + ' Replies';
			}

			replyButton.classList.add('triggered');
			replyButton.querySelector('.spanCommentActionCount').innerText = currentCount + 1;

			const template = document.getElementById('templateCommentReply');
			const article = template.content.cloneNode(true);

			const userImg = document.getElementById('imgUserAvatar').getAttribute('src');
			const userName = document.getElementById('spanUserFullName').innerText.trim();
			const userHandle = document.getElementById('spanUserHandle').innerText.trim();

			article.querySelector('.imgCommentReplyAvatar').setAttribute('src', userImg);
			article.querySelector('.imgCommentReplyAvatar').setAttribute('alt', 'Avatar of ' + userName);
			article.querySelector('.aCommentReplyName').innerText = userName;
			article.querySelector('.aCommentReplyName').href = '/users/' + userHandle;
			article.querySelector('.pCommentReplyHandle').innerText = userHandle;
			article.querySelector('.divCommentReplyBody > p').innerText = formData.get('comment_reply_content');

			sectionCommentReplies.append(article);

			btnSubmit.disabled = false;
			btnSubmit.innerText = 'Reply';
			replyOverlay.classList.add('hidden');
			event.target.reset();
		}

	} catch (error) {
		console.error('Error submitting reply:', error);
	}

});

document.getElementById('btnCloseReplyOverlay').addEventListener('click', event => {
	replyOverlay.classList.add('hidden');
});

replyOverlay.addEventListener('click', event => {
	if (event.target === replyOverlay) {
		replyOverlay.classList.add('hidden');
	}
});

replyButtons.forEach(btn => {
	addReplyListener(btn);
});
export { addReplyListener };

