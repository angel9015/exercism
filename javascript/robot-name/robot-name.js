const TOTAL_NAMES = 26 * 26 * 10 * 10 * 10
const LETTER1_DIV = 26 * 10 * 10 * 10
const LETTER2_DIV = 10 * 10 * 10
const NUM1_DIV = 10 * 10 
const NUM2_DIV = 10

const LETTER_A = 'A'.charCodeAt(0)

const robotLetter = (n, div) => String.fromCharCode(Math.floor(n / div) + LETTER_A)

const translateName = function (number) {
    const letter1 = robotLetter(number, LETTER1_DIV)
    let rem = number % LETTER1_DIV
    const letter2 = robotLetter(rem, LETTER2_DIV)
    rem = rem % LETTER2_DIV
    const num1 = Math.floor(rem / NUM1_DIV)
    rem = rem % NUM1_DIV
    const num2 = Math.floor(rem / NUM2_DIV)
    rem = rem % NUM2_DIV
    const num3 = rem

    return letter1 + letter2 + num1 + num2 + num3
}


export class Robot {
    constructor() {
        this._name = Robot.pickName()
    }

    reset() {
        this._name = Robot.pickName()
    }

    set name(v) {
        throw "internal name cannot be modified"
    }

    get name() {
        return this._name
    }
}

const initNames = () => {
    Robot.availableNames = []
    for (let i = 0; i < TOTAL_NAMES; i++) {
        Robot.availableNames.push(i)
    }
}
initNames();

Robot.pickName = () => {
    let idx = Math.floor(Math.random() * Math.floor(Robot.availableNames.length));
    let nameNumber = Robot.availableNames[idx]
    Robot.availableNames.splice(idx, 1)
    return translateName(nameNumber)
}


Robot.releaseNames = () => {
    initNames()
};
