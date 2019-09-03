class BankAccount() {
    private var isOpen: Boolean = true
    private var balanceAmount: Int = 0

    val balance: Int
    get() {
        mustBeOpen()
        return balanceAmount
    }

    @Synchronized fun adjustBalance (amt: Int) {
        mustBeOpen()
        balanceAmount += amt
    }

    fun close() {
        mustBeOpen()
        isOpen = false
    }

    private fun mustBeOpen() {
        if(!isOpen) throw IllegalStateException()
    }
}