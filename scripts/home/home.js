import '../shared/toasts.js';
import { showToast } from '../shared/toasts.js';
import './sectionUserInfo.js';
import './commentOverlay.js';

document.getElementById('btnLogout').addEventListener('click', function () {
    window.location.href = '/bridges/logout';
});


document.querySelectorAll('.sectionPostActionLike').forEach(section => {
    section.addEventListener('click', async function (event) {

        const article = this.closest('.articlePost');
        const countElement = this.querySelector('.spanPostActionCount');

        const formdata = new FormData();
        formdata.append('postPk', article.dataset.postPk);
        formdata.append('userPk', article.dataset.userPk);

        const response = await fetch('/api/like-post', {
            method: 'POST',
            body: formdata
        });

        const data = await response.json();

        if (response.ok) {
            this.classList.toggle('triggered');
            const count = parseInt(countElement.textContent.trim());
            const newCount = this.classList.contains('triggered') ? count + 1 : count - 1;
            countElement.textContent = newCount;
        } else {
            const errorData = await response.json();
            showToast(errorData.message || 'An error occurred while processing your request.', 'error');
        }

    });
});
