document.getElementById('btnSignUpNext').addEventListener('click', (event) => {
    document.getElementById('divSignUpPageOne').classList.add('hidden');
    document.getElementById('divSignUpPageTwo').classList.remove('hidden');
    document.getElementById('btnBackSignUpModal').classList.remove('hidden');
    document.getElementById('btnCloseSignUpModal').classList.add('hidden');
});

document.getElementById('btnBackSignUpModal').addEventListener('click', (event) => {
    document.getElementById('divSignUpPageOne').classList.remove('hidden');
    document.getElementById('divSignUpPageTwo').classList.add('hidden');
    document.getElementById('btnBackSignUpModal').classList.add('hidden');
    document.getElementById('btnCloseSignUpModal').classList.remove('hidden');
});