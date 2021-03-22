using System;

public class Clock : IEquatable<Clock>

{
    int _minutes = 0;
    public Clock(int hours, int minutes)
    {
        _minutes = (hours % 24) * 60 + minutes;
    }

    public Clock Add(int minutesToAdd)
    {
        int m = _minutes + minutesToAdd;
        return new Clock(m / 60, m%60);
    }

    public Clock Subtract(int minutesToSubtract)
    {
        int m = _minutes - minutesToSubtract;
        return new Clock(m / 60, m%60);
    }

    public override String ToString() {
        if (_minutes < 0) {
            _minutes = 24 * 60 + (_minutes % (24 * 60));
        }
        int h = (_minutes / 60) % 24;
        int m = _minutes % 60;
        return h.ToString().PadLeft(2, '0')+":" + m.ToString().PadLeft(2, '0');
    }
    
    public bool Equals(Clock c)
    {
        return this.ToString() == c.ToString();
    }
}
