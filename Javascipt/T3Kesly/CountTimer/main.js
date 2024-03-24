const pastYear = '10 October 2016';
var x = new Date(pastYear);

const yearsEl = document.getElementById('years');
const daysEl = document.getElementById('days');
const hoursEl = document.getElementById('hours');
const minEl = document.getElementById('min');
const secEl = document.getElementById('sec');

function countdownTimer() {
    var currentTime = new Date();
    var diff = Math.floor((currentTime - x) / 1000);
    var years = formatDate(Math.floor(diff / 3600 / 24 / 365));
    var days = formatDate(Math.floor(diff / 3600 / 24) % 365);
    var hours = formatDate(Math.floor(diff / 3600) % 24);
    var min = formatDate(Math.floor(diff / 60) % 60);
    var sec = formatDate(Math.floor(diff % 60));

    console.log(years, days, hours, min, sec);

    yearsEl.innerHTML = years;
    daysEl.innerHTML = days;
    hoursEl.innerHTML = hours;
    minEl.innerHTML = min;
    secEl.innerHTML = sec;
}

function formatDate(time) {
    return time < 10 ? '0' + time : time;
}

countdownTimer();
setInterval(countdownTimer, 1000);

