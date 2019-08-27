class RotationalCipher(val shift: Int) {
    fun encode(s: String): String = s.map {
        when(it) {
            in 'A'..'Z' -> if (it + shift > 'Z') 'A' + (it + shift - 'Z' - 1) else it + shift
            in 'a'..'z' -> if (it + shift > 'z') 'a' + (it + shift - 'z' - 1) else it + shift
            else -> it
        }
    }.joinToString("")
}