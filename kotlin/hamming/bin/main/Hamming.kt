class Hamming {
    companion object {
        fun compute(left: String, right: String): Int {
            if(left.length != right.length) throw IllegalArgumentException("left and right strands must be of equal length.")
            return (left zip right).filter { it.first != it.second }.size
            
        }
    }
}