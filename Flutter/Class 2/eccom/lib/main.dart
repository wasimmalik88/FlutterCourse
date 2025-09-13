import 'package:eccom/screens/chess_screen.dart';
import 'package:eccom/screens/ludo_screen.dart';
import 'package:eccom/screens/periodic_table_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: const ChessScreen()));
  }
}
