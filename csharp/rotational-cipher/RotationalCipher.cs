using System;
using System.Linq;

public static class RotationalCipher
{
    public static char RotSingle(char c, char a, char z, int shiftKey)
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
        c => RotSingle(c, 'a', 'z', shiftKey)
    ).Select(
        c => RotSingle(c, 'A', 'Z', shiftKey)
    ).ToArray());

}