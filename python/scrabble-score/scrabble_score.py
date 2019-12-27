from collections import defaultdict

LETTER_VALUES = defaultdict(lambda: 1)
LETTER_VALUES['D'] = LETTER_VALUES['G'] = 2
LETTER_VALUES['B'] = LETTER_VALUES['C'] = LETTER_VALUES['M'] = LETTER_VALUES['P'] = 3
LETTER_VALUES['F'] = LETTER_VALUES['H'] = LETTER_VALUES['V'] = LETTER_VALUES['W'] = LETTER_VALUES['Y'] = 4
LETTER_VALUES['K'] = 5
LETTER_VALUES['J'] = LETTER_VALUES['X'] = 8
LETTER_VALUES['Q'] = LETTER_VALUES['Z'] = 10


def score_letter(l):
    return LETTER_VALUES[l]

def score(word):
    return sum(score_letter(z) for z in word.upper())
