const params = new URLSearchParams(window.location.search);

if (params.has('successToast')) {
    const message = decodeURIComponent(params.get('successToast'));
    showToast(message, 'success');
}

if (params.has('errorToast')) {
    const message = decodeURIComponent(params.get('errorToast'));
    showToast(message, 'error');
}

if (params.has('successToast') || params.has('errorToast')) {
    const url = new URL(window.location);
    url.search = '';
    window.history.replaceState({}, document.title, url.toString());
}

export function showToast(message, type) {
    const container = document.createElement('div');
    container.id = 'toastContainer';
    const toast = document.createElement('article');
    toast.className = `${type}Toast`;

    const text = document.createElement('p');
    text.innerText = message;

    toast.appendChild(text);
    container.appendChild(toast);
    document.body.appendChild(container);

    toast.style.opacity = '0';
    toast.style.transform = 'translateY(10px)';
    toast.style.transition = 'all 0.3s ease';

    setTimeout(() => {
        toast.style.opacity = '1';
        toast.style.transform = 'translateY(0)';
    }, 50);

    setTimeout(() => {
        toast.style.opacity = '0';
        toast.style.transform = 'translateY(-10px)';
    }, 2700);

    setTimeout(() => {
        document.body.removeChild(toast);
    }, 3000);
}
