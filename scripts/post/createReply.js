const overlay = document.getElementById('divReplyOverlay');
const buttons = document.querySelectorAll('.btnReplyComment');

buttons && buttons.forEach(btn => {
	btn.addEventListener('click', event => {
		overlay.classList.remove('hidden');

		const article = btn.closest('.articleComment');
		const commentPk = article.getAttribute('data-comment-pk');
		const imgSrc = article.querySelector('.imgCommentAuthorAvatar').getAttribute('src');
		const username = article.querySelector('.aCommentAuthorName').innerText;
		const handle = article.querySelector('.pCommentAuthorHandle').innerText;
		const time = article.querySelector('.pCommentCreatedAt').innerText;
		const content = article.querySelector('.pCommentContent').innerText;

		overlay.querySelector('#inputReplyCommentPk').value = commentPk;
		overlay.querySelector('#imgReplyToAvatar').setAttribute('src', imgSrc);
		overlay.querySelector('#imgReplyToAvatar').setAttribute('alt', 'Avatar of ' + username);

		overlay.querySelector('#pReplyToUsername').innerText = username;
		overlay.querySelector('#pReplyToHandle').innerText = handle;
		overlay.querySelector('#pReplyToTime').innerText = time;
		overlay.querySelector('#pReplyToContent').innerText = content;

	});
});

document.getElementById('formReplyToPost').addEventListener('submit', async event => {
	event.preventDefault();
	const btnSubmit = overlay.querySelector('#btnSubmitReply');
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
			overlay.classList.add('hidden');
			event.target.reset();
		}

	} catch (error) {
		console.error('Error submitting reply:', error);
	}


});

document.getElementById('btnCloseReplyOverlay').addEventListener('click', event => {
	overlay.classList.add('hidden');
});

overlay.addEventListener('click', event => {
	if (event.target === overlay) {
		overlay.classList.add('hidden');
	}
});