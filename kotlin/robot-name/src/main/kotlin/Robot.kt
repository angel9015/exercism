class Robot {
    var name = ""

    init {
        name = createName()
    }

    fun reset() {
        name = createName()
    }

    companion object {
        fun createChar(): String = ('A'+(0..26).shuffled().first()).toString()
        val names = mutableSetOf<String>()

        fun getName(): String = createChar()+createChar()+(100..999).shuffled().first()

        fun createName(): String {
            var name = getName()
            while(name in names) {
                name = getName()
            }
            names.add(name)
            return name
        }
    }
}