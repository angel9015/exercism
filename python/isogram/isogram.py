def is_isogram(string):
    return len(set(z.lower() for z in string if z.isalpha())) == len([z for z in string if z.isalpha()])
