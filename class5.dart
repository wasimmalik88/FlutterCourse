import 'dart:io';

void main() {
  print("hello world");
  Map studentData = {"name": "wasim", "class": "Matric", "age": 19};
  print(studentData["class"]);

  Map<String, dynamic> studentDataBoundType = {
    "name": "wasim",
    "class": "Matric",
    "age": "19",
    "marks": [125, 51, 151, 1, 21],
  };
  print(studentDataBoundType["marks"][1]);
  print(studentDataBoundType.keys.toList());
  print(studentDataBoundType.values.toList());
  print(studentDataBoundType.length);
  print(studentDataBoundType.isEmpty);
  //studentDataBoundType.clear();
  print(studentDataBoundType.isEmpty);
  studentDataBoundType = {
    "name": "wasim",
    "class": "Matric",
    "age": "19",
    "marks": [125, 51, 151, 1, 21],
    "name": "adullah", //last key with same name is used
  };
  print(studentDataBoundType["name"]);
  studentDataBoundType["name"] = "Wasim Akram"; //update
  studentDataBoundType["fname"] = "Ali Akram"; //add if not exsist
  print(studentDataBoundType);
  studentDataBoundType.putIfAbsent("lname", () => "Bilal");
  print(studentDataBoundType);
  studentDataBoundType.addAll({"lname": "Bilal Ahmed", "address": "Home"});
  print(studentDataBoundType);
  studentDataBoundType.remove("name");
  print(studentDataBoundType);
  studentDataBoundType.removeWhere((key, value) => key == "marks");
  print(studentDataBoundType);

  Map f1 = {1: "Apple", 2: "Orange"};
  Map f2 = {3: "Banana"};
  Map f3 = {4: "Mango"};
  Map fruits = {}
    ..addAll(f1)
    ..addAll(f2)
    ..addAll(f3);
  print(fruits);
  Map fruitsMap = {...f1, ...f2, ...f3};
  print(fruitsMap);

  Map fMap = {};
  String sName = stdin.readLineSync()!;
  String sClass = stdin.readLineSync()!;
  int? sAge = int.parse(stdin.readLineSync()!);
  fMap.addAll({"name": sName, "class": sClass, "age": sAge});
  print(fMap);
}
