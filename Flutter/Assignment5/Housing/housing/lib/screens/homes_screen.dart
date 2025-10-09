import 'package:flutter/material.dart';
import 'package:housing/screens/details_screen.dart';
import 'package:housing/screens/wishlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Los Angeles, CA",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromRGBO(16, 49, 68, 1),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WishlistScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade50,
                      foregroundColor: const Color.fromRGBO(16, 49, 68, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(10),
                      elevation: 0,
                    ),
                    child: const Icon(Icons.bookmark_border),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const Text(
                "Discover Best\nSuitable Property",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(16, 49, 68, 1),
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  _categoryButton("House", true),
                  const SizedBox(width: 10),
                  _categoryButton("Apartment", false),
                  const SizedBox(width: 10),
                  _categoryButton("Flot", false),
                ],
              ),
              const SizedBox(height: 30),

              const Text(
                "Best for you",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(16, 49, 68, 1),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),

              _propertyCard(
                image: "assets/house.jpg",
                title: "CRAFTSMAN HOUSE",
                address: "520 N Btoudry Ave Los Angeles",
                beds: 4,
                baths: 4,
                garage: 1,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DetailScreen()),
                  );
                },
              ),

              const SizedBox(height: 24),

              const Text(
                "Nearby your location",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(16, 49, 68, 1),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),

              _propertyMiniCard(
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
    );
  }

  Widget _categoryButton(String text, bool selected) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: selected
            ? const Color.fromRGBO(16, 49, 68, 1)
            : Colors.blue.shade50,
        foregroundColor: selected
            ? Colors.white
            : const Color.fromRGBO(16, 49, 68, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 0,
      ),
      child: Text(text),
    );
  }

  Widget _propertyCard({
    required String image,
    required String title,
    required String address,
    required int beds,
    required int baths,
    required int garage,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              color: const Color.fromRGBO(16, 49, 68, 1),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address,
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _iconText(Icons.bed, "$beds Beds"),
                      const SizedBox(width: 10),
                      _iconText(Icons.bathtub, "$baths Baths"),
                      const SizedBox(width: 10),
                      _iconText(Icons.directions_car, "$garage Garage"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _propertyMiniCard({
    required String image,
    required String title,
    required String address,
    required int beds,
    required int baths,
    required int garage,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, height: 80, width: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(16, 49, 68, 1),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    _iconText(
                      Icons.bed,
                      "$beds Beds",
                      small: true,
                      color: const Color.fromRGBO(15, 47, 68, 1),
                    ),
                    const SizedBox(width: 8),
                    _iconText(
                      Icons.bathtub,
                      "$baths Baths",
                      small: true,
                      color: const Color.fromRGBO(15, 47, 68, 1),
                    ),
                    const SizedBox(width: 8),
                    _iconText(
                      Icons.directions_car,
                      "$garage Garage",
                      small: true,
                      color: const Color.fromRGBO(15, 47, 68, 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconText(
    IconData icon,
    String text, {
    bool small = false,
    Color? color,
  }) {
    return Row(
      children: [
        Icon(icon, size: small ? 14 : 16, color: Colors.yellow[700]),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: color ?? Colors.white,
            fontSize: small ? 10 : 12,
          ),
        ),
      ],
    );
  }
}
