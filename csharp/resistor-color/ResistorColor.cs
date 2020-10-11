using System;

public static class ResistorColor
{
    static string[] colors = new[] { "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white" };
    public static int ColorCode(string color) => Array.IndexOf(Colors(), color.ToLower());
    public static string[] Colors() => colors;
    
}