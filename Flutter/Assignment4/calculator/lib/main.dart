import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

String calc = "";

class CallScreen extends StatefulWidget {
  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // 👈 ensures it takes full width
                child: Text(
                  calc,
                  textAlign: TextAlign.right, // 👈 right-align inside row
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis, // prevent overflow
                  maxLines: 1,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("7");
                  });
                },
                child: Text("7"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("8");
                  });
                },
                child: Text("8"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("9");
                  });
                },
                child: Text("9"),
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

                child: Text("/"),
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
                child: Text("4"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("5");
                  });
                },
                child: Text("5"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("6");
                  });
                },
                child: Text("6"),
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

                child: Text("X"),
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
                child: Text("1"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("2");
                  });
                },
                child: Text("2"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ProcessNumber("3");
                  });
                },
                child: Text("3"),
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

                child: Text("-"),
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
                child: Text("0"),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  setState(() {
                    Clear();
                  });
                },
                child: Text("C"),
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
                child: Text("="),
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

                child: Text("+"),
              ),
            ],
          ),
        ],
      ),

      drawer: MyDrawer(),
    );
  }

  void ProcessNumber(String i) {
    calc = calc + i.toString();
  }
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
      home: CallScreen(),
      routes: {'/call': (context) => CallScreen()},
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[200],
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Message"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/message');
            },
            //trailing: Text("data"),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Status"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/status');
            },
            //trailing: Text("data"),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Call"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/call');
            },
            //trailing: Text("data"),
          ),
        ],
      ),
    );
  }
}
