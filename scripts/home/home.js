import '../shared/toasts.js';

document.getElementById('btnLogout').addEventListener('click', function () {
    window.location.href = '/bridges/logoutBridge.php';
});

document.getElementById('sectionUserInfo').addEventListener('click', function () {
    document.getElementById('sectionUserActions').classList.toggle('hidden');
});