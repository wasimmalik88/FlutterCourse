import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical/screens/CartScreen.dart';
import 'package:medical/screens/Product.dart';
import 'package:medical/screens/ProductCard.dart';
import 'package:medical/screens/productdetailsScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Stream<List<Product>> getProductStream() {
    return FirebaseFirestore.instance
        .collection('products')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            final raw = doc.data();

            final data = (raw is Map<String, dynamic>)
                ? raw
                : Map<String, dynamic>.from(raw as Map);

            double parsePrice(dynamic p) {
              if (p == null) return 0.0;
              if (p is double) return p;
              if (p is int) return p.toDouble();
              if (p is String) return double.tryParse(p) ?? 0.0;
              return 0.0;
            }

            final imageField = (data['imageBlob'] ?? data['image'] ?? '')
                .toString();
            return Product(
              id: doc.id,
              name: data['name'] ?? '',
              desc: data['desc'] ?? '',
              price: parsePrice(data['price']),
              image: imageField,
            );
          }).toList();
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
      stream: getProductStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Scaffold(body: Center(child: Text('No products found')));
        }

        final products = snapshot.data!;

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Good morning,', style: TextStyle(fontSize: 14.0)),
                        SizedBox(height: 2),
                        Text(
                          'Wasim Malik',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.teal.shade50,
                      child: const Icon(Icons.person, color: Colors.teal),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                // Search bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search meds, symptoms, brands',
                          ),
                        ),
                      ),
                      Icon(Icons.mic, color: Colors.grey),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                // Promo Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal.shade400, Colors.teal.shade100],
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Get 20% off',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'on your first order',
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(height: 12),
                            Chip(label: Text('Use: WELCOME20')),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 90,
                        height: 90,
                        child: Image.network(
                          'https://cdn-icons-png.freepik.com/256/9015/9015502.png?semt=ais_white_label',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                const Text(
                  'Popular',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final p = products[index];

                      Uint8List? imageBytes;
                      if (p.image.isNotEmpty && !p.image.startsWith('http')) {
                        try {
                          imageBytes = base64Decode(p.image);
                        } catch (_) {
                          return const Icon(Icons.broken_image, size: 48);
                        }
                      }

                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(product: p),
                          ),
                        ),
                        child: Container(
                          width: 250,
                          margin: const EdgeInsets.only(right: 12, bottom: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: imageBytes != null
                                      ? Image.memory(
                                          imageBytes,
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        )
                                      : (p.image.startsWith('http')
                                            ? Image.network(
                                                p.image,
                                                width: 60,
                                                height: 60,
                                                fit: BoxFit.cover,
                                                errorBuilder: (c, e, s) =>
                                                    const Icon(
                                                      Icons.broken_image,
                                                      size: 60,
                                                    ),
                                              )
                                            : const Icon(
                                                Icons.image_not_supported,
                                                size: 60,
                                              )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 6.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        p.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        p.desc,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${p.price.toStringAsFixed(2)} Rs',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              cartManager.addToCart(p);
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    '${p.name} added to cart',
                                                  ),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: const CircleBorder(),
                                              padding: const EdgeInsets.all(8),
                                            ),
                                            child: const Icon(
                                              Icons.add_shopping_cart_outlined,
                                              size: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 12),
                const Text(
                  'Recommended for you',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // Recommended grid
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                        ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final p = products[index];
                      return ProductCard(product: p);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
