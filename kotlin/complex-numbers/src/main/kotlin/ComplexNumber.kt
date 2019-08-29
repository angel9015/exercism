import kotlin.math.sqrt

data class ComplexNumber(val real: Double = 0.0, val imag: Double = 0.0) {
    operator fun plus(other: ComplexNumber): ComplexNumber {
        return ComplexNumber(real + other.real, imag + other.imag)
    }
    operator fun minus(other: ComplexNumber): ComplexNumber {
        return ComplexNumber(real - other.real, imag - other.imag)
    }
    operator fun times(other: ComplexNumber): ComplexNumber {
        return ComplexNumber(real * other.real - imag * other.imag, real * other.imag + imag * other.real)
    }
    operator fun div(other: ComplexNumber): ComplexNumber {
        val denom = other.real * other.real + other.imag * other.imag
        val rnom = real * other.real + imag * other.imag
        val inom = imag * other.real - real * other.imag 
        return ComplexNumber(rnom / denom, inom / denom)
    }

    val abs = sqrt(real * real + imag * imag)

    fun conjugate() = ComplexNumber(real, - imag)

    fun exponential(): ComplexNumber {
        return ComplexNumber(0.0, 0.0)
    }

}
