import '../shared/toasts.js';
import { showToast } from '../shared/toasts.js';

document.getElementById('formSignUp').addEventListener('submit', function (event) {
	event.preventDefault();

	const password = document.getElementById('inputPasswordSignUp').value;
	const confirmPassword = document.getElementById('inputConfirmPasswordSignUp').value;

	if (password !== confirmPassword) {
		showToast('Passwords do not match.', 'error');
		return;
	}
	this.submit();
});