document.getElementById('formSignUp').addEventListener('submit', function (event) {
	event.preventDefault();

	const password = document.getElementById('inputPasswordSignUp').value;
	const confirmPassword = document.getElementById('inputConfirmPasswordSignUp').value;

	if (password !== confirmPassword) {
		alert('Passwords do not match!');
		return;
	}
	this.submit();
});