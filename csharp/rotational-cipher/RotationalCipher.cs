using System;
using System.Linq;

public static class RotationalCipher
{
    public static char rot(char c, char a, char z, int shiftKey)
    {
        if (c < a || c > z) return c;
        char r = (char)((int)c + shiftKey % 26);
        if (r > z)
        {
            int rmz = (int)r - (int)z;
            r = (char)((int)a + rmz - 1);
        }
        return r;
    }
    public static string Rotate(string text, int shiftKey) => string.Join("", text.Select(
        c => rot(c, 'a', 'z', shiftKey)
    ).Select(
        c => rot(c, 'A', 'Z', shiftKey)
    ).ToArray());

}