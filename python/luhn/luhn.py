import re


class Luhn:
    def __init__(self, card_num):
        self.card_num = card_num

    def valid(self):
        if re.search('[^0-9 ]', self.card_num):
            return False
        
        clean_card_num = self.card_num.replace(' ','').replace('-','')
        digits = list(reversed([int(d) for d in clean_card_num]))

        if len(digits) < 2:
            return False

        acc = sum((d * 2 if d < 5 else d * 2 - 9) if idx % 2 else d for idx, d in enumerate(digits))
            
        return not acc % 10
        