import re


def fix_word(word):
    if word.startswith("__"):
        return f"<strong>{fix_word(word[2:])}"
    if word.endswith("__"):
        return f"{word[:-2]}</strong>"
    if word.startswith("_"):
        return f"<em>{fix_word(word[1:])}"
    if word.endswith("_"):
        return f"{word[:-1]}</em>"
    return word


def fix_line(line):
    words = line.split()
    return " ".join(fix_word(word) for word in words)


def parse_header(line, level):
    if line.startswith("#"):
        return parse_header(line[1:], level+1)
    return f"<h{level}>{line.strip()}</h{level}>"


def parse_line(line):
    if line.startswith("#"):
        return parse_header(line[1:], 1)
    if line.startswith("* "):
        return f"<li>{fix_line(line[2:])}</li>"
    return f"<p>{fix_line(line)}</p>"

def rreplace(s, old, new, occurrence):
    li = s.rsplit(old, occurrence)
    return new.join(li)

def parse(markdown):
    s = "".join(parse_line(l) for l in markdown.splitlines())
    s = s.replace("<li>", "<ul><li>", 1)
    return rreplace(s, "</li>", "</li></ul>", 1) 


