object ScrabbleScore {
   fun scoreWord(word: String): Int = word.sumBy {
      when(it.toUpperCase()) {
         'D', 'G' -> 2
         'B', 'C', 'M', 'P' -> 3
         'F', 'H', 'V', 'W', 'Y' -> 4
         'K' -> 5
         'J', 'X' -> 8
         'Q', 'Z' -> 10
         else -> 1        
      }
   }
}
