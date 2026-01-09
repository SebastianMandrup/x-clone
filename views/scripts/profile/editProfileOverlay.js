const overlay = document.getElementById('divEditProfileOverlay');
const button = document.getElementById('buttonEditProfile');

if (button) {
	button.addEventListener('click', function () {
		overlay.classList.remove('hidden');
		document.body.classList.add('modalOpen');
	});
}

document.getElementById('btnCloseEditProfileOverlay').addEventListener('click', function () {
	overlay.classList.add('hidden');
	document.body.classList.remove('modalOpen');
});

overlay.addEventListener('click', (event) => {
	if (event.target === overlay) {
		overlay.classList.add('hidden');
		document.body.classList.remove('modalOpen');
	}
});