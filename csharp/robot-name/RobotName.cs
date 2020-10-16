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
    static Robot() {
        for (var i = 0; i < TOTAL_NAMES; i++) {
            Robot.availableNames.Add(i);
        }
    }

    static String robotLetter(int n, int div) {
        char c = (char)(Math.Floor((double)n/div ) + LETTER_A);
        return c.ToString();
    } 

    static String translateName(int number) {
        String letter1 = robotLetter(number, LETTER1_DIV);
        var rem = number % LETTER1_DIV;
        String letter2 = robotLetter(rem, LETTER2_DIV);
        rem = rem % LETTER2_DIV;
        String num1 = Math.Floor((double)rem / NUM1_DIV).ToString();
        rem = rem % NUM1_DIV;
        String num2 = Math.Floor((double)rem / NUM2_DIV).ToString();
        rem = rem % NUM2_DIV;
        String num3 = rem.ToString();

        return letter1 + letter2 + num1 + num2 + num3;
    }

    private string _name;
    public string Name
    {
        get
        {
            if(this._name!=null) {
                return this._name;
            }
            

            var idx = rnd.Next(availableNames.Count);
            var nameNumber = Robot.availableNames[idx];
            Robot.availableNames.Remove(nameNumber);
            this._name = translateName(nameNumber);
            return this._name;

        }
    }

    public void Reset()
    {
        this._name = null;
        
        
    }
}