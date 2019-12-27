import re
from collections import Counter

IGNORED = "[^a-z0-9' ]"
SEPARATOR = " "

def count_words(sentence):
    lower_sentence = sentence.lower()
    words = re.sub(IGNORED, SEPARATOR, lower_sentence).split(SEPARATOR)
    result = Counter(word[1:-1] if word[0] =="'" else word for word in words if word)
    return result
