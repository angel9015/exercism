HOURS_IN_DAY = 24
MINUTES_IN_HOUR = 60
MINUTES_IN_A_DAY = HOURS_IN_DAY * MINUTES_IN_HOUR

class Clock:
    def __init__(self, hour, minute):
        hour_norm = hour % HOURS_IN_DAY
        self.minutes = hour_norm * MINUTES_IN_HOUR + minute
        self.minutes = self.minutes % MINUTES_IN_A_DAY

        if self.minutes < 0 :
            self.minutes = MINUTES_IN_A_DAY + self.minutes

    def __repr__(self):
        h = self.minutes // MINUTES_IN_HOUR
        m = self.minutes % MINUTES_IN_HOUR
        return f'{h:02}:{m:02}'

    def __eq__(self, other):
        return str(self) == str(other)

    def __add__(self, minutes):
        return Clock(0, self.minutes + minutes)

    def __sub__(self, minutes):
        return Clock(0, self.minutes - minutes)


