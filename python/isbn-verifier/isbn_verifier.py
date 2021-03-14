import re 

def is_valid(isbn):
    if not re.match("^[0-9-]+[0-9X]$", isbn, ):
        return False
    digits = [int(x) if x.isdigit() else 10 for x in isbn if x.isdigit() or x == "X"]
    if len(digits)!=10:
        return False
    
    return sum(a*b for a,b in zip(digits, range(len(digits), 0, -1)))%11 == 0

is_valid("3-598-21508-8")