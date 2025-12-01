import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebuy_flutter_getx/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ReBuy")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Log in",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            const TextField(decoration: InputDecoration(labelText: "Email")),
            const SizedBox(height: 15),
            const TextField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.to(HomeScreen());
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50)),
              child: const Text("Log in"),
            ),
          ],
        ),
      ),
    );
  }
}
