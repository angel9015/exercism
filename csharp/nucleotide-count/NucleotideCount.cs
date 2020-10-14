using System;
using System.Collections.Generic;
using System.Linq;
using System.Diagnostics;

public static class NucleotideCount
{
    public static IDictionary<char, int> Count(string sequence)
    {
        var valid = new List<char> { 'A', 'T', 'C', 'G'};
        var q = sequence.GroupBy(x => x, x=> x);
        var d = new Dictionary<char, int> { {'A', 0} , {'T', 0}, {'C', 0}, {'G', 0}};
        foreach (var result in q)
        {
          if(!valid.Contains(result.Key)) throw new ArgumentException();
          
          Console.WriteLine(result.Key + " " + result.Count());
          d[result.Key] = result.Count();
        
        }
        return d;
    }
}