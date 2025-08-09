import 'addnumbers.dart';

void main() {
  //do while loop
  int i = 0;
  do {
    print("i=${i}");
    i++;
  } while (i < 5);

  //functions
  print(addNumber(8, 7));
  print(addNumberOptional(8, 7));
  print(addNumberOptionalwithDefault());
  print(addNumberOptionalNamed(num2: 2));
  print(addNumberRequiredNamed(num2: 2, num1: 5));
  print(login(email: "wasim", password: "123"));
}
