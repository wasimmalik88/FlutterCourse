import 'dart:io';

import 'TaskManagmentSystem.dart';

void main() {
  int? choice;
  int? choiceSubMenu;
  int? TaskNumber;
  do {
    PrintTask();
    // print("Welcome to Task Managment System");
    // print("1.View Task");
    // print("2.Add Task");
    // print("3.Edit Task");
    // print("4.Remove Task");
    // print("5.Task Status");
    // print("6.Exit");
    print(
      "\n\n\n\n1.Add  2.Complete  3. Delete  4. Remove Completed   5.Edit   6.Exit ",
    );

    choice = int.parse(stdin.readLineSync()!);
    if (choice == 1)
      AddTask();
    else if (choice == 2) {
      print("Enter Task Number to mark completed:");

      TaskNumber = int.parse(stdin.readLineSync()!);
      DoneTask(TaskNumber);
    } else if (choice == 3) {
      print("Enter Task Number to delete:");

      TaskNumber = int.parse(stdin.readLineSync()!);
      DeleteTask(TaskNumber);
    } else if (choice == 4)
      DeleteCompleted();
  } while (choice != 6);
}
