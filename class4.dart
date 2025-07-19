import 'dart:io';

void main() {
  // Assignment 1
  List stdNames = ["Wasim", "Aslam", "Irfan"];
  print(stdNames);
  print(stdNames[2]);

  List stdMatrix = [
    [10, 12, 1, 1, 12],
    [0, 2, 0, 45, 62],
  ];
  print(stdMatrix[1][3]);

  print(stdNames.length);
  print(stdNames[stdNames.length - 1]);
  stdNames.clear();
  stdNames = ["Wasim", "Aslam", "Irfan"];

  if (stdNames.length > 0) print(stdNames.first);
  print(stdNames.reversed.toList());
  print(stdNames.isEmpty);
  print(stdNames.isNotEmpty);
  //CRUD
  //Create
  stdNames.add("Akram");
  stdNames.addAll(["Wasim", "Aslam", "Irfan"]);
  //Read
  print(stdNames);
  print(stdNames[2]);
  //Update
  stdNames[0] = "Hira";
  print(stdNames);

  stdNames.replaceRange(1, 2, ["Ayesha", "Mirha"]);
  print(stdNames);
  //ascending sort
  stdNames.sort();
  print(stdNames);
  //decending
  stdNames.sort((b, a) => a.compareTo(b));
  print(stdNames);

  stdNames.insert(0, "Hashat");
  print(stdNames);
  stdNames.insertAll(2, ["Wasim", "Aslam", "Irfan"]);
  print(stdNames);
  print(stdNames.indexOf("Mirha"));
  //Delete
  stdNames.remove("Mirha");

  print(stdNames);
  stdNames.removeAt(5);
  print(stdNames);

  List numbers = [43, 89, 99, 13, 7, 88, 1, 22, 33];
  numbers.sort();
  print(numbers.reversed);
}
