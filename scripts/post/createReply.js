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

document.getElementById('btnCloseReplyOverlay').addEventListener('click', event => {
	overlay.classList.add('hidden');
});

overlay.addEventListener('click', event => {
	if (event.target === overlay) {
		overlay.classList.add('hidden');
	}
});