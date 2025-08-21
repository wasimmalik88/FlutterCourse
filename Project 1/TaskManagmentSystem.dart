// A list of maps with initial data
import 'dart:io';

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
        textColor: TextColor.red,
        bold: true,
        Strikethrough: item["isdone"],
      );
    else if (item["priority"] == 2)
      printColored(
        "${++count} : ${item["desc"]} ",
        textColor: TextColor.yellow,
        bold: true,
        Strikethrough: item["isdone"],
      );
    else if (item["priority"] == 3)
      printColored(
        "${++count} : ${item["desc"]} ",
        textColor: TextColor.white,
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
  listOfTask[TaskNumber - 1]["isdone"] = true;
}

void DeleteTask(int TaskNumber) {
  listOfTask.remove(listOfTask[TaskNumber - 1]);
}

void DeleteCompleted() {
  listOfTask.removeWhere((task) => task['isdone'] == true);
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
