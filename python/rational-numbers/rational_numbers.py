import math

class Rational(object):
    def __init__(self, numer, denom):
        self.numer = numer
        self.denom = denom
        g = math.gcd(self.numer, self.denom)
        self.numer = int(self.numer / g)
        self.denom = int(self.denom /g )
        
        self.pm = '+' 
        if self.numer < 0 and self.denom > 0 or \
            self.numer > 0 and self.denom < 0:
            self.pm = '-'

    def __eq__(self, other):
        if self.numer == 0:
            return True if other.numer == 0 else False
        return abs(self.numer) == abs(other.numer) \
             and abs(self.denom) == abs(other.denom) \
                  and self.pm == other.pm

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
        g = math.gcd(self.numer, self.denom)
        return Rational(int(self.numer / g), int(self.denom /g ))
