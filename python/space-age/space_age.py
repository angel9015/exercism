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

class SpaceAge(object):
    def __init__(self, seconds):
        self.seconds = seconds

    def calc_space_age(self, planet):
        return round(self.seconds / (PLANET_ORBITS_IN_S[planet]), 2)

    def on_earth(self):
        return self.calc_space_age('earth')

    def on_mercury(self):
        return self.calc_space_age('mercury')

    def on_venus(self):
        return self.calc_space_age('venus')

    def on_mars(self):
        return self.calc_space_age('mars')

    def on_jupiter(self):
        return self.calc_space_age('jupiter')

    def on_saturn(self):
        return self.calc_space_age('saturn')

    def on_uranus(self):
        return self.calc_space_age('uranus')

    def on_neptune(self):
        return self.calc_space_age('neptune')
