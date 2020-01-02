import re

def abbreviate(words):
    words_list = re.compile(r'[_ -]').split(words)
    return ''.join(w[0].upper() for w in words_list if w)
