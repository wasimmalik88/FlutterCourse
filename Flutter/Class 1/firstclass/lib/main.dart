import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HelloWorldWidget());
  }
}

class HelloWorldWidget extends StatefulWidget {
  const HelloWorldWidget({super.key});

  @override
  State<HelloWorldWidget> createState() => _HelloWorldWidgetState();
}

class _HelloWorldWidgetState extends State<HelloWorldWidget> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  String _displayText = '';

  void _onButtonPressed() {
    setState(() {
      _displayText = _controller.text; // show input text on button press
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello World App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter some text',
              ),
            ),

            TextField(
              controller: _controller1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter some text',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onButtonPressed,
              child: const Text("Show Text"),
            ),
            const SizedBox(height: 16),
            Text(
              _displayText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
