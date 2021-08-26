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

const Mapper: Record<keyof typeof Answer, (input: string)=>boolean> = {
  EMPTY: isEmpty,
  CAPS_QUESTION: isCapsQuestion,
  QUESTION: isQuestion,
  ALL_CAPS: isAllCaps,
  OTHER: () => true
}

class Bob {

  hey(input: string): Answer {
    input = input.trim()

    for(const key of  typeof Answer) {
      
        let f = Mapper[key]
        if(f(input)) {
          return Answer[key]
        }
      
    }
    return Answer.OTHER
  }
}

export default Bob
