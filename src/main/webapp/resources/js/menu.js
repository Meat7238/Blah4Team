const toggleBtn = document.querySelector('.navbar_togleBtn');
const menu = document.querySelector('.navbar_menu');
const right = document.querySelector('.navbar_right');


toggleBtn.addEventListener('click',() => {
	menu.classList.toggle('active');
	icons.classList.toggle('active');
});