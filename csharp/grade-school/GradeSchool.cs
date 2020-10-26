using System;
using System.Collections.Generic;
using System.Linq;

public class Student {
    string _name;
    int _grade;
    public Student(string name, int grade) {
        _name = name;
        _grade = grade;
    }

    public string Name {get; }
    public string Grade {get; }
}

public class GradeSchool
{
    List<Student> _school = new List<Student>();
    public void Add(string student, int grade)
    {
        _school.Add(new Student(student, grade));
    }

    public IEnumerable<string> Roster()
    {
        return _school.Select(st => st.Name);
    }

    public IEnumerable<string> Grade(int grade)
    {
        throw new NotImplementedException("You need to implement this function.");
    }
}