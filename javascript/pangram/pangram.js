
const ALL_LETTERS = "abcdefghijklmnopqrstuvwxyz"

export const isPangram = (phrase) => {
  let phrase_array = [...phrase].map(x=>x.toLowerCase())
  return [...ALL_LETTERS].filter(x => !phrase_array.includes(x)).length == 0;
};
