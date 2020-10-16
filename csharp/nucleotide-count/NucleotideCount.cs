using System;
using System.Collections.Generic;
using System.Linq;
using System.Diagnostics;

public static class NucleotideCount
{
    public static IDictionary<char, int> Count(string sequence)
    {
        var nucleotideCounts = new Dictionary<char, int> { {'A', 0} , {'T', 0}, {'C', 0}, {'G', 0}};
        foreach(char c in sequence.ToCharArray()) {
          if(!nucleotideCounts.ContainsKey(c)) throw new ArgumentException();
          nucleotideCounts[c]++;
        }
        
        return nucleotideCounts;
    }
}