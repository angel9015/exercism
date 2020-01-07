from enum import IntEnum

<<<<<<< HEAD
LV = defaultdict(lambda: 1)
LV['D'] = LV['G'] = 2
LV['B'] = LV['C'] = LV['M'] = LV['P'] = 3
LV['F'] = LV['H'] = LV['V'] = LV['W'] = LV['Y'] = 4
LV['K'] = 5
LV['J'] = LV['X'] = 8
LV['Q'] = LV['Z'] = 10
=======
>>>>>>> origin/master

class LetterValues(IntEnum):
    A = E = I = O = U = L = N = R = S = T = 1
    D = G = 2
    B = C = M = P = 3
    F = H = V= W = Y = 4
    K = 5
    J = X = 8
    Q = Z = 10

<<<<<<< HEAD
def score_letter(l):
    return LV[l]
=======
>>>>>>> origin/master

def score(word):
    return sum(LetterValues[z] for z in word.upper())
