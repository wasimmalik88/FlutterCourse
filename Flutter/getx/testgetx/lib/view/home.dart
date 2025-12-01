import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetx/controller/cart_controller.dart';
import 'package:testgetx/controller/home_controller.dart';
import 'package:testgetx/detail.dart';
import 'package:testgetx/model/product.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final CartController cartControl = Get.put(CartController());
  final HomeController homeControl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.snackbar("Test", "${homeControl.counter}");
              },
              child: const Text("Show Snackbar"),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () async {
                var result = await Get.defaultDialog(
                  title: "Alert",
                  middleText:
                      "Counter has reached value ${homeControl.counter.value}",

                  textCancel: "Cancel",
                  textConfirm: "Ok",

                  onCancel: () {
                    Get.back(result: "Cancel_pressed");
                  },
                  onConfirm: () {
                    Get.back(result: "Ok_pressed");
                  },
                );

                Get.snackbar("Test", " $result");
              },
              child: const Text("Show Dialog"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                homeControl.increaseCounter();
              },
              child: GetX<HomeController>(
                builder: (_) {
                  return Text(
                    "Increase Counter (${homeControl.counter.value})",
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.to(DetailPage());
              },
              child: const Text("Go to Detail Page"),
            ),

            ElevatedButton(
              onPressed: () {
                homeControl.increaseCounter();
              },
              child: GetX<HomeController>(
                builder: (_) {
                  return Text(
                    "Increase Counter (${homeControl.counter.value})",
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            Column(
              children: [
                for (var p in productList)
                  ElevatedButton(
                    onPressed: () {
                      cartControl.addToCart(p);

                      Get.snackbar("Product Added", "${p.name}");
                    },
                    child: GetBuilder<CartController>(
                      builder: (controller) {
                        return Text("Product (${p.name})");
                      },
                    ),
                  ),
              ],
            ),

            ElevatedButton(
              onPressed: () async {
                var result = await Get.defaultDialog(
                  title: "Alert",
                  middleText:
                      "Counter has reached value ${cartControl.printCartItems()}",

                  textCancel: "Cancel",
                  textConfirm: "Ok",

                  onCancel: () {
                    Get.back(result: "Cancel_pressed");
                  },
                  onConfirm: () {
                    Get.back(result: "Ok_pressed");
                  },
                );

                Get.snackbar("Test", " $result");
              },
              child: const Text("Show Cart"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                homeControl.GetData();
              },
              child: GetX<HomeController>(
                builder: (_) {
                  return Text("Increase Counter (${homeControl.userId.value})");
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
