import '../shared/toasts.js';
import { showToast } from '../shared/toasts.js';

document.getElementById('btnLogout').addEventListener('click', function () {
    window.location.href = '/bridges/logout.php';
});

document.getElementById('sectionUserInfo').addEventListener('click', function (event) {
    event.stopPropagation();
    sectionUserActions.classList.toggle('hidden');

    document.body.addEventListener('click', function bodyClick() {
        sectionUserActions.classList.add('hidden');
        document.body.removeEventListener('click', bodyClick);
    });
});

document.querySelectorAll('.sectionPostActionLike').forEach(section => {
    section.addEventListener('click', async function (event) {

        const countElement = this.querySelector('.spanPostActionCount');
        const article = this.closest('.articlePost');
        const tweetId = article.dataset.tweetId;

        const response = await fetch('/api/likePost.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                tweetId: tweetId
            })
        });

        if (response.ok) {
            this.classList.toggle('triggered');
            if (countElement) {
                const count = parseInt(countElement.textContent.trim());
                const newCount = this.classList.contains('triggered') ? count + 1 : count - 1;
                countElement.textContent = newCount;
            }
        } else {
            const errorData = await response.json();
            showToast(errorData.message || 'An error occurred while processing your request.', 'error');
        }

    });
});