class Squares(val number: Int) {
    fun squareOfSum(): Int = (1..number).sum().let {
        it * it
    }

    fun sumOfSquares(): Int = (1..number).sumBy {
        it * it
    }
    
    fun difference(): Int = squareOfSum() - sumOfSquares()
    
}