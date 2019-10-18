import re

def count_words(sentence):
    lower_sentence = sentence.lower()
    words = re.sub("[^a-z0-9' ]"," ",lower_sentence).split(" ")

    result = {}
    for word in words:
        if not word:
            continue
        if word[0] == "'":
            word = word[1:-1]
        val = result.get(word, 0)
        result[word] = val+1
    return result
