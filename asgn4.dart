void main() {
  // Q.1) Create a list of names and print all names using list.
  List stdNames = ["Wasim", "Aslam", "Irfan"];
  print(stdNames);
  // Q. 2) Create a list of Days and print only  Sunday
  List lstDays = [
    "Monday",
    "Tuesday",
    "Wednessday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  print(lstDays[6]);

  // Q. 3)  create a list  of name, class, roll no, grade, percentage. And print.
  List studentInfo = ["Wasim", "B4 Fultter", 122, "A+", 99.5];
  print(studentInfo);
  // Q.4: Create a list of numbers & write a program to get the smallest & greatest number from a list.
  List lstNumbers = [
    151,
    551,
    1,
    151,
    212,
    145,
    153,
    11,
    51,
    54,
    5341,
    212,
    453,
    1,
  ];
  lstNumbers.sort();
  print(
    "Smallest number in list is :${lstNumbers.first}  and Largest number is : ${lstNumbers.last}",
  );

  // Q.5: Given a list of integers, write a dart code that returns the maximum value from the list.
  print("maximum number is : ${lstNumbers.last}");
  // Q.6: Write a Dart code that takes in a list of strings and prints a new list with the elements in reverse order. The original list should remain
  // unchanged.
  List lstNewList = lstDays.reversed.toList();
  print(lstDays); //orignal list
  print(lstNewList); //reversed list
  // Q.7: use 15 methods of Lists except retainwhere,removewhere.

  stdNames.add("Akram"); //1
  stdNames.addAll(["Wasim", "Aslam", "Irfan"]); //2
  print(stdNames);
  print(stdNames[2]);
  print(stdNames.length);
  print(stdNames[stdNames.length - 1]);
  stdNames.clear(); //3
  stdNames = ["Wasim", "Aslam", "Irfan"];
  if (stdNames.length > 0) print(stdNames.first);
  print(stdNames.reversed.toList()); //4
  print(stdNames.isEmpty);
  print(stdNames.isNotEmpty);
  //Update
  stdNames[0] = "Hira";
  print(stdNames);
  stdNames.replaceRange(1, 2, ["Ayesha", "Mirha"]); //5
  print(stdNames);
  //ascending sort
  stdNames.sort(); //6
  print(stdNames);
  //decending
  stdNames.sort((b, a) => a.compareTo(b));
  print(stdNames);
  stdNames.insert(0, "Hashat"); //7
  print(stdNames);
  stdNames.insertAll(2, ["Wasim", "Aslam", "Irfan"]); //8
  print(stdNames);
  print(stdNames.indexOf("Mirha")); //9
  //Delete
  stdNames.remove("Mirha"); //10
  print(stdNames);
  stdNames.removeAt(5); //11
  print(stdNames);

  List numbers = [43, 89, 99, 13, 7, 88, 1, 22, 33];
  numbers.sort(); //12
  print(numbers.reversed.toList()); //13
  print(numbers.indexOf(4)); //14
  print(numbers.contains(4)); //15
}
