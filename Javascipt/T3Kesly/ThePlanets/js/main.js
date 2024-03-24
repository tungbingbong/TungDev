// Lấy dữ liệu từ file json
async function getData() {
    const resp = await fetch("data.json")
    const respData = await resp.json()

    console.log(respData)

    render(respData[currentIndex])
    handleChangePlanets(respData)
    handleChangeDisplay(respData[currentIndex])
}

const planetsList = document.querySelectorAll('.nav__item')
const options = document.querySelectorAll('.display-item')

var currentIndex = 0
var currentDisplayIndex = ["planet", "internal", "geology"]

var currentDisplay = "planet"

// Xử lý sự kiện chuyển planet
function handleChangePlanets(data) {
    Array.from(planetsList).forEach((planet) => {
        planet.addEventListener('click', () => {
            currentIndex = planet.dataset.index

            document.querySelector('.nav__item.active').classList.remove('active')
            planet.classList.add('active')

            handleChangeDisplay(data[currentIndex])
            render(data[currentIndex])
        })
    })
}

const planetImg = document.querySelector('.planet__img')
const content = document.querySelector('.content')
const source = document.querySelector('.source')

var optionDisplay = 'overview'

// Xử lý sự kiện chuyển display
function handleChangeDisplay(dataDisplay) {
    options.forEach((option, index) => {
        option.onclick = function () {
            document.querySelector('.display-item.active').classList.remove('active')
            option.classList.add('active')

            optionDisplay = option.dataset.option
            const displayList = document.querySelectorAll('.display-item')

            displayList.forEach(displayItem => {
                console.log(displayItem.className)
                if (displayItem.className.includes('active')) {
                    displayItem.style.backgroundColor = `var(--${dataDisplay.name.toLowerCase()}-color)`
                } else {
                    displayItem.style.backgroundColor = `#070724`
                }
            })

            content.innerText = dataDisplay[optionDisplay].content
            source.href = dataDisplay[optionDisplay].source
            planetImg.src = dataDisplay.images[currentDisplayIndex[index]]
            currentDisplay = currentDisplayIndex[index]
        }
    })
}

const rotation = document.querySelector('.rotation h3')
const revolution = document.querySelector('.revolution h3')
const radius = document.querySelector('.radius h3')
const temperature = document.querySelector('.temperature h3')

// render giao diện
function render(dataPlanet) {
    const planetName = document.querySelector('.planet-name')

    const displayActive = document.querySelector('.display-item.active')

    displayActive.style.backgroundColor = `var(--${dataPlanet.name.toLowerCase()}-color)`

    planetName.innerText = dataPlanet.name
    content.innerText = dataPlanet[optionDisplay].content
    source.href = dataPlanet[optionDisplay].source
    planetImg.src = dataPlanet.images[currentDisplay]

    rotation.innerText = dataPlanet.rotation
    revolution.innerText = dataPlanet.revolution
    radius.innerText = dataPlanet.radius
    temperature.innerText = dataPlanet.temperature
}

getData()

