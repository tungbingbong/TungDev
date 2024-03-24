const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const game = $('.game')
let active = true
const cells = $$('.cell')

const gameStatus = $('.game--status')

const btnLevel = $('.level')
const btnStart = $('.start')
const btnRestart = $('.game--restart')

const winningMessage = (type) => `Player ${type} has won!`
const drawMessage = () => `Game ended in a draw!`

const arrLevel = ['Easy', 'Medium']

let indexLevel = 0

let mark = []
let player1 = []
let player2 = []

let yourTurn = true

// choose level
btnLevel.addEventListener('click', () => {
    indexLevel++

    if (indexLevel > arrLevel.length - 1) {
        indexLevel = 0
    }

    btnLevel.innerText = arrLevel[indexLevel]
})

// Level easy so random cell
function handleCellBotEasy() {
    do {
        var cellRandom = Math.floor(Math.random() * 8)
    } while (mark.includes(cellRandom))

    return cellRandom
}

function handleCellClick(event) {
    if (active) {
        const cellEl = event.target
        const cellIndex = parseInt(cellEl.getAttribute('data-cell-index'))

        if (yourTurn) {
            if (mark.includes(cellIndex)) {
                alert('Đã được chọn')
            } else {
                // Player's turn
                mark.push(cellIndex)
                player1.push(cellIndex)
                handleCellPlayed(cellEl, 'X')
                yourTurn = false

                if (handleResultValidation()) {
                    return
                }

                if (mark.length < 9) {
                    // Bot's turn
                    const cellRandom = handleCellBotEasy()
                    // const cellRandom = handleCellBotMedium()
                    mark.push(cellRandom)
                    player2.push(cellRandom)
                    handleCellPlayed(cells[cellRandom], 'O')
                    yourTurn = true
                    if (handleResultValidation()) {
                        return
                    }
                }
            }
        } else {
            alert('Chưa đến lượt của bạn')
        }

        console.log('mark: ', mark)
        console.log('player1: ', player1)
        console.log('player2: ', player2)

    }

}

function handleCellPlayed(cellEl, type) {
    cellEl.innerText = type
    cellEl.classList.add(type)
}

function handleResultValidation() {
    const winConditions = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
    ]

    let hasWon = false

    winConditions.forEach(function (winCondition) {
        const a = winCondition[0]
        const b = winCondition[1]
        const c = winCondition[2]

        if (mark.length % 2 === 0) {
            if (player2.includes(a) && player2.includes(b) && player2.includes(c)) {
                hasWon = true
                active = false
            }
        } else {
            if (player1.includes(a) && player1.includes(b) && player1.includes(c)) {
                hasWon = true
                active = false
            }
        }
    })

    if (hasWon) {
        if (mark.length % 2 === 0) {
            gameStatus.innerText = winningMessage('O')
        } else {
            gameStatus.innerText = winningMessage('X')
        }
        return true
    }

    if (!hasWon && mark.length === 9) {
        gameStatus.innerText = drawMessage()
        return true
    }

    return hasWon

}

// Restart Game
function restartGame(cellEl) {
    cellEl.className = "cell"
    cellEl.innerText = ""
}

btnRestart.addEventListener('click', function () {
    active = true

    yourTurn = true
    mark = []
    player1 = []
    player2 = []

    gameStatus.innerText = ""

    cells.forEach(restartGame)
})

// Start Game
btnStart.addEventListener('click', () => {
    active = true
    game.classList.add('started')

    cells.forEach(cell =>
        cell.addEventListener('click', handleCellClick));
})
