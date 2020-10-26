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

    public string Name {
        get {
            return _name;
        } 
    }
    public int Grade {
        get {
            return _grade; 
        }
    }
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
        return _school.OrderBy(st => st.Grade).ThenBy( st => st.Name).Select(st => st.Name).ToList().ToArray();
    }

    public IEnumerable<string> Grade(int grade)
    {
        return _school.OrderBy(st => st.Name).Where(st => st.Grade == grade).Select(st => st.Name).ToList().ToArray();
    }
}