using System;
using System.Collections.Generic;

public class Robot
{
    const int TOTAL_NAMES = 26 * 26 * 10 * 10 * 10;
    const int LETTER1_DIV = 26 * 10 * 10 * 10;
    const int LETTER2_DIV = 10 * 10 * 10;
    const int NUM1_DIV = 10 * 10;
    const int NUM2_DIV = 10;
    const char LETTER_A = 'A';
    static Random rnd = new Random();
    static List<int> availableNames = new List<int>();
    static Robot()
    {
        for (var i = 0; i < TOTAL_NAMES; i++)
        {
            Robot.availableNames.Add(i);
        }
    }

    static string RobotLetter(int n, int div)
    {
        char c = (char)(Math.Floor((double)n / div) + LETTER_A);
        return c.ToString();
    }

    static string TranslateName(int number)
    {
        string letter1 = RobotLetter(number, LETTER1_DIV);
        var rem = number % LETTER1_DIV;
        string letter2 = RobotLetter(rem, LETTER2_DIV);
        rem = rem % LETTER2_DIV;

        string num1 = Math.DivRem(rem, NUM1_DIV, out rem).ToString();
        string num2 = Math.DivRem(rem, NUM2_DIV, out rem).ToString();
        rem = rem % NUM2_DIV;
        string num3 = rem.ToString();

        return letter1 + letter2 + num1 + num2 + num3;
    }

    private string _name;
    public string Name
    {
        get
        {
            if (this._name != null)
            {
                return this._name;
            }

            var idx = rnd.Next(availableNames.Count);
            var nameNumber = Robot.availableNames[idx];
            Robot.availableNames.Remove(nameNumber);
            this._name = TranslateName(nameNumber);
            return this._name;

        }
    }

    public void Reset()
    {
        this._name = null;
    }
}