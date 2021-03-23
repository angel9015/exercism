import itertools

PRICE = 800


def calc_group(g):
    if len(g) == 1:
        return PRICE
    elif len(g) == 2:
        return int(PRICE * 2 * 0.95)
    elif len(g) == 3:
        return int(800 * 3 * 0.9)
    elif len(g) == 4:
        return int(800 * 4 * 0.8)
    elif len(g) == 5:
        return int(800 * 5 * 0.75)

def make_groups(basket):
    groups = [[]]
    for b in basket:
        for g in groups:
            if b not in g:
                g.append(b)
                break
        else:
            groups.append([b])
    return groups


def total(basket):
    groups = make_groups(basket)
    s = sum(calc_group(g) for g in groups)
    return s

print(total([1,1,2,2,3,3,4,5]))


