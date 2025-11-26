const overlay = document.getElementById('divEditProfileOverlay');

document.getElementById('buttonEditProfile').addEventListener('click', function () {
	overlay.classList.remove('hidden');
	document.body.classList.add('modalOpen');
});

document.getElementById('btnCloseEditProfileOverlay').addEventListener('click', function () {
	overlay.classList.add('hidden');
	document.body.classList.remove('modalOpen');
});

document.getElementById('divEditProfileOverlay').addEventListener('click', (event) => {
	if (event.target === overlay) {
		overlay.classList.add('hidden');
		document.body.classList.remove('modalOpen');
	}
});