
export class LinkedList {
  constructor(el) {
    this._top = new Node(el, null, null)
  }
  push(el) {
    let nn = new Node(el, this._top, null)
    this._top.right = nn
  }

  pop() {
    let r = this._top.right;
    while(r!=null) {
      r = r.right
    }
    let v = r.val
    r.left.right = r.right
    return v
  }

  shift() {
    throw new Error("Remove this statement and implement this function");
  }

  unshift() {
    throw new Error("Remove this statement and implement this function");
  }

  delete() {
    throw new Error("Remove this statement and implement this function");
  }

  count() {
    throw new Error("Remove this statement and implement this function");
  }
}


class Node {
  constructor(val, left, right) {
    this.val = val;
    this.left = left;
    this.right = right;
  }
}