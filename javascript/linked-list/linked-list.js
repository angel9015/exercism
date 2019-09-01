class Node {
  constructor(val, prev, next) {
    this.val = val;
    this.prev = prev;
    this.next = next;
  }
}

export class LinkedList {
  constructor() {
    this.first = null
    this.last = null
  }

  isEmpty() {
    return this.first == null
  }

  isSingleElement() {
    return this.first == this.last
  }

  push(el) {
    if (this.isEmpty()) {
      this.first = new Node(el, null, null)
      this.last = this.first
    } else {
      // List with elements
      let nn = new Node(el, this.last, null)
      this.last.next = nn
      this.last = nn
    }
  }

  pop() {
    let v = this.last.val
    if (this.isSingleElement()) {
      this.first = this.last = null
    } else {
      this.last = this.last.prev
      this.last.next = null
    }
    return v
  }

  shift() {
    let v = this.first.val
    if (this.isSingleElement()) {
      this.first = this.last = null
    } else {
      this.first = this.first.next
      this.first.prev = null
    }
    return v
  }

  unshift(el) {
    if (this.isEmpty()) {
      this.first = new Node(el, null, null)
      this.last = this.first
    } else {
      let nn = new Node(el, null, this.first)
      this.first.prev = nn
      this.first = nn
    }
  }

  delete(v) {
    if (this.first.val == v) {
      this.shift()
      return
    } else if (this.last.val == v) {
      this.pop()
      return
    }

    const el = this.find(v)
    if (el) {
      if (el.next) el.next.prev = el.prev
      if (el.prev) el.prev.next = el.next
    }
  }

  find(v) {
    let c = this.first;
    while (c != null) {
      if (c.val == v) {
        return c
      }
      c = c.next
    }
    return null
  }

  count() {
    let c = this.first;
    let cnt = 0;
    while (c != null) {
      cnt += 1;
      c = c.next
    }
    return cnt
  }
}


