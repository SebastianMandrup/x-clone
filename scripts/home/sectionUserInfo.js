document.getElementById('sectionUserInfo').addEventListener('click', function (event) {
    event.stopPropagation();

    const sectionUserActions = document.getElementById('sectionUserActions');

    sectionUserActions.classList.toggle('hidden');

    document.body.addEventListener('click', function bodyClick() {
        sectionUserActions.classList.add('hidden');
        document.body.removeEventListener('click', bodyClick);
    });
});