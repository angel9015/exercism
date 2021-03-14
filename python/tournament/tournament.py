from collections import defaultdict

HEADER = "Team                           | MP |  W |  D |  L |  P"

def format(t):
    return f"{t[0]:31}|{t[1]['mp']:3} |{t[1]['w']:3} |{t[1]['d']:3} |{t[1]['l']:3} |{t[1]['p']:3}"


def tally(rows):
    t = defaultdict(lambda : {
        'mp': 0, 'w': 0, 'd': 0, 'l': 0, 'p': 0 
    })
    for row in rows:
        t1, t2, res = row.split(';')

        t[t1]['mp']+=1
        t[t2]['mp']+=1
        if res == 'win':
            t[t1]['w']+=1
            t[t2]['l']+=1
            t[t1]['p']+=3
        elif res == 'loss':
            t[t2]['w']+=1
            t[t1]['l']+=1
            t[t2]['p']+=3
        else:
            t[t1]['d']+=1
            t[t2]['d']+=1
            t[t1]['p']+=1
            t[t2]['p']+=1

    return [HEADER] + [format(team) for team in (sorted(t.items(), key=lambda x: (-x[1]['p'], x[0])))]
