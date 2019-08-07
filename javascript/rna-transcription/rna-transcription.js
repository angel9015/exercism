
const NUC_TRANSLATIONS = {
  'G': 'C',
  'C': 'G',
  'T': 'A',
  'A': 'U'
}

export const toRna = (strand) => {
  return strand.split("").map(
    nucl => NUC_TRANSLATIONS[nucl]
  ).join("")
};
