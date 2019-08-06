class ScrabbleScore {
   companion object {
      val scores = mapOf(
         'D' to 2, 
         'G' to 2,
         'B' to 3,
         'C' to 3,
         'M' to 3,
         'P' to 3,
         'F' to 4,
         'H' to 4,
         'V' to 4,
         'W' to 4,
         'Y' to 4,
         'K' to 5,
         'J' to 8,
         'X' to 8,
         'Q' to 10,
         'Z' to 10
      ) 

      fun scoreWord(word: String): Int {
         return word.map {
            scores.getOrDefault(it.toUpperCase(), 1)
         }.sum()
      }
   }
}
