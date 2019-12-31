from enum import IntEnum

class LetterValues(IntEnum):
    D = G = 2
    B = C = M = P = 3
    F = H = V= W = Y = 4
    K = 5
    J = X = 8
    Q = Z = 10

def score_letter(l):
    try:
        return LetterValues[l]
    except:
        return 1

def score(word):
    return sum(score_letter(z) for z in word.upper())
