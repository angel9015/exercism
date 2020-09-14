EARTH_ORBIT_IN_S = 31557600;

PLANET_ORBITS_RATIOS = {
  'earth': 1,
  'mercury': 0.2408467,
  'venus': 0.61519726,
  'mars': 1.8808158,
  'jupiter': 11.862615,
  'saturn': 29.447498,
  'uranus': 84.016846,
  'neptune': 164.79132
}

class SpaceAge(object):
    def __init__(self, seconds):
        self.seconds = seconds
    
    def calc_space_age(self, planet):
        return round(self.seconds / (EARTH_ORBIT_IN_S * PLANET_ORBITS_RATIOS[planet]), 2)

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