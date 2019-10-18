NUMERALS = [
    '',
    'first',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'seventh',
    'eighth',
    'ninth',
    'tenth',
    'eleventh',
    'twelfth',
]

THINGS = [
    '',
    'a Partridge in a Pear Tree',
    'two Turtle Doves',
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings',
    'six Geese-a-Laying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking',
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming',
]

def create_things(verse):
    if verse == 1:
        return THINGS[verse]
    return f"{', '.join(THINGS[verse:1:-1])}, and {THINGS[1]}"


def recite_verse(verse):
     return f"On the {NUMERALS[verse]} day of Christmas my true love gave to me: {create_things(verse)}."

def recite(start_verse, end_verse):
    return [recite_verse(n) for n in range(start_verse, end_verse+1)]
