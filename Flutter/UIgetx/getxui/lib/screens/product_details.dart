import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rebuy_flutter_getx/screens/checkout_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ReBuy")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network("https://i.ibb.co/6RccPy7t/1.jpg", height: 200),
            const SizedBox(height: 15),
            const Text("Shure Podcast Microphone",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("₹ 24,999",
                style: TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 20),
            const Text("The Shure SM7B reigns as king of studio recording."),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Save item"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.to(CheckoutScreen()),
                    child: const Text("Buy Now"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
