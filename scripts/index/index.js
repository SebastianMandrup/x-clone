import './signUp.js';

function setIndexTitle(){
    document.title = "X / It's what's happening / X";
}

document.getElementById('btnSignUp').addEventListener('click', () => {
    document.getElementById('sectionModalBackgroundSignUp').classList.remove('hidden');
    document.body.classList.add('modalOpen');
    document.title = "Sign up for X / X";
});

document.getElementById('btnSignIn').addEventListener('click', () => {
    document.getElementById('sectionModalBackgroundLogin').classList.remove('hidden');
    document.body.classList.add('modalOpen');
    document.title = "Log in to X / X";
});

document.getElementById('btnCloseSignUpModal').addEventListener('click', () => {
    document.getElementById('sectionModalBackgroundSignUp').classList.add('hidden');
    document.body.classList.remove('modalOpen');
    setIndexTitle();
});

document.getElementById('btnCloseLoginModal').addEventListener('click', () => {
    document.getElementById('sectionModalBackgroundLogin').classList.add('hidden');
    document.body.classList.remove('modalOpen');
    setIndexTitle();
});

document.getElementById('btnUseEmail').addEventListener('click', () => {
    document.getElementById('inputEmailSignUp').classList.remove('hidden');
    document.getElementById('inputPhoneSignUp').classList.add('hidden');
    document.getElementById('btnUseEmail').classList.add('hidden');
    document.getElementById('btnUsePhone').classList.remove('hidden');
});

document.getElementById('btnUsePhone').addEventListener('click', () => {
    document.getElementById('inputPhoneSignUp').classList.remove('hidden');
    document.getElementById('inputEmailSignUp').classList.add('hidden');
    document.getElementById('btnUseEmail').classList.remove('hidden');
    document.getElementById('btnUsePhone').classList.add('hidden');
});

document.getElementById('linkOpenSignup').addEventListener('click', () => {
    document.getElementById('sectionModalBackgroundLogin').classList.add('hidden');
    document.getElementById('sectionModalBackgroundSignUp').classList.remove('hidden');
    document.title = "Sign up for X / X";
});