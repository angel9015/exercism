NUMERALS = {
    1: 'first',
    2: 'second',
    3: 'third',
    4: 'fourth',
    5: 'fifth',
    6: 'sixth',
    7: 'seventh',
    8: 'eighth',
    9: 'ninth',
    10: 'tenth',
    11: 'eleventh',
    12: 'twelfth',
}

THINGS = {
    1: 'a Partridge in a Pear Tree',
    2: 'two Turtle Doves',
    3: 'three French Hens',
    4: 'four Calling Birds',
    5: 'five Gold Rings',
    6: 'six Geese-a-Laying',
    7: 'seven Swans-a-Swimming',
    8: 'eight Maids-a-Milking',
    9: 'nine Ladies Dancing',
    10: 'ten Lords-a-Leaping',
    11: 'eleven Pipers Piping',
    12: 'twelve Drummers Drumming',
}


def create_things(verse):
    if verse == 1:
        return THINGS[verse]
    return f"{', '.join(THINGS[n] for n in range(verse, 1, -1))}, and {THINGS[1]}"


def recite_verse(verse):
     return f"On the {NUMERALS[verse]} day of Christmas my true love gave to me: {create_things(verse)}."

def recite(start_verse, end_verse):
    return [recite_verse(n) for n in range(start_verse, end_verse+1)]
