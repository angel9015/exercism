export class List {
  constructor(arr) {
    this._list = arr || [];
  }

  get values() {
    return this._list
  }

  append(other) {
    this._list = [...this._list, ...other._list]
    return this
  }

  concat(other) {
    for (let el of other.values) {
      this.append(el)
    }
    return this
  }

  filter(f) {
    let newList = []
    for (let item of this._list) {
      if (f(item)) newList = [...newList, item]
    }
    this._list = newList
    return this
  }

  map(f) {
    let newList = []
    for (let item of this._list) {
      newList = [...newList, f(item)]
    }
    this._list = newList
    return this
  }

  length() {
    let l = 0
    for (let item of this._list) {
      l++;
    }
    return l;
  }

  foldl(f, init) {
    let acc = init;
    for (let item of this._list) {
      acc = f(acc, item);
    }
    return acc;
  }

  foldr(f, init) {
    let acc = init;
    for (let item of this.reverse().values) {
      acc = f(acc, item);
    }
    return acc;
  }

  reverse() {
    let newList = []
    for (let item of this._list) {
      newList = [item, ...newList]
    }
    this._list = newList
    return this
  }
}
