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
    this._list = [...this._list, ...other._list]
    return this
  }

  concat(other) {
    other.values.forEach(el => {
      this.append(el)
    })
    return this
  }

  filter(f) {
    let newList = []
    this._list.forEach(item => {
      if (f(item)) newList.push(item)
    })
    this._list = newList
    return this
  }

  map(f) {
    let newList = []
    this._list.forEach(item => {
      newList.push(f(item))
    })
    this._list = newList
    return this
  }

  length() {
    let l = 0
    this._list.forEach(item => {
      l++;
    })
    return l;
  }

  foldl(f, init) {
    let acc = init;
    this._list.forEach(item => {

      acc = f(acc, item);
    })
    return acc;
  }

  foldr(f, init) {
    let acc = init;
    [...this._list].reverse().forEach(item => {
      acc = f(acc, item);
    })
    return acc;
  }

  reverse() {
    let newList = []
    this._list.forEach(item => {
      newList.splice(0, 0, item)
    })
    this._list = newList
    return this
  }
}
