object Isogram {
    fun isIsogram(s: String): Boolean {
        val filtered = s.toLowerCase().filter{it!=' ' && it!='-'}
        return filtered.count() == filtered.toSet().count()
    }
}