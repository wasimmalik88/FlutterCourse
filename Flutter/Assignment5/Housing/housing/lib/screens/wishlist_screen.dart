import 'package:flutter/material.dart';
import 'package:housing/widgets/propertycard.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Header Row
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade50,
                      foregroundColor: const Color.fromRGBO(16, 49, 68, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(8),
                      elevation: 0,
                    ),
                    child: const Icon(Icons.arrow_back_ios, size: 18),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Wishlist",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(16, 49, 68, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 🔹 Scrollable list of property cards
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PropertyCard(
                        image: "assets/house.jpg",
                        title: "CRAFTSMAN HOUSE",
                        address: "520 N Btoudry Ave Los Angeles",
                        beds: 4,
                        baths: 4,
                        garage: 1,

                        onTap: () {
                          // TODO: open detail page
                        },
                      ),
                      const SizedBox(height: 20),
                      PropertyCard(
                        image: "assets/ranch.jpg",
                        title: "RANCH HOME",
                        address: "520 N Btoudry Ave Los Angeles",
                        beds: 4,
                        baths: 4,
                        garage: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
