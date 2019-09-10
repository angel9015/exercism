def is_isogram(string):
    lower_letters = [z for z in string.lower() if z.isalpha()]
    return len(set(lower_letters)) == len(lower_letters)
