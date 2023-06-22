var toggle = document.querySelector('.toggle');
var body = document.querySelector('body');

toggle.addEventListener('click', function() {
    body.classList.toggle('open');
})
