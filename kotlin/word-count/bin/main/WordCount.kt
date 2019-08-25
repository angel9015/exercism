object WordCount {
    fun phrase(words: String): Map<String, Int> = words.toLowerCase().split(
            "[^A-Za-z0-9']+".toRegex()
        ).filter {
            it.trim() != ""
        }.map {
            it.replace("^'".toRegex(), "").replace("'$".toRegex(), "")
        }.fold(emptyMap<String, Int>()) {
        acc, el -> acc.getOrDefault(el, 0).let {
            acc + Pair(el, it + 1)
        }
    }
}