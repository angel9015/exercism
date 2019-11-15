

function tokenize(question) {
    return question.
        replace(/multiplied by/g, 'mult'). // change double words to single ones
        replace(/divided by/g, 'div').
        slice(0, -1). // remove ?
        split(' '). // split with spaces
        slice(2) // remove what is
}

function operate(op, nextNumber, acc) {
    switch (op) {
        case 'plus': return acc + nextNumber; 
        case 'minus': return acc - nextNumber; 
        case 'mult': return acc * nextNumber;
        case 'div': return acc / nextNumber;
        default: throw new ArgumentError()
    }
}

function evaluate(tokens) {
    let acc = tokens.shift() * 1;

    while (true) {
        let op = tokens.shift()
        if (!op) {
            break
        } else {
            let nextNumber = tokens.shift() * 1;
            acc = operate(op, nextNumber, acc)
        }
    }
    return acc
}

export class WordProblem {
    constructor(question) {
        this._question = question
    }

    answer() {
        if (!this._question.startsWith('What is ') || !this._question.endsWith('?')) {
            throw new ArgumentError()
        }

        let tokens = tokenize(this._question)
        return evaluate(tokens);
    }
}

export class ArgumentError {

}


