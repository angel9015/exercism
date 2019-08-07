//
// This is only a SKELETON file for the 'Gigasecond' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const gigasecond = (time) => {
  const GIGASECOND_IN_MS = 1e9 * 1000;
  return new Date(time.getTime() + GIGASECOND_IN_MS)
};
