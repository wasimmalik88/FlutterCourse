void main() {
  // Assignment 1
  print("Hello World");
  bool isAssignmentDone = true;
  if (isAssignmentDone) {
    print("Good Work");
  } else {
    print("Try again");
  }

  int assignmentDone = 4;
  int minassignmentRequired = 4;
  bool lastClassAttended = true;

  if (assignmentDone >= minassignmentRequired) {
    print("come in class...");
    bool assignmentCorrect = true;

    if (assignmentCorrect) {
      print("assignment correct keep sitting");
    } else {
      print("get out again");
    }
  } else if (lastClassAttended) {
    print("come in class but assignment should be done by 11PM");
  } else {
    print("get out again");
  }

  //quiz create a marksheet and grade it
  int Marks = 28;
  if (Marks >= 90 && Marks <= 100) {
    print("A");
  } else if (Marks >= 80 && Marks <= 89) {
    print("B");
  } else if (Marks >= 70 && Marks <= 79) {
    print("C");
  } else if (Marks >= 60 && Marks <= 69) {
    print("D");
  } else {
    print("F");
  }
}
