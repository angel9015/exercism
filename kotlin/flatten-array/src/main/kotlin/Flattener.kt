 object Flattener {
    fun flatten(list: List<Any?>): List<Any?> = list.fold(listOf(), this::reducer)

    private fun reducer(acc: List<Any?>, el: Any?): List<Any?> = if(el == null) {
        acc
    } else if (el is List<*>) {
        el.fold(acc) {
            internalAcc, internalEl -> reducer(internalAcc, internalEl)
        }
    } else {
        acc + el
    }

 }
