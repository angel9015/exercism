

object HandshakeCalculator {
    fun calculateHandshake(n: Int): List<Signal> = listOf(
        Pair(n and 1 != 0, Signal.WINK),
        Pair(n and 2 != 0, Signal.DOUBLE_BLINK),
        Pair(n and 4 != 0, Signal.CLOSE_YOUR_EYES),
        Pair(n and 8 != 0, Signal.JUMP)
    ).filter {
        it.first == true
    }.map {
        it.second
    }.let {
        if (n and 16 == 0) it else it.asReversed()
    }
}