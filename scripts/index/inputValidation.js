function validateSignUpPageOne() {
    const inputName = document.getElementById('inputName');
    const inputPhone = document.getElementById('inputPhoneSignUp');
    const inputEmail = document.getElementById('inputEmailSignUp');
    const selectBirthMonth = document.getElementById('selectBirthMonth');
    const selectBirthDay = document.getElementById('selectBirthDay');
    const selectBirthYear = document.getElementById('selectBirthYear');

    let isValid = true;

    if (inputName && inputName.value.trim() === '') {
        isValid = false;
    }

    if ((inputPhone && inputPhone.value.trim() === '') && (inputEmail && inputEmail.value.trim() === '')) {
        isValid = false;
    }

    if ((selectBirthMonth && selectBirthMonth.value === '') || (selectBirthDay && selectBirthDay.value === '') || (selectBirthYear && selectBirthYear.value === '')) {
        isValid = false;
    }

    document.getElementById('btnSignUpNext').disabled = !isValid;
    document.getElementById('btnSignUpSubmit').disabled = !isValid;
}

document.querySelectorAll('#divSignUpPageOne input, #divSignUpPageOne select').forEach(element => {
    element.addEventListener('input', validateSignUpPageOne);
});