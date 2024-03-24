// open select language option
var openSelectLanguage = document.querySelector('.js-btn-select-language');
var selectOptions = document.querySelector('.js-select-options');

openSelectLanguage.onclick = function () {
    selectOptions.classList.toggle('select-options--show');
}

document.onclick = function (event) {
    if (event.target.id !== 'header-profile')
        console.log(1);
}

// open notification
var openNotify = document.querySelector('.js-header-notify');
var notifyContainer = document.querySelector('.js-notify-container');

openNotify.onclick = function () {
    notifyContainer.classList.toggle('notify-container--show');
}

// open user profile
var openProfile = document.querySelector('.js-header-profile');
var profileContainer = document.querySelector('.js-profile-container');

openProfile.onclick = function () {
    profileContainer.classList.toggle('profile-container--show');
}

// open menu on mobile tablet
var btnMenu = document.querySelector('.js-toggle-on-tablet-mobile');
var modalMenu = document.querySelector('.js-modal-menu');
var siteMenu = document.querySelector('.js-site-menu');


btnMenu.onclick = function () {
    btnMenu.classList.toggle('active');
    modalMenu.classList.toggle('modal-menu--show');
}

siteMenu.onclick = function (e) {
    e.stopPropagation();
}

modalMenu.onclick = function () {
    modalMenu.classList.remove('modal-menu--show');
    btnMenu.classList.remove('active');

}

// slider courses on mobile

// setInterval(function () {

// }, 3000);

var clientWidth = screen.width;
var wrapperCourses = document.querySelector('.js-wrapper-courses');

if (clientWidth < 739) {
    wrapperCourses.classList.add('owl-carousel');
    wrapperCourses.classList.add('owl-theme');
}

$('.wrapper-courses .owl-carousel').owlCarousel({
    loop: false,
    margin: 20,
    smartSpeed: 1000,
    items: 1

})