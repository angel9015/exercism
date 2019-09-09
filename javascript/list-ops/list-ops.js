//
// This is only a SKELETON file for the 'List - Ops' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class List {
  constructor(arr) {
    if (arr) {
      this._list = arr
    } else {
      this._list = []
    }
  }

  get values() {
    return this._list
  }

  append(other) {
    other.values.forEach(el => {
      this._list.push(el)
    })
    return this
  }

  concat(other) {
    other.values.forEach(el => {
      this.append(el)
    })
    return this
  }

  filter(f) {
    this._list = this._list.filter(f)
    return this
  }

  map(f) {
    this._list = this._list.map(f)
    return this
  }

  length() {
    return this._list.length
  }

  foldl(f, init) {
    return this._list.reduce(f, init)
  }

  foldr(f, init) {
    return this._list.reduceRight(f, init)
  }

  reverse() {
    this._list = this._list.reverse()
    return this
  }
}
