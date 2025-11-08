import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:medical/screens/CartScreen.dart';
import 'package:medical/screens/Product.dart';
import 'package:medical/screens/addtocartscreen.dart';

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
        title: const Text(
          'Product Detail',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
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
            const SizedBox(height: 4),
            Text(
              '${product.price.toStringAsFixed(2)} Rs',
              style: const TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 4),
                Text(
                  '4.6   86 Reviews',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              product.desc.isNotEmpty
                  ? product.desc
                  : 'No description available.',
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Reviews (86)',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18),
                    SizedBox(width: 4),
                    Text(
                      '4.6',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://picsum.photos/id/237/200/300",
                    ),
                  ),
                  title: Text(
                    "Abdullah",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  subtitle: Text(
                    "I had the most incredible dining experience at this restaurant! The food was absolutely delicious - every dish was perfectly prepared and beautifully presented.",
                  ),
                  trailing: Text("2 days ago"),
                ),
                SizedBox(height: 20),
                ListTile(
                  //tileColor: Colors.teal,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
                    ),
                  ),
                  title: Text("Sana"),
                  subtitle: Text(
                    "My husband and I celebrated our anniversary here and it couldn't have been more perfect.",
                  ),
                  trailing: Text("2:35 PM"),
                  //trailing: Text("2:30 PM"),
                ),
                ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.green),
                  title: Text("Sara"),
                  subtitle: Text(
                    "This place has hands down the best brunch in town! The avocado toast with poached eggs was incredible",
                  ),
                  trailing: Text("2:39 PM"),
                ),
              ],
            ),

            const SizedBox(height: 20),
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
                    showAddToCartPopup(context, product);
                    //cartManager.addToCart(product);
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
