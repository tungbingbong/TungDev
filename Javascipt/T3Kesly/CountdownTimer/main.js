const newYear = '1 Jan 2023';
var x = new Date(newYear);

const daysEl = document.getElementById('days');
const hoursEl = document.getElementById('hours');
const minEl = document.getElementById('min');
const secEl = document.getElementById('sec');

function countdownTimer() {
    var currentTime = new Date();
    var diff = Math.floor((x - currentTime) / 1000);
    var days = formatDate(Math.floor(diff / 3600 / 24));
    var hours = formatDate(Math.floor(diff / 3600) % 24);
    var min = formatDate(Math.floor(diff / 60) % 60);
    var sec = formatDate(Math.floor(diff % 60));

    console.log(days, hours, min, sec);

    daysEl.innerText = days;
    hoursEl.innerHTML = hours;
    minEl.innerHTML = min;
    secEl.innerHTML = sec;
}

function formatDate(time) {
    return time < 10 ? '0' + time : time;
}

countdownTimer();
setInterval(countdownTimer, 1000);

