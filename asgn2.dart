void main() {
  // 1.     Take 4 integer variables for subjects. Print the user's total marks and percentage using string concatenation.

  int Math, English, Urdu, Science;
  Math = 99;
  English = 89;
  Urdu = 93;
  Science = 88;

  print(
    "Total Marks ${Math + English + Urdu + Science} and percentage is ${(Math + English + Urdu + Science) / 400 * 100}",
  );

  /*'2.     Convert temperature from Fahrenheit to Celsius and Celsius to Fahrenheit using the formulas:
°F = (°C × 9/5) + 32
°C = (°F − 32) × 5/9'
*/

  int tempInC = 23;
  print("Temperature in Fahrenheit ${(tempInC * 9 / 5) + 32}");
  int tempInF = 55;
  print("Temperature in Celsius ${(tempInF - 32) * 5 / 9}");

  /*3.     Length and breadth of a rectangle are 5 and 7 respectively. Write a program to calculate the area of the rectangle using:
Area = length × breadth
*/

  int length = 5;
  int breadth = 7;
  print("Area of rectagle is ${length * breadth}");

  /* 4.     Create an integer variable num = 7. Add 8 to it, divide the result by 3, take the modulus with 5, then multiply the result by 5 and store it in variable i.
   Display the final result. */

  int num = 7;
  double i = (((num + 8) / 3) % 5) * 5;
  print("Result is ${i}");

  /*5.     Create two integer variables a and b. Assign values and check:
If both conditions a < 50 and a < b are true.
If at least one of them is true.
*/

  int a = 55;
  int b = 77;
  print("a < 50 and a < b  ${a < 50 && a < b}");
  print("a < 50 or a < b  ${a < 50 || a < b}");

  /*6.     Robert's marks in three subjects are 78, 45, and 62 (each out of 100).
Write a program to calculate:
Total marks
Percentage
Print his name, individual marks, total, and percentage.
*/

  int aa, bb, cc;
  aa = 78;
  bb = 45;
  cc = 62;

  print(
    "Name : Roberts Total Marks: ${aa + bb + cc} out of 300 and percentage is ${(aa + bb + cc) / 300 * 100} ",
  );

  //7.     Write a program to swap the values of two integers using a temporary variable.

  a = 55;
  b = 77;
  int x;
  x = a;
  a = b;
  b = x;
  print("a: ${a} b: ${b} ");

  //8.     Write a program that calculates the average of five given integers.
  print("average of five numbers:${(a + b + cc + aa + bb) / 5}");

  //9.     Write a program to find the maximum number among three using ternary operators or simple math logic.

  a = 10;
  b = 5;
  int c = 8;

  print("a is greatest ${a > b && a > c} ");
  print("b is greatest ${b > a && b > c} ");
  print("c is greatest ${c > b && c > a} ");
  // 10.  Write a program to calculate simple interest using the formula:
  // SI = (Principal × Rate × Time) / 100
  int Principal, Rate, Time;
  Principal = 50000;
  Rate = 15;
  Time = 15;
  double SI = (Principal * Rate * Time) / 100;
  print("Intrest is ${SI} ");

  // 11.  Write a program that calculates the square and cube of a given number.
  print("square is ${a * a} cube is ${a * a * a} ");
  // 12.  Convert total minutes (e.g., 130) into hours and remaining minutes.
  Time = 130;
  print("${Time ~/ 60} Hours  ${Time % 60} Minutes");
  // 13.  Write a program to calculate the perimeter (circumference) of a circle using:
  // Perimeter = 2 × π × radius
  // (Use dart:math for π)
  print("perimeter is ${2 * 3.14 * a} ");

  //14.  Take a 3-digit number and calculate the sum of its individual digits.
  int ThreeDigitNumber = 894;
  print(
    "sum of indivdual digits is ${((ThreeDigitNumber % 1000) ~/ 100) + ((ThreeDigitNumber % 100) ~/ 10) + ThreeDigitNumber % 10} ",
  );

  //15.  Convert a given number of days (e.g., 17) into weeks and remaining days.
  int days = 17;
  print("${(days ~/ 7)} weeks and ${(days % 7)} days ");
}
