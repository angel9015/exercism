
export class LinkedList {
  constructor() {
    this._top = null
  }
  push(el) {
    if(this._top == null) {
      this._top = new Node(el, null, null)  
      
    } else {
      let nn = new Node(el, this._top, null)
      this._top.right = nn
    }
  }

  pop() {
    if(this._top.right == null) {
      let v = this._top.val
      this._top = null
      return v
    }
    let r = this._top;
    while(r.right!=null) {
      r = r.right
    }
    let v = r.val
    r.left.right = r.right
    return v
  }

  shift() {
    let v = this._top.val;
    if(this._top.right) {
      this._top.right.left = null
      this._top = this._top.right
    } else {
      this._top = null;
    }
    
    return v
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