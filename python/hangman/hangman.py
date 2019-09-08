# Game status categories
STATUS_WIN = "win"
STATUS_LOSE = "lose"
STATUS_ONGOING = "ongoing"


class Hangman(object):
    def __init__(self, word):
        self.remaining_guesses = 9
        self.status = STATUS_ONGOING
        self.word = word
        self.letters = set(l for l in word)

    def guess(self, char):
        if self.status != STATUS_ONGOING:
            raise ValueError("Game over!")

        if char in self.letters:
            self.letters.remove(char)
            if len(self.letters) == 0:
                self.status = STATUS_WIN
        else:
            self.remaining_guesses-=1
            if self.remaining_guesses < 0:
                self.status = STATUS_LOSE

    def get_masked_word(self):
        return ''.join('_' if c in self.letters else c for c in self.word)

    def get_status(self):
        return self.status
