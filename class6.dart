import 'dart:io';

void main() {
  int step = 0;
  //step = step + 1;
  step++;
  print(step);
  print(++step);
  print(step++);
  print(step);
  int a = 1;
  int b = 2;
  int c = 3;
  var abc = a++ + b++;
  print(abc);
  var xyz = ++c + abc;
  print(xyz);
  var dfg = (abc + xyz) - c;
  print(dfg);
  var last = (++abc - ++dfg) + xyz++;
  print(last);

  int mno = 0;
  xyz = 0;
  abc = 0;
  a = mno++ + ++mno - xyz--;
  b = ++a + --mno + --abc;
  c = a++ - --b - --b + ++a - b + a;
  print(++c);

  // loops
  for (var i = 1; i <= 10; i++) {
    print("2x $i= ${i * 2}");
  }

  //print list with loopps
  List lstDays = [
    "Monday",
    "Tuesday",
    "Wednessday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  //print lists with nested loopps
  List lstName = ["Wasim", "Malik"];
  for (var i = 0; i < lstDays.length; i++) {
    print("====================");
    print(lstDays[i]);
    print("====================");
    for (var j = 0; j < lstName.length; j++) {
      print(lstName[j]);
    }
  }

  // for in loop
  for (var element in lstDays) {
    print(element);
  }
  //while loop
  String email = "wasim@gmail.com";
  String pass = "test";
  var loginAttempts = 0;
  print("enter email");
  String emailinput = stdin.readLineSync()!;
  while (true) {
    print("enter password");
    String userpass = stdin.readLineSync()!;
    if (userpass == pass && emailinput == email) {
      print("login succefull");
      print("if you want to print table enter number");
      int? number = int.parse(stdin.readLineSync()!);
      for (var i = 1; i <= 10; i++) {
        print("$number x $i= ${i * number}");
      }
      break;
    } else {
      print("login attempts time=$loginAttempts");
      loginAttempts++;
    }
    if (loginAttempts == 5) break;
  }
}
