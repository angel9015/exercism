import math

class Rational(object):
    def __init__(self, numer, denom):
        
        g = math.gcd(numer, denom)
        self.numer = numer // g
        self.denom = denom // g 
        
        if self.numer < 0 and self.denom > 0 or \
            self.numer > 0 and self.denom < 0:
            self.numer = - abs(self.numer)
        else:
            self.numer = abs(self.numer)
        self.denom = abs(self.denom)

    def __eq__(self, other):
        return self.numer == other.numer \
             and self.denom == other.denom \

    def __repr__(self):
        return '{}/{}'.format(self.numer, self.denom)

    def __add__(self, other):
        return Rational(self.numer*other.denom + other.numer * self.denom, self.denom*other.denom)

    def __sub__(self, other):
        return Rational(self.numer*other.denom - other.numer * self.denom, self.denom*other.denom)

    def __mul__(self, other):
        return Rational(self.numer*other.numer, self.denom*other.denom)

    def __truediv__(self, other):
        return Rational(self.numer*other.denom, self.denom*other.numer)

    def __abs__(self):
        return Rational(abs(self.numer), abs(self.denom))

    def __pow__(self, power):
        if(power > 0):
            return Rational(pow(self.numer, power), pow(self.denom, power))
        else:
            return Rational(pow(self.denom, power), pow(self.numer, power))

    def __rpow__(self, base):
        return pow(pow(base, self.numer), 1/self.denom)

