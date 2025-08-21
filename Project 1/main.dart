import 'dart:io';

import 'TaskManagmentSystem.dart';

void main() {
  int? choice;
  int? TaskNumber;
  do {
    PrintTask();

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
