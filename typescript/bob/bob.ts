
const isEmpty = (input: string) => input.length == 0
const isQuestion = (input: string) => input.endsWith('?')
const isAllCaps = (input: string) => input.toUpperCase() === input && input.toUpperCase() !== input.toLowerCase()

class Bob {

  hey(input: string) {
    input = input.trim()
    if (isEmpty(input)) {
      return 'Fine. Be that way!'
    }

    if (isQuestion(input) && isAllCaps(input)) {
      return 'Calm down, I know what I\'m doing!'
    }

    if (isQuestion(input)) {
      return 'Sure.'
    }
    if (isAllCaps(input)) {
      return 'Whoa, chill out!'
    }
    

    return 'Whatever.';
  }
}

export default Bob
