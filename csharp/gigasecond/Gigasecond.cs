using System;

public static class Gigasecond
{
    static readonly int GS = 1000000000;
    public static DateTime Add(DateTime moment)
    {
        return moment.AddSeconds(GS);
    }
}