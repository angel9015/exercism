
export const hey = (message) => {
  let isQuestion = s => s.slice(-1) == "?"
  let isCaps = s => s.toUpperCase() == s && s.toLowerCase() != s
  let isEmpty = s => s == ""
  
  message = message.trim()
  if(isEmpty(message)) {
    return "Fine. Be that way!"
  } else if(isCaps(message) && isQuestion(message)) {
    return "Calm down, I know what I'm doing!"
  } else if(isCaps(message)) {
    return "Whoa, chill out!"
  } else if(isQuestion(message)) {
    return "Sure."
  } else {
    return "Whatever."
  }
  
};
