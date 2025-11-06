import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final String desc;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.image,
  });

  factory Product.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id,
      name: data['name'] ?? 'No Name',
      desc: data['desc'] ?? '',
      price: (data['price'] is int)
          ? (data['price'] as int).toDouble()
          : double.tryParse(data['price'].toString()) ?? 0.0,
      image: data['imageBlob'] ?? data['image'] ?? '',
    );
  }

  Stream<List<Product>> getProductsStream() {
    return FirebaseFirestore.instance
        .collection('products')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList(),
        );
  }
}
