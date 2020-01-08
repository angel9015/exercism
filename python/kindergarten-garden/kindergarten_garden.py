STUDENTS_LIST = ['Alice', 'Bob', 'Charlie', 'David',
    'Eve', 'Fred', 'Ginny', 'Harriet',
    'Ileana', 'Joseph', 'Kincaid', 'Larry'
]

PLANTS = {
    'G': 'Grass', 
    'C': 'Clover',
    'R': 'Radishes',
    'V': 'Violets'
}


class Garden:
    def __init__(self, diagram, students=None):
        if not students:
            self.students = STUDENTS_LIST
        else:
            self.students = sorted(students)
        
        self.diagram_lines = [[PLANTS[plant] for plant in line] for line in diagram.split('\n') ]

        
    def plants(self, student):
        idx = self.students.index(student)
        return self.diagram_lines[0][idx*2:idx*2+2] + self.diagram_lines[1][idx*2:idx*2+2]

