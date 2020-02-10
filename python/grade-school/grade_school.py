class School:
    def __init__(self):
        self.students = []

    def add_student(self, name, grade):
        self.students.append(dict(name=name, grade=grade))

    def roster(self):
        return [st['name'] for st in sorted(
                self.students,
                key=lambda s: (s['grade'], s['name'])
            )
        ]

    def grade(self, grade_number):
        return sorted(st['name'] for st in self.students if st['grade'] == grade_number)
    
