void main() {
  //Data Types
  String Name = "Wasim";
  print(Name);
  int age = 37;
  print(age);
  double stdPercent = 98.93;
  print(stdPercent);
  num Number = 91.1;
  print(Number);
  bool isLogin = false;
  print(isLogin);
  print(20 > 10);
  print(
    "My name is ${Name}. I am ${age} years old. I have got ${stdPercent} percentage. ",
  );
  //Arithematics Operators
  int a = 5;
  int b = 2;
  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a % b);
  print(a ~/ b);

  //Equality and releational operators
  print("Equality and releational operators");
  a = 5;
  b = 2;
  print(a > b);
  print(a < b);
  print(a <= b);
  print(a >= b);
  print(a != b);
  print(a == b);
  //Logical Operators
  print("Logical Operators");
  bool t = true;
  bool f = false;
  print(t && f);
  print(f || t);
  print(!t);
  print((t && !f) && (t && f));

  //quiz
  print("quiz");
  int ab, mn, xy;
  ab = 38;
  mn = 45;
  xy = 8;
  bool aa = ab > mn; // false
  print(aa);
  bool bb = !(xy < mn); // false
  print(bb);
  print(!(aa && bb) || aa || bb); // true

  //end
}
