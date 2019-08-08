const EARTH_ORBIT_IN_S = 31557600;
const PLANET_ORBITS_IN_S = {
  'earth': EARTH_ORBIT_IN_S,
  'mercury': EARTH_ORBIT_IN_S * 0.2408467,
  'venus': EARTH_ORBIT_IN_S * 0.61519726,
  'mars': EARTH_ORBIT_IN_S * 1.8808158,
  'jupiter': EARTH_ORBIT_IN_S * 11.862615,
  'saturn': EARTH_ORBIT_IN_S * 29.447498,
  'uranus': EARTH_ORBIT_IN_S * 84.016846,
  'neptune': EARTH_ORBIT_IN_S * 164.79132
}

export const age = (planet, seconds) => {
  return Math.round(seconds / PLANET_ORBITS_IN_S[planet] * 100) / 100;
};
