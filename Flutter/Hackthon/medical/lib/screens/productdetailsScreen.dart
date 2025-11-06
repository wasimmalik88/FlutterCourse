import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:medical/screens/CartScreen.dart';
import 'package:medical/screens/Product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    try {
      if (product.image.isNotEmpty) {
        imageBytes = base64Decode(product.image);
      }
    } catch (e) {
      return const Icon(Icons.broken_image, size: 48);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text('Product', style: TextStyle(color: Colors.black87)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[100],
                ),
                child: imageBytes != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.memory(imageBytes, fit: BoxFit.contain),
                      )
                    : const Icon(
                        Icons.image_not_supported,
                        size: 80,
                        color: Colors.grey,
                      ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              product.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              product.desc.isNotEmpty
                  ? product.desc
                  : 'No description available.',
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),

            const SizedBox(height: 20),

            const Text(
              'Details',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            const Text(
              '• 20 tablets per pack\n• Store in a cool dry place\n• Consult physician if symptoms persist',
              style: TextStyle(color: Colors.black54),
            ),

            const Spacer(),

            Row(
              children: [
                Text(
                  '${product.price.toStringAsFixed(2)} Rs',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    cartManager.addToCart(product);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product.name} added to cart')),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_outlined),
                  label: const Text('Add to cart'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
