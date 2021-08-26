enum Answer {
  EMPTY = 'Fine. Be that way!',
  CAPS_QUESTION = 'Calm down, I know what I\'m doing!',
  QUESTION = 'Sure.',
  ALL_CAPS = 'Whoa, chill out!',
  OTHER = 'Whatever.'
}


const isEmpty = (input: string) => input.length == 0
const isQuestion = (input: string) => input.endsWith('?')
const isAllCaps = (input: string) => input.toUpperCase() === input && input.toUpperCase() !== input.toLowerCase()
const isCapsQuestion = (input: string) => isAllCaps(input) && isQuestion(input)

const messages = [
  { criteria: isEmpty, answer: Answer.EMPTY },
  { criteria: isCapsQuestion, answer: Answer.CAPS_QUESTION },
  { criteria: isQuestion, answer: Answer.QUESTION },
  { criteria: isAllCaps, answer: Answer.ALL_CAPS }
]

class Bob {

  hey(input: string): Answer {
    input = input.trim()

    for(let message of messages) {
      if(message.criteria(input)) {
        return message.answer
      }
    }
    return Answer.OTHER
  }
}

export default Bob
