using System;
using System.Collections.Generic;
using System.Linq;
using System.Diagnostics;

public static class NucleotideCount
{
    public static IDictionary<char, int> Count(string sequence)
    {
        var valid = new List<char> { 'A', 'T', 'C', 'G'};
        var nucleotideCounts = new Dictionary<char, int> { {'A', 0} , {'T', 0}, {'C', 0}, {'G', 0}};
        foreach(char c in sequence.ToCharArray()) {
          if(!valid.Contains(c)) throw new ArgumentException();
          nucleotideCounts[c]++;
        }
        
        return nucleotideCounts;
    }
}