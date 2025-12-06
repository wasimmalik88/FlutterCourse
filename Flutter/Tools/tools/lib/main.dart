import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tools/screens/LoginScreen.dart';

void main() {
  runApp(const ReBuyApp());
}

class ReBuyApp extends StatelessWidget {
  const ReBuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "ReBuy",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: "Arial"),
      initialRoute: "/login",
      routes: {
        "/login": (_) => const LoginScreen(),
        // "/home": (_) => const HomeScreen(),
        // "/product": (_) => const ProductDetailsScreen(),
        // "/liked": (_) => const LikedItemsScreen(),
        // "/checkout": (_) => const CheckoutScreen(),
        // "/payment": (_) => const PaymentScreen(),
        // "/success": (_) => const SuccessScreen(),
      },
    );
  }
}
