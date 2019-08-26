import itertools

def chunks(l, n):
    return [l[i:i+n] for i in range(0, len(l), n)]

TRANSLATOR = (
    (('AUG'), 'Methionine'),
    (('UUU', 'UUC'), 'Phenylalanine'),
    (('UUA', 'UUG'), 'Leucine'),
    (('UCU', 'UCC', 'UCA', 'UCG'), 'Serine'),
    (('UAU', 'UAC'), 'Tyrosine'),
    (('UGU', 'UGC'), 'Cysteine'),
    (('UGG'), 'Tryptophan'),
    (('UAA', 'UAG', 'UGA'), 'STOP'),
)


def convert(c):
    return [t[1] for t in TRANSLATOR if c in t[0]][0]

def proteins(strand):
    return list(itertools.takewhile(lambda c: c!='STOP', [convert(c) for c in chunks(strand, 3)]))
