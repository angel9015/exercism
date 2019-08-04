class Raindrops {
   companion object {
      fun convert(num: Int): String {
         var s = ""
         if(num % 3 == 0) s+= "Pling"
         if(num % 5 == 0) s+= "Plang"
         if(num % 7 == 0) s+= "Plong"
         if(s=="") s = num.toString()
         return s
      }
   }
}
