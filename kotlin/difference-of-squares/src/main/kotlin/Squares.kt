class Squares(val number: Int) {
    fun squareOfSum(): Int {
        val s = (1..number).sum()
        return s*s
    }

    fun sumOfSquares(): Int {
        return (1..number).sumBy {
            it * it
        }
    }

    fun difference(): Int {
        return squareOfSum() - sumOfSquares()
    }
}