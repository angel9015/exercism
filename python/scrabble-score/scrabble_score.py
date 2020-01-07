from collections import defaultdict

LV = defaultdict(lambda: 1)
LV['D'] = LV['G'] = 2
LV['B'] = LV['C'] = LV['M'] = LV['P'] = 3
LV['F'] = LV['H'] = LV['V'] = LV['W'] = LV['Y'] = 4
LV['K'] = 5
LV['J'] = LV['X'] = 8
LV['Q'] = LV['Z'] = 10


def score_letter(l):
    return LV[l]

def score(word):
    return sum(score_letter(z) for z in word.upper())
