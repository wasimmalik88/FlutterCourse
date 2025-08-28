// A list of maps with initial data
import 'dart:io';

TextColor? UrgentColor = TextColor.red;
TextColor? HighColor = TextColor.yellow;
TextColor? NormalColor = TextColor.white;
String Error = "";

List<Map<String, dynamic>> listOfTask = [
  {'desc': 'Do laundry', 'priority': 3, 'isdone': true},
  {'desc': 'Clean the bathroom', 'priority': 2, 'isdone': false},
  {'desc': 'Pay bills', 'priority': 1, 'isdone': false},
  {'desc': 'Call family member', 'priority': 3, 'isdone': false},
  {'desc': 'Exercise', 'priority': 1, 'isdone': true},
  {'desc': 'Read a book', 'priority': 2, 'isdone': false},
  {'desc': 'Organize closet', 'priority': 3, 'isdone': false},
];

void PrintTask() {
  listOfTask.sort((a, b) => a['priority'].compareTo(b['priority']));
  clearScreen();
  int count = 0;
  for (var item in listOfTask) {
    if (item["priority"] == 1)
      printColored(
        "${++count} : ${item["desc"]} ",
        textColor: UrgentColor,
        bold: true,
        Strikethrough: item["isdone"],
      );
    else if (item["priority"] == 2)
      printColored(
        "${++count} : ${item["desc"]} ",
        textColor: HighColor,
        bold: true,
        Strikethrough: item["isdone"],
      );
    else if (item["priority"] == 3)
      printColored(
        "${++count} : ${item["desc"]} ",
        textColor: NormalColor,
        bold: false,
        Strikethrough: item["isdone"],
      );
  }
}

void clearScreen() {
  // Moves cursor to top left and clears screen
  print("\x1B[2J\x1B[0;0H");
}

void AddTask() {
  print("enter task desc");
  String desc = stdin.readLineSync()!;
  print("enter task priority number 1.Urgent 2.High 3.Normal :");
  int? priority = int.parse(stdin.readLineSync()!);
  Map<String, dynamic> task = {
    "desc": desc,
    'priority': priority,
    'isdone': false,
  };
  listOfTask.add(task);
}

void DoneTask(int TaskNumber) {
  if (TaskNumber > listOfTask.length) {
    Error = "Error!! Task Number does not exist";
    return;
  }
  listOfTask[TaskNumber - 1]["isdone"] = true;
}

void DeleteTask(int TaskNumber) {
  if (TaskNumber > listOfTask.length) {
    Error = "Error!! Task Number does not exist";
    return;
  }
  listOfTask.remove(listOfTask[TaskNumber - 1]);
}

void DeleteCompleted() {
  listOfTask.removeWhere((task) => task['isdone'] == true);
}

TextColor? textColorFromString(String input) {
  for (var color in TextColor.values) {
    if (color.name.toLowerCase() == input.toLowerCase()) {
      return color;
    }
  }
  return null;
}

void ColorChange() {
  print(
    'Enter a color for urgent priority (black, red, green, yellow, blue, magenta, cyan, white):',
  );

  String? input = stdin.readLineSync();

  if (input != null) {
    TextColor? selectedColor = textColorFromString(input);

    if (selectedColor != null) {
      print('You selected: ${selectedColor.name}');
      UrgentColor = selectedColor;
    } else {
      print('Invalid color!');
    }
  } else {
    print('No input received.');
  }

  print(
    'Enter a color for high priority (black, red, green, yellow, blue, magenta, cyan, white):',
  );

  input = stdin.readLineSync();

  if (input != null) {
    TextColor? selectedColor = textColorFromString(input);

    if (selectedColor != null) {
      print('You selected: ${selectedColor.name}');
      HighColor = selectedColor;
    } else {
      print('Invalid color!');
    }
  } else {
    print('No input received.');
  }

  print(
    'Enter a color for normal priority (black, red, green, yellow, blue, magenta, cyan, white):',
  );

  input = stdin.readLineSync();

  if (input != null) {
    TextColor? selectedColor = textColorFromString(input);

    if (selectedColor != null) {
      print('You selected: ${selectedColor.name}');
      NormalColor = selectedColor;
    } else {
      print('Invalid color!');
    }
  } else {
    print('No input received.');
  }
}

enum TextColor {
  black(30),
  red(31),
  green(32),
  yellow(33),
  blue(34),
  magenta(35),
  cyan(36),
  white(37);

  final int code;
  const TextColor(this.code);
}

enum BgColor {
  black(40),
  red(41),
  green(42),
  yellow(43),
  blue(44),
  magenta(45),
  cyan(46),
  white(47);

  final int code;
  const BgColor(this.code);
}

void printColored(
  String text, {
  TextColor? textColor,
  BgColor? bgColor,
  bool bold = false,
  bool Strikethrough = false,
}) {
  final codes = <String>[];

  if (bold) codes.add("1");
  if (Strikethrough) codes.add("9"); // <-- added strikethrough
  if (textColor != null) codes.add(textColor.code.toString());
  if (bgColor != null) codes.add(bgColor.code.toString());

  final ansi = codes.isNotEmpty ? "\x1B[${codes.join(";")}m" : "";

  print('$ansi$text\x1B[0m'); // reset at the end
}
