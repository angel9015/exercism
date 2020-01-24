import re


class Luhn:
    def __init__(self, card_num):
        self.card_num = card_num

    def valid(self):
        if re.search('[^0-9 ]', self.card_num):
            return False

        digits = [int(d) for d in self.card_num.replace(' ','').replace('-','')]

        if len(digits) == 1 and digits[0] == 0:
            return False

        acc = 0
        for idx, d in enumerate(reversed(digits)):
            acc += (d * 2 if d < 5 else d * 2 - 9) if idx % 2 else d

        return False if acc % 10 else True
        