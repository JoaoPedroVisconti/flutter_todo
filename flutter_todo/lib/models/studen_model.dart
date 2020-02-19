class Student{
  String studentId;
  String studentName;
  int studentScore;

  Student({
    this.studentId,
    this.studentName,
    this.studentScore
  });

  factory Student.fromJson(Map<String, dynamic> parsedJson){
    return Student(
      studentId: parsedJson['id'],
      studentName: parsedJson['name'],
      studentScore: parsedJson['score'],
    );
  }
}