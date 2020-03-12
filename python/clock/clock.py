class Clock:
    def __init__(self, hour, minute):
        hour_norm = hour % 24
        minutes_norm = minute % 60
        self.minutes = hour_norm * 60 + minute
        if self.minutes < 0 :
            self.minutes = 24*60 + self.minutes
        
    def __repr__(self):      
        h = (self.minutes // 60) % 24
        m = self.minutes % 60
        return f'{h:02}:{m:02}'

    def __eq__(self, other):
        return str(self) == str(other)

    def __add__(self, minutes):
        return Clock(0, self.minutes + minutes)
        

    def __sub__(self, minutes):
        return Clock(0, self.minutes - minutes)
        return self

    
