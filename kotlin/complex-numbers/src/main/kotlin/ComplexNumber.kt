import kotlin.math.*

data class ComplexNumber(val real: Double = 0.0, val imag: Double = 0.0) {
    val abs = sqrt(real * real + imag * imag)
    fun conjugate() = ComplexNumber(real, - imag)
}

operator fun ComplexNumber.plus(other: ComplexNumber): ComplexNumber {
    return ComplexNumber(real + other.real, imag + other.imag)
}

operator fun ComplexNumber.minus(other: ComplexNumber): ComplexNumber {
    return ComplexNumber(real - other.real, imag - other.imag)
}
operator fun ComplexNumber.times(other: ComplexNumber): ComplexNumber {
    return ComplexNumber(real * other.real - imag * other.imag, real * other.imag + imag * other.real)
}
operator fun ComplexNumber.div(other: ComplexNumber): ComplexNumber {
    val denom = other.real * other.real + other.imag * other.imag
    val rnom = real * other.real + imag * other.imag
    val inom = imag * other.real - real * other.imag
    return ComplexNumber(rnom / denom, inom / denom)
}

fun exponential(n: ComplexNumber): ComplexNumber {
    return ComplexNumber(exp(n.real) + cos(n.imag), sin(n.imag))
}
