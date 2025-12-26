const overlay = document.getElementById('divAnalyticsOverlay');

document.getElementById('btnCloseAnalyticsOverlay').addEventListener('click', function () {
	overlay.classList.add('hidden');
	document.body.classList.remove('modalOpen');
});

document.getElementById('divAnalyticsOverlay').addEventListener('click', (event) => {
	if (event.target === overlay) {
		overlay.classList.add('hidden');
		document.body.classList.remove('modalOpen');
	}
});

document.getElementById('btnDismissAnalyticsOverlay').addEventListener('click', function () {
	overlay.classList.add('hidden');
	document.body.classList.remove('modalOpen');
});

function addAnalyticsListener(button) {
	button.addEventListener('click', async function (event) {
		event.stopPropagation();
		overlay.classList.remove('hidden');
		document.body.classList.add('modalOpen');
	});
}

const postAnalyticsButtons = document.querySelectorAll('.buttonPostActionAnalytics');
const btnViewAnalytics = document.querySelectorAll('.btnViewAnalytics');

postAnalyticsButtons.forEach(addAnalyticsListener);
btnViewAnalytics.forEach(addAnalyticsListener);
export { addAnalyticsListener };

