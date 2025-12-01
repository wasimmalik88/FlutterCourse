import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rebuy_flutter_getx/screens/liked_items.dart';
import 'package:rebuy_flutter_getx/screens/messages_view.dart';
import 'package:rebuy_flutter_getx/screens/product_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hey Alice"),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () => Get.to(LikedItemsScreen()),
            ),
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () => Get.to(MessagesView()),
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            InkWell(
              onTap: () {
                Get.snackbar("Added ", "Mic 1 tapped");
                Get.to(ProductDetailsScreen());
              },
              child: Card(
                child: Row(
                  children: [
                    Image.network("https://i.ibb.co/6RccPy7t/1.jpg",
                        height: 90),
                    const SizedBox(width: 15),
                    const Expanded(child: Text("Mic 1 ₹ 24,999")),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Get.snackbar("Added ", "Mic 2 tapped");
                Get.to(ProductDetailsScreen());
              },
              child: Card(
                child: Row(
                  children: [
                    Image.network("https://i.ibb.co/6RccPy7t/1.jpg",
                        height: 90),
                    const SizedBox(width: 15),
                    const Expanded(child: Text("Mic 2 ₹ 24,999")),
                  ],
                ),
              ),
            ),

            // add more rows same way...
          ],
        ));
  }
}
