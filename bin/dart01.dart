String request1() {
  return "******\n*****\n****\n***\n**\n*";
}

bool request2(String word) {
  return word == word.split('').reversed.join('') ? true : false;
}

int request3(int base, int heigth) {
  return base * heigth;
}

int request4(int a, int b) {
  return a == b ? (a + a) * 3 : a + b;
}

String request5(int writtenTest, int practicalTest) {
  if (writtenTest <= -8 || writtenTest > 8) {
    return 'written test vote must be in [-8,+8]';
  }

  if (practicalTest < 0 || practicalTest > 24) {
    return "practical test must be in [0, 24]";
  }

  int vote = writtenTest + practicalTest;
  String result = "";
  if (vote < 18) {
    result = "You have failed the exam with: $vote";
  } else {
    result = vote > 30
        ? "You're final vote is 30 cum laude"
        : 'You passed the exam with: $vote';
  }

  return result;
}

double request7(List<int> numbers) {
  return numbers.reduce((a, b) => a + b) / numbers.length;
}

abstract class Person {
  String name;
  String lastName;
  String code;
  int age;

  Person(this.name, this.lastName, this.code, this.age);
}



class Teacher extends Person {
  Teacher(super.name, super.lastName, super.code, super.age);

  String getName() => name;
  String getLastName() => lastName;
  String getCode()=> code;
  int getAge() => age;
}

class Student extends Person {
  Student(super.name, super.lastName, super.code, super.age);

  String getName() => name;
  String getLastName() => lastName;
  String getCode()=> code;
  int getAge() => age;
}

class University{
  List<Teacher> teachers = [];
  List<Student> students = [];


  void addTeacher(Teacher t) => teachers.add(t);
  void addStudent(Student s) => students.add(s);

  Teacher? findTeacherByCode(String code) {
    return teachers.firstWhere((t) => t.getCode() == code);
  }

  Teacher? findTeacherByLastName(String lastName) {
    return teachers.firstWhere((t) => t.getLastName() == lastName);
  }

  Student? findStudentByCode(String code) {
    return students.firstWhere((s) => s.getCode() == code);
  }

  Student? findStudentByLastName(String lastName) {
    return students.firstWhere((s) => s.getLastName() == lastName);
  }

  double meanOfStudentsAge() {
    return students.map((s) => s.getAge()).reduce((a,b) => a + b) / students.length;
  }

  double meanOfTeachersAge() {
    return teachers.map((t) => t.getAge()).reduce((a,b) => a + b) / teachers.length;
  }



}

void main() async {
  print(request1());
  print(request2('ingegni'));
  print(request3(4, 6));

  print(request4(2, 3));
  print(request4(2, 2));

  print(request5(8, 9));

  print(request7([6, 3, 1, 2, 9]));

  University university = University();

  university.addTeacher(Teacher('Mario', 'Rossi', "D001", 30));
  university.addTeacher(Teacher('Luca', 'Verdi', "D002", 55));
  university.addTeacher(Teacher('Marco', 'Bianchi', "D003", 40));


  university.addStudent(Student('Alessio', 'Chen', "S001", 16));
  university.addStudent(Student('Luca', 'Neri', "S002", 22));
  university.addStudent(Student('Marta', 'Celeste', "S003", 25));

  print("Mean of students ${university.meanOfStudentsAge()}");
  print("Mean of teachers ${university.meanOfTeachersAge()}");

  print("Teacher with code D001: ${university.findTeacherByCode("D001")?.getName()}");

}
