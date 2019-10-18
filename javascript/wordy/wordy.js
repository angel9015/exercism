
export class WordProblem {
    constructor(question) {
        this._question = question
    }

    answer() {
        if (!this._question.startsWith('What is ') || !this._question.endsWith('?')) {
            throw new ArgumentError()
        }

        let tokens = this._question.
            replace(/multiplied by/g, 'mult'). // change double words to single ones
            replace(/divided by/g, 'div').
            slice(0, -1). // remove ?
            split(' '). // split with spaces
            slice(2) // remove what is

        let acc = tokens.shift() * 1;
        while (true) {
            let op = tokens.shift()
            //console.log(acc, op)
            if (!op) {
                break
            } else {
                let nextNumber = tokens.shift() * 1;
                switch (op) {
                    case 'plus': acc += nextNumber; break;
                    case 'minus': acc -= nextNumber; break;
                    case 'mult': acc *= nextNumber; break;
                    case 'div': acc /= nextNumber; break;
                    default: throw new ArgumentError()
                }

            }
        }

        return acc;
    }
}

export class ArgumentError {

}


