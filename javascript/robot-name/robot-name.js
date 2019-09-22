const TOTAL_NAMES = 26 * 26 * 10 * 10 * 10
const translateName = function (number) {
    const letter1 = String.fromCharCode(Math.floor(number / (26 * 10 * 10 * 10)) + 65)
    let rem = number % (26 * 10 * 10 * 10)
    const letter2 = String.fromCharCode(Math.floor(rem / (10 * 10 * 10)) + 65)
    rem = rem % (10 * 10 * 10)
    const num1 = Math.floor(rem / (10 * 10))
    rem = rem % (10 * 10)
    const num2 = Math.floor(rem / 10)
    rem = rem % 10
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
