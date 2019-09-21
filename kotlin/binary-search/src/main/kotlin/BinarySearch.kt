object BinarySearch {
    fun search(list: List<Int>, value: Int): Int {
        if(list.size == 0) return -1
        val idx = list.size.div(2)
        val middleValue = list[idx]

        return if (middleValue == value) {
            idx
        } else if (middleValue > value ) {
            BinarySearch.search(list.subList(0, idx), value)
        } else {
            BinarySearch.search(list.subList(idx+1, list.size), value).let {
                if (it >= 0) idx + 1 + it else -1
            }
        }
    }
}