export class InputCell {
    constructor(val) {
        this._value = val;
        this._callbacks = []
    }

    get value() {
        return this._value;
    }

    setValue(val) {
        this._value = val;
        this._callbacks.forEach(c => {

        })
    }

    addCallback(cb) {
        this._callbacks.push(cb)
    }
}

export class ComputeCell {
    constructor(args, op) {
        this._args = args;
        this._op = op;
        this._callbacks = []
    }

    get value() {
        return this._op(this._args) //this._op.call(this._args.map(v => v.value()));
    }

    addCallback(cb) {
        this._callbacks.push(cb)
        this._args.forEach(c => {
            c.addCallback(cb)
        })
    }
}

export class CallbackCell {
    constructor(op) {
        this._op = op
    }

    get values() {
        return this._values
    }
}