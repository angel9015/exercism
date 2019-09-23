import { throwStatement } from "@babel/types";

export class List {
  constructor(arr) {
    this._list = arr || [];
  }

  get values() {
    return this._list
  }

  append(other) {
    this._list = [...this, ...other]
    return this
  }

  push(item) {
    this._list = [...this._list, item]
  }

  unshift(item) {
    this._list = [item, ...this._list]
  }

  concat(other) {
    for (let el of other) {
      this.append(el)
    }
    return this
  }

  filter(f) {
    let newList = new List()
    for (let item of this) {
      if (f(item)) newList.push(item)
    }
    return newList
  }

  map(f) {
    let newList = new List()
    for (let item of this) {
      newList.push(f(item))
    }
    return newList
  }

  length() {
    let l = 0
    for (let _item of this._list) {
      l++;
    }
    return l;
  }

  /*
  *[Symbol.iterator]() {
    for (let i = 0; i < this.length(); i++) {
      yield this._list[i]
    }
  }*/
  [Symbol.iterator]() {
    return this._list[Symbol.iterator]()
  }

  foldl(f, init) {
    let acc = init;
    for (let item of this) {
      acc = f(acc, item);
    }
    return acc;
  }

  foldr(f, init) {
    let acc = init;
    for (let item of this.reverse()) {
      acc = f(acc, item);
    }
    return acc;
  }

  reverse() {
    let newList = new List()
    for (let item of this) {
      newList.unshift(item)
    }
    return newList
  }
}
