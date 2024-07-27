// ignore_for_file: constant_identifier_names

enum GPAGrade{
  APlus(4.0, 'A+'),
  A(4.0, 'A'),
  AMinus(3.7, 'A-'),
  BPlus(3.3, 'B+'),
  B(3.0, 'B'),
  BMinus(2.7,'B-'),
  CPlus(2.3,'C+'),
  C(2, 'C'),
  CMinus(1.7, 'C-'),
  DPlus(1.4, 'D+'),
  D(1.0, 'D'),
  F(0.0, 'F');
  final double gpa;
  final String name;

  const GPAGrade(this.gpa, this.name);

   
}