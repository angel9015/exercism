import re
from collections import Counter

IGNORED = "[^a-z0-9' ]"
SEPARATOR = " "

def gen(words):
   for word in words:
        if not word:
            continue
        if word[0] == "'":
            word = word[1:-1]
        yield word

def count_words(sentence):
    lower_sentence = sentence.lower()
    words = re.sub(IGNORED, SEPARATOR, lower_sentence).split(SEPARATOR)

    result = Counter(gen(words))

    return result
