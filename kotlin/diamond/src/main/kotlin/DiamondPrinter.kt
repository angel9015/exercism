class DiamondPrinter {

    private fun createLine(it: Char, c: Char): String {
        // The length of the spaces to the left
        // and right will be equal to the differences between this
        // letter and the stop letter (i.e for B - C it will be 1)
        // for B - E it will be 3 etc
        val outerSpaces = " ".repeat(c - it)

        // The A will be displayed only once so its a special case;
        return if(it == 'A') {
             outerSpaces + it + outerSpaces
        } else {
            // And the amount of spaces between the letters will be
            // the total len - two times the outer len - 2 (for the letter)
            // Which is simplified to 2(it-A)-1
            val innerSpaces = " ".repeat(2*(it-'A')-1)
            outerSpaces + it + innerSpaces + it + outerSpaces
        }
    }

    // Create the top of the diamond  (including the middle line)
    private fun topDiamond(c: Char): List<String> = ('A'..c).map {
        createLine(it, c)
    }

    // The result is the top diamond + the top diamond reversed
    // minus the middle line
    fun printToList(c: Char): List<String> = topDiamond(c).let {
        it + it.asReversed().drop(1)
    }

}
