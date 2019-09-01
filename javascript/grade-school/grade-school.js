export class GradeSchool {
  constructor() {
    this._roster = {};
  }

  roster() {
    let r = {}
    Object.keys(this._roster).forEach(k => {
      r[k] = this._roster[k].slice()
    })
    return r;
  }

  add(student, grade) {
    let students = this._roster[grade]
    if (!students) students = []
    students.push(student)
    students.sort()
    this._roster[grade] = students
  }

  grade(g) {
    return (this._roster[g] || []).slice()
  }
}
