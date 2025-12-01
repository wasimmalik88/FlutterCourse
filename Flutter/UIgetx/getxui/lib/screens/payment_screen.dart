import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rebuy_flutter_getx/screens/product_details.dart';
import 'package:rebuy_flutter_getx/screens/success_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(
                decoration: InputDecoration(label: Text("Card Number"))),
            const SizedBox(height: 10),
            const TextField(decoration: InputDecoration(label: Text("CVV"))),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Get.to(SuccessScreen()),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50)),
              child: const Text("Pay Now"),
            )
          ],
        ),
      ),
    );
  }
}
