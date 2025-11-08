import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:medical/screens/Components/ProductClass.dart';

class CartManager {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  void addToCart(dynamic product) {
    final index = cart.indexWhere((item) => item['product'].id == product.id);

    if (index != -1) {
      cart[index]['qty'] = cart[index]['qty'] + 1;
    } else {
      cart.add({'product': product, 'qty': 1});
    }
  }

  void addToCartwithQuantity(dynamic product, int quantity) {
    final index = cart.indexWhere((item) => item['product'].id == product.id);

    if (index != -1) {
      cart[index]['qty'] = cart[index]['qty'] + quantity;
    } else {
      cart.add({'product': product, 'qty': 0 + quantity});
    }
  }

  void removeFromCart(dynamic product) {
    cart.removeWhere((item) => item['product'] == product);
  }

  late List<Map<String, dynamic>> cart = [];
}

final cartManager = CartManager();

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _increaseQty(int index) {
    setState(() {
      cartManager.cart[index]['qty']++;
    });
  }

  void _decreaseQty(int index) {
    setState(() {
      if (cartManager.cart[index]['qty'] > 1) {
        cartManager.cart[index]['qty']--;
      } else {
        cartManager.cart.removeAt(index);
      }
    });
  }

  double get total {
    return cartManager.cart.fold(0, (sum, item) {
      final p = item['product'] as Product;
      final qty = item['qty'] as int;
      return sum + p.price * qty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cart',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: cartManager.cart.isEmpty
                ? const Center(child: Text('Your cart is empty'))
                : ListView.separated(
                    itemCount: cartManager.cart.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final p = cartManager.cart[index]['product'] as Product;
                      final qty = cartManager.cart[index]['qty'] as int;

                      Uint8List? imageBytes;
                      try {
                        if (p.image.isNotEmpty) {
                          imageBytes = base64Decode(p.image);
                        }
                      } catch (e) {
                        return const Icon(Icons.broken_image, size: 48);
                      }

                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 6,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: imageBytes != null
                                  ? Image.memory(
                                      imageBytes,
                                      height: 68,
                                      width: 68,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      height: 68,
                                      width: 68,
                                      color: Colors.grey[200],
                                      child: const Icon(
                                        Icons.image_not_supported,
                                        color: Colors.grey,
                                        size: 40,
                                      ),
                                    ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '${p.price.toStringAsFixed(2)} Rs',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => _decreaseQty(index),
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.teal,
                                  ),
                                ),
                                Text(
                                  qty.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => _increaseQty(index),
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.teal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${total.toStringAsFixed(2)} Rs',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
