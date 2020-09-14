from __future__ import division

def gcd(r):
    x, y = r.numer, r.denom
    while(y): 
        x, y = y, x % y 
    return x

class Rational(object):
    def __init__(self, numer, denom):
        self.numer = numer
        self.denom = denom

    def __eq__(self, other):
        if self.numer == 0:
            return True if other.numer == 0 else False
        r1 = self.simplify()
        r2 = self.simplify()
        return r1.numer == r2.numer and r1.denom == r2.denom

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

    def simplify(self):
        g = gcd(self)
        return Rational(self.numer / g, self.denom /g  )
