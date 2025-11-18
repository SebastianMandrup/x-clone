document.getElementById('sectionUserInfo').addEventListener('click', function (event) {
    event.stopPropagation();
    sectionUserActions.classList.toggle('hidden');

    document.body.addEventListener('click', function bodyClick() {
        sectionUserActions.classList.add('hidden');
        document.body.removeEventListener('click', bodyClick);
    });
});