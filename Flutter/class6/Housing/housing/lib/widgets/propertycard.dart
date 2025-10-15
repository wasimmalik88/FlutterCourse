import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final String image;
  final String title;
  final String address;
  final int beds;
  final int baths;
  final int garage;
  final VoidCallback? onTap;

  const PropertyCard({
    super.key,
    required this.image,
    required this.title,
    required this.address,
    required this.beds,
    required this.baths,
    required this.garage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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

  static Widget _iconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.yellow[700]),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
