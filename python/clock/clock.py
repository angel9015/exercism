class Clock:
    def __init__(self, hour, minute):
        hour_norm = hour % 24
        minutes_norm = minute % 60
        self.minutes = hour_norm * 60 + minute
        
    def __repr__(self):
        if self.minutes < 0 :
            self.minutes = 24*60 + self.minutes
        h = self.minutes // 60
        m = self.minutes % 60
        h = h % 24
        return f'{h:02}:{m:02}'

    def __eq__(self, other):
        return str(self) == str(other)

    def __add__(self, minutes):
        self.minutes += minutes
        return self

    def __sub__(self, minutes):
        self.minutes -= minutes
        return self

    
