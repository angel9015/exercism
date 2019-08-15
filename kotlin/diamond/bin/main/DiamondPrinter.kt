class DiamondPrinter {
    fun printToList(c: Char): List<String> {
        // The total length of each line 
        val len = (c-'A')*2 + 1
        
        // Let's crate the top of the diamond first (including the middle line)
        val top_diamond =  ('A'..c).map {
            // The A will be displayed only once so its a special case;
            // Just display it surrounded by (len - 1)/2 spaces left and right
            if(it == 'A') {
                val a_spaces = " ".repeat((len-1)/2)
                a_spaces + it + a_spaces 
            } else {
                // For other letters, the length of the spaces to the left
                // and right will be equal to the differences between this
                // letter and the stop letter (i.e for B - C it will be 1)
                // for B - E it will be 3 etc
                val outer_length = c - it
                val outer_spaces = " ".repeat(outer_length)
                // And the amount of spaces between the letters will be
                // the total len - two times the outer len - 2 (for the letter)
                val inner_spaces = " ".repeat(len - 2*outer_length - 2)
                outer_spaces + it + inner_spaces + it + outer_spaces
            }            
        }
        // The result is the top diamond + the top diamond reversed 
        // minus the middle line
        return top_diamond + top_diamond.asReversed().drop(1)
    }
}
