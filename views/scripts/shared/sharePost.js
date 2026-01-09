const buttons = document.querySelectorAll('.btnSharePost');

function addShareListener(button) {
	const div = button.nextElementSibling;

	button.addEventListener('click', event => {
		event.stopPropagation();
		div.classList.remove('hidden');

		const handler = event => {
			if (div.contains(event.target) || button.contains(event.target)) {
				return;
			}

			div.classList.add('hidden');

			event.preventDefault();
			event.stopImmediatePropagation();

			document.body.removeEventListener('click', handler, true);
		};

		document.body.addEventListener('click', handler, true);
	});
}

buttons.forEach(addShareListener);
export { addShareListener };

