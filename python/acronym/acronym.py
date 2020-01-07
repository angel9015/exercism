import re

def abbreviate(words):
    words_list = re.compile(r'[_ -]').split(words.upper())
    return ''.join(w[0] for w in words_list if w)
