using System;
using System.Linq;

public static class Hamming
{
    public static int Distance(string firstStrand, string secondStrand)
    {
        //if (firstStrand.Length == 0 && secondStrand.Length == 0) return 0;
        if (firstStrand.Length != secondStrand.Length) throw new ArgumentException();
        //if (firstStrand.Length == 0 || secondStrand.Length == 0) throw new ArgumentException();
        return firstStrand.Zip(secondStrand, (first, second) => (first == second) ? 0 : 1).Sum();

    }
}