class Node<T>(val value: T, var prev: Node<T>?, var next: Node<T>?) {

}

class Deque<T>() {
    var first: Node<T>? = null
    var last: Node<T>? = null

    fun isEmpty(): Boolean {
        return this.first == null
    }

    fun isSingleElement(): Boolean {
        return this.first == this.last
    }

    fun push(value: T) {
        if(this.isEmpty()) {
            this.first = Node<T>(value, null, null)
            this.last = this.first
        } else {
            val nn = Node<T>(value, this.last, null)
            this.last?.next = nn
            this.last = nn
        }
    }

    fun pop(): T  {
        val v: T = this.last!!.value
        if(this.isSingleElement()) {
            this.first = null
             this.last = null
        } else {
            this.last = this.last!!.prev
            this.last!!.next = null
        }
        return v;
    }

    fun unshift(value: T) {
        if(this.isEmpty()) {
            this.first = Node<T>(value, null, null)
            this.last = this.first
        } else {
            val nn = Node<T>(value, null, this.first)
            this.first!!.prev = nn
            this.first = nn
        }
    }

    fun shift(): T  {
        val v: T = this.first!!.value
        if(this.isSingleElement()) {
            this.first = null
             this.last = null
        } else {
            this.first = this.first!!.next
            this.first!!.prev = null
        }
        return v
    }

    
}