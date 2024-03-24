const hour = document.getElementById('clock-hour')
const minutes = document.getElementById('clock-minutes')
const seconds = document.getElementById('clock-seconds')

const audio = document.querySelector('audio')

audio.volume = 0.2

const initClock = function () {
    let date = new Date()

    const h = date.getHours() + date.getMinutes() / 60
    const m = date.getMinutes() + date.getSeconds() / 60
    const s = date.getSeconds()

    hour.style.transform = `rotate(${h * 30}deg)`
    minutes.style.transform = `rotate(${m * 6}deg)`
    seconds.style.transform = `rotate(${s * 6}deg)`

    console.log(h, m, s)
    audio.play()
    audio.onended = function () {
        audio.play();
    }
}

setInterval(initClock, 1000)

const textHour = document.getElementById('text-hour')
const textMinutes = document.getElementById('text-minutes')
const textAmpm = document.getElementById('text-ampm')

const textDay = document.getElementById('date-day')
const textMonth = document.getElementById('date-month')
const textYear = document.getElementById('date-year')

const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "July", "Aug", "Sep", "Oct", "Nov", " Dec"]

const initTextClock = function () {
    let date = new Date()
    let ampm
    let h = date.getHours()
    let m = date.getMinutes()

    if (h >= 12) {
        h = h - 12
        ampm = "PM"
    } else {
        ampm = "AM"
    }

    if (h < 10) {
        h = '0' + h;
    }

    if (m < 10) {
        m = '0' + m;
    }

    textHour.innerText = `${h}:`
    textMinutes.innerText = m
    textAmpm.innerText = ampm
    textDay.innerText = date.getDay()
    textMonth.innerText = months[date.getMonth()]
    textYear.innerText = date.getFullYear()
}

setInterval(initTextClock, 1000)

const themeButton = document.getElementById('theme-button')
const darkTheme = 'dark-theme'
const iconTheme = 'bxs-sun'

const selectedTheme = localStorage.getItem('selected-theme')
const selectedIcon = localStorage.getItem('selected-icon')

const getCurrentTheme = () => document.body.classList.contains(darkTheme) ? 'dark' : 'light'
const getCurrentIcon = () => themeButton.classList.contains(iconTheme) ? 'bxs-moon' : 'bxs-sun'

if (selectedTheme) {
    document.body.classList[selectedTheme === 'dark' ? 'add' : 'remove'](darkTheme)
    themeButton.classList[selectedIcon === 'bxs-moon' ? 'add' : 'remove'](iconTheme)
}

themeButton.addEventListener('click', () => {
    document.body.classList.toggle(darkTheme)
    themeButton.classList.toggle(iconTheme)

    localStorage.setItem('selected-theme', getCurrentTheme())
    localStorage.setItem('selected-icon', getCurrentIcon())
    audio.play()
})



