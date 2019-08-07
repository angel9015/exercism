
const NUCL_TRANCRIPTIONS = {
  'G': 'C',
  'C': 'G',
  'T': 'A',
  'A': 'U'
}

export const toRna = (strand) => {
  return [...strand].map(
    nucl => NUCL_TRANCRIPTIONS[nucl]
  ).join("")
};
