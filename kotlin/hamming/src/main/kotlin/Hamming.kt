class Hamming {
    companion object {
        fun compute(left: String, right: String): Int {
            require(left.length == right.length) { 
                "left and right strands must be of equal length." 
            }
            return (left zip right).count { it.first != it.second }
        }
    }
}