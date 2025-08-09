import 'dart:io';
import 'dart:math';

void main() {
  //  Q1. Write a program that prints the
  // Fibonacci sequence up to a given number using a for loop.

  // Example:
  // Input:
  // 10

  // Output:
  // 0 1 1 2 3 5 8
  print("enter number");
  int? n = int.parse(stdin.readLineSync()!);
  int oldNum = 0;
  int newNum = 1;
  for (var i = 1; i <= n; i++) {
    print(oldNum);
    int temp = oldNum + newNum;
    oldNum = newNum;
    newNum = temp;
  }
  // Q2.  Implement a code that finds the
  // largest element in a list using a for loop.

  // Example:
  // Input:
  // [3, 9, 1, 6, 4, 2, 8, 5, 7]

  // Output:
  // Largest element: 9

  List lst = [3, 9, 1, 6, 4, 2, 8, 5, 7];
  int largest = lst[0];
  for (var i = 0; i < lst.length; i++) {
    if (lst[i] > largest) {
      largest = lst[i];
    }
  }
  print(largest);
  // Q3. Write a program that prints the
  // multiplication table of a given number using a for loop.

  // Example: Input: 5

  // Output:
  // 5 x 1= 5

  // 5 x 2= 10

  // 5 x 3= 15
  // ...
  // ...
  // ...
  // 5 x 10 = 50
  print("enter number");

  int? number = int.parse(stdin.readLineSync()!);
  for (var i = 1; i <= 10; i++) {
    print("$number x $i= ${i * number}");
  }

  // Q4. Implement a function that checks if a given string is a
  // palindrome.

  // Example:

  // Input:
  // "radar"

  // Output:
  // "radar" is a palindrome.
  String strInput = stdin.readLineSync()!;
  String rev = strInput.split('').reversed.join('');
  if (strInput == rev)
    print("Plandrome");
  else
    print("Not Plandrome");
  // Q5. Write a program to make such a
  // pattern like a right angle triangle with a number which will repeat a number in
  // a row. The pattern like :
  //  1

  //  22

  //  333

  //  4444
  for (var i = 0; i < 9; i++) {
    for (var j = 0; j <= i; j++) {
      stdout.write(i + 1);
    }
    print(" ");
  }
  // Q6. Write a program that takes a list
  // of numbers as input and prints the numbers greater than 5 using a for loop and
  // if-else condition.

  var lstNum = [];
  for (var i = 0; i < 5; i++) {
    int? number = int.parse(stdin.readLineSync()!);
    lstNum.add(number);
  }
  print("Numbers in list that are greater than 5");
  for (var i = 0; i < 5; i++) {
    if (lstNum[i] > 5) {
      print(lstNum[i]);
    }
  }

  // Q7.  Write a program that counts the
  // number of vowels in a given string using a for loop and if-else condition.
  String strString = stdin.readLineSync()!;
  int count = 0;
  for (var i = 0; i < strString.length; i++) {
    if (strString[i] == 'a')
      count++;
    else if (strString[i] == 'e')
      count++;
    else if (strString[i] == 'i')
      count++;
    else if (strString[i] == 'o')
      count++;
    else if (strString[i] == 'u')
      count++;
    else {}
  }
  print(count);

  // Q8. Write a Dart program that counts the number of digits in a given number using a while loop.
  number = int.parse(stdin.readLineSync()!);
  count = 0;
  int nn = number;
  while (nn != 0) {
    nn ~/= 10;
    count++;
  }
  print(count);
  // Q9. Implement Dart code to generate a random password of a given length using a while loop.
  String password = "";
  while (password.length < 10) {
    var intValue = Random().nextInt(10);
    password = password + intValue.toString();
  }
  print(password);
  // Q10. Create a Dart program that checks if a given string is empty or not using if-else statements.
  //                                                         OR
  // Q10. Implement Dart code to print the multiplication table of a given number using a while loop.

  print("enter number");

  number = int.parse(stdin.readLineSync()!);
  var i = 1;
  while (i <= 10) {
    print("$number x $i= ${i * number}");
    i++;
  }
}
