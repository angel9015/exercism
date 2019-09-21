TOTAL_NAMES = 26 * 26 * 10 * 10 * 10

function createName() {
    return createLetter() + createLetter() + createNumber() + createNumber() + createNumber()
}

function createLetter() {
    let rnd = Math.floor(Math.random() * 26 + 65);
    return String.fromCharCode(rnd);
}

function createNumber() {
    return Math.floor(Math.random() * 10);
}


export class Robot {
    constructor() {
        this._name = Robot.createUniqueName()
    }

    reset() {
        this._name = Robot.createUniqueName()
    }

    set name(v) {
        throw "internal name cannot be modified"
    }

    get name() {
        return this._name
    }
}

Robot.freeNames = []
for (let i = 0; i < TOTAL_NAMES; i++) {
    Robot.freeNames.push(i)
}
Robot.createUniqueName = () => {
    let name = ''
    let tries = 0
    do {
        name = createName()
        tries++;

    } while (Robot.usedNames.indexOf(name) >= 0 && tries < 10)

    if (tries > 10) {
        name = Robot.bruteForceCreateName()
    }
    Robot.usedNames.push(name)
    return name
}


Robot.releaseNames = () => {
    Robot.usedNames = []
};
