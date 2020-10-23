using System;
using System.Collections.Generic;

public enum Allergen
{
    Eggs = 1,
    Peanuts = 2,
    Shellfish = 4,
    Strawberries = 8,
    Tomatoes = 16,
    Chocolate = 32,
    Pollen = 64,
    Cats = 128
}

public class Allergies
{
    private Allergen[] _allergens;
    public Allergies(int mask)
    {
        List<Allergen> allergens = new List<Allergen>();
        var allAllergens = Enum.GetValues(typeof(Allergen));
        foreach (Allergen a in allAllergens) {
            if( (mask & (int)a) != 0) {
                allergens.Add(a);
            }
        }
        _allergens = allergens.ToArray();

    }

    public bool IsAllergicTo(Allergen allergen) => Array.FindIndex(_allergens, x=> x==allergen) >=0 ;
    
    public Allergen[] List() =>  _allergens;
    
}