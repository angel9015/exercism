

object HandshakeCalculator {
    fun calculateHandshake(n: Int): List<Signal> = listOf(
        Signal.WINK,
        Signal.DOUBLE_BLINK,
        Signal.CLOSE_YOUR_EYES,
        Signal.JUMP,
        null
    ).foldIndexed(listOf<Signal>()) { idx, acc, it ->
        if(n and ((Math.pow(2.0, 1.0*idx)).toInt()) !=0) {
            if(it!=null) acc + it else acc.asReversed()
        } else {
            acc
        }
    }
}