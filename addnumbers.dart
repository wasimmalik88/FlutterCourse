//position required paramter
int addNumber(int num1, int num2) {
  return num1 + num2;
}

//positional optional parameter
int addNumberOptional([int? num1, int? num2]) {
  return (num1 ?? 0) + (num2 ?? 0);
}

//positional optional parameter with default
int addNumberOptionalwithDefault([int num1 = 9, int num2 = 7]) {
  return (num1 + num2);
}

//Optional named parameter
int addNumberOptionalNamed({int? num1, int? num2}) {
  return (num1 ?? 0) + (num2 ?? 0);
}

//Optional required parameter
int addNumberRequiredNamed({required int? num1, required int? num2}) {
  return (num1 ?? 0) + (num2 ?? 0);
}

// required and optionl combination
bool login({required String email, required String password, int? role}) {
  print(email);
  print(password);
  if (role != null) {
    if (role == 1) ;
    print("welcome admin");
    return true;
  } else {
    print("not authorized");
    return false;
  }
}
