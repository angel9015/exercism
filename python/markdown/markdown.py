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
    # s = s.replace("</li>\n<li>", "</li><li>" )
    s = s.replace("<li>", "<ul><li>", 1)
    return rreplace(s, "</li>", "</li></ul>", 1) 



def parse0(markdown):
    lines = markdown.split('\n')
    res = ''
    in_list = False
    in_list_append = False
    for i in lines:
        if re.match('###### (.*)', i) is not None:
            i = '<h6>' + i[7:] + '</h6>'
        elif re.match('## (.*)', i) is not None:
            i = '<h2>' + i[3:] + '</h2>'
        elif re.match('# (.*)', i) is not None:
            i = '<h1>' + i[2:] + '</h1>'
        m = re.match(r'\* (.*)', i)
        if m:
            if not in_list:
                in_list = True
                is_bold = False
                is_italic = False
                curr = m.group(1)
                m1 = re.match('(.*)__(.*)__(.*)', curr)
                if m1:
                    curr = m1.group(1) + '<strong>' + \
                        m1.group(2) + '</strong>' + m1.group(3)
                    is_bold = True
                m1 = re.match('(.*)_(.*)_(.*)', curr)
                if m1:
                    curr = m1.group(1) + '<em>' + m1.group(2) + \
                        '</em>' + m1.group(3)
                    is_italic = True
                i = '<ul><li>' + curr + '</li>'
            else:
                is_bold = False
                is_italic = False
                curr = m.group(1)
                m1 = re.match('(.*)__(.*)__(.*)', curr)
                if m1:
                    is_bold = True
                m1 = re.match('(.*)_(.*)_(.*)', curr)
                if m1:
                    is_italic = True
                if is_bold:
                    curr = m1.group(1) + '<strong>' + \
                        m1.group(2) + '</strong>' + m1.group(3)
                if is_italic:
                    curr = m1.group(1) + '<em>' + m1.group(2) + \
                        '</em>' + m1.group(3)
                i = '<li>' + curr + '</li>'
        else:
            if in_list:
                in_list_append = True
                in_list = False

        m = re.match('<h|<ul|<p|<li', i)
        if not m:
            i = '<p>' + i + '</p>'
        m = re.match('(.*)__(.*)__(.*)', i)
        if m:
            i = m.group(1) + '<strong>' + m.group(2) + '</strong>' + m.group(3)
        m = re.match('(.*)_(.*)_(.*)', i)
        if m:
            i = m.group(1) + '<em>' + m.group(2) + '</em>' + m.group(3)
        if in_list_append:
            i = '</ul>' + i
            in_list_append = False
        res += i
    if in_list:
        res += '</ul>'
    return res
