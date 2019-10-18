function bt(value, left, right) {
    return {
        value,
        left,
        right,
    };
}


export class Zipper {
    static fromTree(t) {
        return new Zipper(t.value, t.left, t.right, 'top')
    }

    constructor(value, left, right, trail) {
        this._value = value
        this._left = left
        this._right = right
        this._trail = trail
    }

    toTree() {
        if (this._trail == 'top') {
            return bt(this._value, this._left, this._right)
        } else {
            return this.up().toTree()
        }
    }

    left() {
        if(!this._left) return null;
        return new Zipper(
            this._left.value,
            this._left.left,
            this._left.right,
            ['left', this._value, this._right, this._trail]
        )
    }

    right() {
        if(!this._right) return null;
        return new Zipper(
            this._right.value,
            this._right.left,
            this._right.right,
            ['right', this._value, this._left, this._trail]
        )
    }

    up() {
        if(this._trail == 'top') return null;
        let [tkind, tvalue, tt, ttrail] = this._trail
        if(tkind == 'left') {
            return new Zipper(
                tvalue,
                bt(this._value, this._left, this._right),
                tt,
                ttrail
            )
        }
        if(tkind == 'right') {
            return new Zipper(
                tvalue,
                tt,
                bt(this._value, this._left, this._right),
                ttrail
            )
        }
    }

    setValue(v) {
        return new Zipper(
            v,
            this._left,
            this._right,
            this._trail
        )
    }

    setLeft(l) {
        return new Zipper(
            this._value,
            l,
            this._right,
            this._trail
        )
    }

    setRight(r) {
        return new Zipper(
            this._value,
            this._left,
            r,
            this._trail
        )
    }

    value() {
        return this._value
    }

}

