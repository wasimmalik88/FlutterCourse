void main() {
  //   Q.1: Create a list of names and print all names using list.
  List stdNames = ["Wasim", "Aslam", "Irfan"];
  print(stdNames);

  // Q.2: Create an empty list of type string called days. Use the add method to add names of 7 days and print all days.
  List lstDays = [];
  lstDays.add("Monday");
  lstDays.add("Tuesday");
  lstDays.add("Wednessday");
  lstDays.add("Thursday");
  lstDays.add("Friday");
  lstDays.add("Saturday");
  lstDays.add("Sunday");

  print(lstDays);
  // Q.3: Create a list of Days and remove one by one from the end of list.
  lstDays.removeLast();
  print(lstDays);
  lstDays.removeLast();
  print(lstDays);
  lstDays.removeLast();
  print(lstDays);
  lstDays.removeLast();
  print(lstDays);
  lstDays.removeLast();
  print(lstDays);
  lstDays.removeLast();
  print(lstDays);
  lstDays.removeLast();
  print(lstDays);

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
  // Q.5: Create a map with name, phone keys and store some values to it. Use where to find all keys that have length 4.
  Map studentData = {"name": "wasim", "phone": 03345074506, "age": 33};
  print(studentData.keys.where((key) => key.length == 4).toList());
  // Q.6: Create Map variable name world then inside it create countries Map, Key will be the name country & country value will have another map having capitalCity, currency and language to it. by using any country key print all the value of Capital & Currency.
  Map world = {
    'Pakistan': {
      'capitalCity': 'Islamabad',
      'currency': 'PKR',
      'language': 'Urdu',
    },
    'USA': {
      'capitalCity': 'Washington',
      'currency': 'USD',
      'language': 'English',
    },
  };
  print(world["Pakistan"]);
  // Q.7:
  // Map<String, double> expenses = {
  //   'sun': 3000.0,
  //   'mon': 3000.0,
  //   'tue': 3234.0,
  // };

  // Check if "fri" exist in expanses; if exist change it's value to 5000.0 otherwise add 'fri' to expenses and set its value to 5000.0 then print expenses.
  Map<String, double> expenses = {'sun': 3000.0, 'mon': 3000.0, 'tue': 3234.0};
  print(expenses);
  expenses.putIfAbsent("fri", () => 5000.0);
  print(expenses);
  // Q.8: remove all false values from below list by using removeWhere or retainWhere property.

  // List<Map<String, bool>> usersEligibility = [
  // {'name': 'John', 'eligible': true},
  // {'name': 'Alice', 'eligible': false},
  // {'name': 'Mike', 'eligible': true},
  // {'name': 'Sarah', 'eligible': true},
  // {'name': 'Tom', 'eligible': false},
  // ];
  //changed to dynamic due to error
  List<Map<String, dynamic>> usersEligibility = [
    {'name': 'John', 'eligible': true},
    {'name': 'Alice', 'eligible': false},
    {'name': 'Mike', 'eligible': true},
    {'name': 'Sarah', 'eligible': true},
    {'name': 'Tom', 'eligible': false},
  ];
  usersEligibility.removeWhere((user) => user['eligible'] == false);

  print(usersEligibility);
  // Q.9: Given a list of integers, write a dart code that returns the maximum value from the list.
  lstNumbers = [151, 551, 1, 151, 212, 145, 153, 11, 51, 54, 5341, 212, 453, 1];
  lstNumbers.sort();

  print("maximum number is : ${lstNumbers.last}");
  // Q.10: Write a Dart code that takes in a list of strings and removes any duplicate elements, returning a new list without duplicates. The order of elements in the new list should be the same as in the original list.
  stdNames = ["Wasim", "Aslam", "Wasim", "Irfan"];
  print(stdNames.toSet().toList());

  // Q 11: Write a Dart code that takes in a list and an integer n as parameters. The program should print a new list containing the first n elements from the original list.
  List lstNumber = [
    12,
    1,
    21,
    21,
    121,
    1,
    8,
    65,
    4,
    2151,
    6121,
    48541,
    4415,
    2151,
    1215,
  ];
  int n = 7;
  print(lstNumber.getRange(0, n).toList());
  // Q.12: Write a Dart code that takes in a list of strings and prints a new list with the elements in reverse order. The original list should remain unchanged.
  lstDays = [];
  lstDays.add("Monday");
  lstDays.add("Tuesday");
  lstDays.add("Wednessday");
  lstDays.add("Thursday");
  lstDays.add("Friday");
  lstDays.add("Saturday");
  lstDays.add("Sunday");
  List lstNewList = lstDays.reversed.toList();
  print(lstDays); //orignal list
  print(lstNewList); //reversed list
  // Q.13: Implement a code that takes in a list of integers and returns a new list containing only the unique elements from the original list. The order of elements in the new list should be the same as in the original list.
  print(lstNumber.toSet().toList());
  // Q.14: Write a Dart code that takes in a list of integers and prints a new list with the elements sorted in ascending order. The original list should remain unchanged.

  List<int> lstNumberList = List.from(lstNumber);
  lstNumberList.sort();
  print(lstNumber); //orignal list
  print(lstNumberList); //sorted list

  // Q.15: Implement a Dart code that uses the where() method to filter out negative numbers from a list of integers. The program should take in the original list as a parameter and print a new list containing only the positive numbers.
  lstNumber = [
    12,
    -1,
    21,
    21,
    -121,
    1,
    -8,
    65,
    -4,
    2151,
    -6121,
    48541,
    -4415,
    2151,
    -1215,
  ];
  List lstPositiveNumbers = lstNumber.where((x) => x > 0).toList();
  print(lstPositiveNumbers);
  // Q.16: Implement a Dart code that uses the where() method to filter out odd numbers from a list of integers. The program should take in the original list as a parameter and print a new list containing only the even numbers.
  List lstOddNumbers = lstNumber.where((x) => x % 2 != 0).toList();
  print(lstOddNumbers);
  // Q.17: Given a list of integers, write a Dart code that uses the map() method to create a new list with each value squared. The program should take in the original list as a parameter and print the new list.
  print(lstNumber.map((x) => x * x).toList());
  // Q.18: Create a map named "person" with the following key-value pairs: "name" as "John", "age" as 25, "isStudent" as true. Write a Dart code to check if the person is both a student and over 18 years old. Print "Eligible" if both conditions are true, otherwise print "Not eligible".
  Map<String, dynamic> person = {'name': 'John', 'age': 25, 'isStudent': false};
  if (person['isStudent'] == true && person['age'] > 18) {
    print('Eligible');
  } else {
    print('Not eligible');
  }
  // Q.19: Given a map representing a product with keys "name", "price", and "quantity", write Dart code to check if the product is in stock. If the quantity is greater than 0, print "In stock", otherwise print "Out of stock".
  Map<String, dynamic> product = {
    'name': 'Shampoo',
    'price': 250,
    'quantity': 3,
  };
  if (product['quantity'] > 0) {
    print('In stock');
  } else {
    print('Out of stock');
  }
  // Q.20: Create a map named "car" with the following key-value pairs: "brand" as "Toyota", "color" as "Red", "isSedan" as true. Write Dart code to check if the car is a sedan and red in color. Print "Match" if both conditions are true, otherwise print "No match".
  Map<String, dynamic> car = {
    'brand': 'Toyota',
    'color': 'red',
    'isSedan': true,
  };
  if (car['brand'] == "Toyota" && car['color'] == "red") {
    print('Match');
  } else {
    print('No match');
  }
  // Q.21: Given a map representing a user with keys "name", "isAdmin", and "isActive", write Dart code to check if the user is an active admin. If the user is both an admin and active, print "Active admin", otherwise print "Not an active admin".
  Map<String, dynamic> user = {
    'name': 'Wasim',
    'isAdmin': true,
    'isActive': true,
  };
  if (user['isAdmin'] == true && user['isActive'] == true) {
    print('Active admin');
  } else {
    print('Not an Active admin');
  }
  // Q.22: Given a map representing a shopping cart with keys as product names and values as quantities, write Dart code to check if a product named "Apple" exists in the cart. Print "Product found" if it exists, otherwise print "Product not found".
  Map<String, int> shoppingCart = {'Banana': 5, 'Apple': 3, 'Orange': 2};
  if (shoppingCart.containsKey('Apple')) {
    print('Product found');
  } else {
    print('Product not found');
  }
}
