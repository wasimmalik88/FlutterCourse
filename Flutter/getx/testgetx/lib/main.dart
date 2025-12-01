import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetx/detail.dart';
import 'package:testgetx/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/detail', page: () => const DetailPage()),
      ],
    );
  }
}
