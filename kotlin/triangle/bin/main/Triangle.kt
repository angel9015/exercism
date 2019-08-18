class Triangle(val side1: Double, val side2: Double, val side3: Double) {
    constructor(side1: Int, side2: Int, side3: Int): this(side1.toDouble(), side2.toDouble(), side3.toDouble())

    init {
        require(side1 > 0.0 && side2 > 0 && side3 > 0)
        require(side1 <= side2+side3 && side2 <= side1+side3 && side3 <= side1+side2)
    }

    val isEquilateral: Boolean = side1 == side2 && side1 == side3
    val isIsosceles: Boolean = (side1 == side2 || side1 == side3 || side2 == side3)
    val isScalene: Boolean = !isIsosceles && !isEquilateral
}