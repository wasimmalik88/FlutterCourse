import 'package:flutter/material.dart';
import 'package:housing/screens/wishlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: DetailScreen());
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Detail",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, // 👈 add your action here
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue.shade50, // same background color
                      foregroundColor: const Color.fromRGBO(
                        16,
                        49,
                        68,
                        1,
                      ), // icon color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(8),
                      elevation: 0, // flat look like Container
                    ),
                    child: const Icon(Icons.arrow_back_ios, size: 18),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Big Image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/housedetail.jpg",
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 16),

              // Property Title & Bookmark
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "CRAFTSMAN HOUSE",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "520 N Beaudry Ave, Los Angeles",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
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
                    }, // 👈 add your action here
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue.shade50, // same as container color
                      foregroundColor: const Color.fromRGBO(
                        16,
                        49,
                        68,
                        1,
                      ), // icon color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(8),
                      elevation:
                          0, // remove shadow to match flat container look
                    ),
                    child: const Icon(Icons.bookmark_border),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Info Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  InfoIcon(icon: Icons.bed, text: "4 Beds"),
                  InfoIcon(icon: Icons.bathtub, text: "4 Baths"),
                  InfoIcon(icon: Icons.directions_car, text: "1 Garage"),
                ],
              ),
              const SizedBox(height: 20),

              // Owner Section
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage("assets/rebecca.jpg"),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      "Rebecca Tetha\nOwner Craftsman House",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(16, 49, 68, 1),
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.call, size: 18),
                    label: const Text("Call"),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Description
              const Text(
                "Completely redone in 2021. 4 bedrooms. 2 bathrooms. "
                "1 garage, amazing curb appeal and enterain areawater views. "
                "Tons of built-ins & extras. Read More",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 20),

              // Gallery
              const Text(
                "Gallery",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    galleryImage("assets/1.jpg"),
                    galleryImage("assets/2.jpg"),
                    galleryImage("assets/3.jpg"),
                    //galleryImage("assets/4.jpg"),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Price & Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "\$5990000",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(16, 49, 68, 1),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(16, 49, 68, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("BUY NOW"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget galleryImage(String path) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(path, width: 80, height: 80, fit: BoxFit.cover),
      ),
    );
  }
}

class InfoIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoIcon({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.amber, size: 18),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
