# Game status categories
STATUS_WIN = "win"
STATUS_LOSE = "lose"
STATUS_ONGOING = "ongoing"


class Hangman(object):
    def __init__(self, word):
        self.remaining_guesses = 9
        self.status = STATUS_ONGOING
        self.word = word
        self.masked_word = '_' * len(word)

    def guess(self, char):
        if self.status != STATUS_ONGOING:
            raise ValueError("Game over!")

        if char in self.word:
            masked_word_list = list(self.masked_word)
            word_list = list(self.word)

            for i,c in enumerate(word_list):
                if(self.word[i] == char):
                    masked_word_list[i] = self.word[i]
                    word_list[i] = '_'

            self.masked_word = "".join(masked_word_list)
            self.word = "".join(word_list)

            if '_' not in self.masked_word:
                self.status = STATUS_WIN

        else:
            self.remaining_guesses-=1
            if self.remaining_guesses < 0:
                self.status = STATUS_LOSE

    def get_masked_word(self):
        return self.masked_word

    def get_status(self):
        return self.status
