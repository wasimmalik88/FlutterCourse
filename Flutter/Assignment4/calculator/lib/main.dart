import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

String calc = "";

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
              
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8), // space between text & border
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // border color
                      width: 2, // border thickness
                    ),
                    borderRadius: BorderRadius.circular(
                      8,
                    ), // optional rounded corners
                  ),
                  child: Text(
                    calc,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily:
                          "Digital", // 👈 use your custom calculator font
                      fontSize: 64, // bigger for calculator look
                      fontWeight: FontWeight.normal,
                      color: Colors
                          .greenAccent, // typical calculator display color
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  setState(() {
                    Clear();
                  });
                },
                child: Text(
                  "C",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  setState(() {
                    ProcessBackspace();
                  });
                },

                child: Text(
                  "←",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("7");
                  });
                },
                child: Text(
                  "7",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("8");
                  });
                },
                child: Text(
                  "8",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("9");
                  });
                },
                child: Text(
                  "9",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400],
                ),
                onPressed: () {
                  setState(() {
                    ProcessNumber("/");
                  });
                },

                child: Text(
                  "/",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20), // spacing between rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("4");
                  });
                },
                child: Text(
                  "4",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("5");
                  });
                },
                child: Text(
                  "5",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("6");
                  });
                },
                child: Text(
                  "6",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400],
                ),
                onPressed: () {
                  setState(() {
                    ProcessNumber("*");
                  });
                },

                child: Text(
                  "X",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // spacing between rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("1");
                  });
                },
                child: Text(
                  "1",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("2");
                  });
                },
                child: Text(
                  "2",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("3");
                  });
                },
                child: Text(
                  "3",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400],
                ),
                onPressed: () {
                  setState(() {
                    ProcessNumber("-");
                  });
                },

                child: Text(
                  "-",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // spacing between rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("0");
                  });
                },
                child: Text(
                  "0",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber(".");
                  });
                },
                child: Text(
                  ".",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400],
                ),
                onPressed: () {
                  setState(() {
                    //    count++;
                    processresult();
                  });
                },
                child: Text(
                  "=",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400],
                ),
                onPressed: () {
                  setState(() {
                    ProcessNumber("+");
                  });
                },

                child: Text(
                  "+",
                  style: TextStyle(
                    fontFamily: "Digital",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void ProcessNumber(String i) {
    calc = calc + i.toString();
  }
}

void ProcessBackspace() {
  calc = calc.substring(0, calc.length - 1);
}

void Clear() {
  calc = "";
}

void processresult() {
  Parser p = Parser();
  Expression exp = p.parse(calc);

  ContextModel cm = ContextModel();
  double result = exp.evaluate(EvaluationType.REAL, cm);

  calc = result.toString();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
      routes: {'/call': (context) => CalculatorScreen()},
    );
  }
}
