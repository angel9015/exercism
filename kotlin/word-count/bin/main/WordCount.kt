object WordCount {
    fun phrase(words: String): Map<String, Int> = words.toLowerCase().split(
        "[^a-z0-9']+".toRegex()
    ).filter(String::isNotEmpty).groupBy {
        it.replace("^'".toRegex(), "").replace("'$".toRegex(), "")
    }.mapValues {
        it.value.size
    }
}