import 'dart:io';

void main() {
  //   Q.1: Create two integer variables length and breadth and assign values then check if they are square values or rectangle values.
  // ie: if both values are equal then it's square otherwise rectangle.
  int length = 65;
  int breadth = 65;
  if (length == breadth)
    print("it is square");
  else
    print("it is rectangle");

  //Q.2: Take two variables and store age then using if/else condition to determine oldest and youngest among them.

  int personA = 98;
  int personB = 87;
  if (personA > personB)
    print("Person A oldest");
  else
    print("Person B oldest");

  //     Q.3: A student will not be allowed to sit in exam if his/her attendance is less than 75%. Create integer variables and assign value:
  // Number of classes held = 16,
  // Number of classes attended = 10,
  // and print percentage of class attended.
  // Is student is allowed to sit in exam or not?

  int totalClasses = 16;
  int attendedClasses = 10;
  num Percentage = attendedClasses / totalClasses * 100;
  print("Percentage ${Percentage}");
  if (Percentage > 75)
    print("Allowed in exam");
  else
    print("Not allowed in exam");
  //     Q.4: Create integer variable assign any year to it and check if a year is leap year or not.
  // If a year is divisible by 4 then it is leap year but if the year is century year like 2000, 1900, 2100 then it must be divisible by 400.
  // i.e: Use % ( modulus ) operator.
  int year = 2100;

  num secondLastDigit = (year % 100) ~/ 10;
  num LastDigit = (year % 10);

  if (secondLastDigit == 0 && LastDigit == 0) {
    if (year % 400 == 0)
      print("leap year");
    else
      print("Not leap year");
  } else {
    if (year % 4 == 0)
      print("leap year");
    else
      print("Not leap year");
  }

  //   Q.5  Write a program to read temperature in centigrade and display a suitable message according to temperature:
  // You have num variable temperature = 42;
  // Now print the message according to temperature:
  // temp < 0 then Freezing weather
  // temp 0-10 then Very Cold weather
  // temp 10-20 then Cold weather
  // temp 20-30 then Normal in Temp
  // temp 30-40 then Its Hot
  // temp >=40 then Its Very Hot

  num temperature = 35;
  if (temperature < 0)
    print("Freezing weather");
  else if (temperature >= 0 && temperature <= 10)
    print("Very Cold weather");
  else if (temperature >= 11 && temperature <= 20)
    print("Cold weather");
  else if (temperature >= 21 && temperature <= 30)
    print("Normal");
  else if (temperature >= 31 && temperature < 40)
    print("Its Hot");
  else if (temperature >= 40)
    print("Its Very Hot");

  //     Q6. Create a variable marks and assign any integer value between 0 and 100. Then use if/else conditions to assign a grade:
  // Marks >= 90: Grade A
  // Marks >= 80 and < 90: Grade B
  // Marks >= 70 and < 80: Grade C
  // Marks >= 60 and < 70: Grade D
  // Marks < 60: Grade F

  int Marks = 95;
  if (Marks >= 90) {
    print("Grade A");
  } else if (Marks >= 80 && Marks < 90) {
    print("Grade B");
  } else if (Marks >= 70 && Marks < 80) {
    print("Grade C");
  } else if (Marks >= 60 && Marks <= 70) {
    print("Grade D");
  } else {
    print("Grade F");
  }

  //Q7. Check whether a number is even or not.
  int? numberOne = int.parse(stdin.readLineSync()!);
  if (numberOne % 2 == 0) {
    print("${numberOne} is Even");
  } else {
    print("${numberOne} is Odd");
  }

  //Q8.  assume a number and check whether it is a multiple of 3 or 5.
  // also bonus number input task
  int? number = int.parse(stdin.readLineSync()!);
  if (number % 3 == 0 || number % 5 == 0) {
    print("multiple of 3 or 5");
  } else {
    print("not a multiple of 3 or 5");
  }
}
