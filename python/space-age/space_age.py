EARTH_ORBIT_IN_S = 31557600;

PLANET_ORBITS_IN_S = {
  'earth': 1 * EARTH_ORBIT_IN_S,
  'mercury': 0.2408467 * EARTH_ORBIT_IN_S,
  'venus': 0.61519726 * EARTH_ORBIT_IN_S,
  'mars': 1.8808158 * EARTH_ORBIT_IN_S,
  'jupiter': 11.862615 * EARTH_ORBIT_IN_S,
  'saturn': 29.447498 * EARTH_ORBIT_IN_S,
  'uranus': 84.016846 * EARTH_ORBIT_IN_S,
  'neptune': 164.79132 * EARTH_ORBIT_IN_S
}

def calc_space_age(seconds, planet):
    return round(seconds / (PLANET_ORBITS_IN_S[planet]), 2)



class SpaceAge(object):
    def __init__(self, seconds):
        self.seconds = seconds
        for planet in PLANET_ORBITS_IN_S.keys():
            setattr(self, 'on_' + planet, (lambda p: lambda: calc_space_age(self.seconds, p))(planet))
            
            