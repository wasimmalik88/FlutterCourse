import 'package:flutter/material.dart';
import 'package:stacked_practice/ui/views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stacked Counter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterView(),
    );
  }
}
