class BankAccount() {
    var isOpen: Boolean = true
    var balanceAmount: Int = 0

    val balance: Int
    get() {
        if(!isOpen) throw IllegalStateException()
        return balanceAmount
    }

    @Synchronized fun adjustBalance (amt: Int) {
        if(!isOpen) throw IllegalStateException()
        balanceAmount += amt
    }

    fun close() {
        if(!isOpen) throw IllegalStateException()
        isOpen = false
    }
}