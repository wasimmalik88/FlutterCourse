import 'package:cloud_firestore/cloud_firestore.dart';

/// Product model
class Product {
  final String id;
  final String name;
  final String desc;
  final double price;
  final String image; // base64 or URL

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.image,
  });

  /// Convert Firestore document → Product
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

  /// Stream of Product List from Firestore
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

// class Product {
//   final String id;
//   final String name;
//   final String desc;
//   final double price;
//   final String image;
//   final double rating;

//   Product({
//     required this.id,
//     required this.name,
//     required this.desc,
//     required this.price,
//     required this.image,
//     this.rating = 4.5,
//   });
// }

// final List<Product> demoProducts = [
//   Product(
//     id: 'p1',
//     name: 'Paracetamol 500mg',
//     desc: 'Pain & fever relief',
//     price: 150,
//     image:
//         'https://bf1af2.akinoncloudcdn.com/products/2025/10/14/73253/ec4c6890-39aa-4034-943a-1ef0928b11c5_size1920_cropCenter.jpg',
//   ),
//   Product(
//     id: 'p2',
//     name: 'Vitamin C 1000mg',
//     desc: 'Immune support',
//     price: 549,
//     image:
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHWpb7ngcOFrhtIoaJnbisVwlVMpA1qsZ0fA&s',
//   ),
//   Product(
//     id: 'p3',
//     name: 'Cough Syrup 120ml',
//     desc: 'Soothes cough',
//     price: 225,
//     image:
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYCZa1KuGmkgO3X8VMLAID5S0YohCEBEBATw&s',
//   ),
//   Product(
//     id: 'p4',
//     name: 'Thermometer',
//     desc: 'Digital thermometer',
//     price: 520,
//     image:
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-h36FaIVmgBrJAq-xXusOX0k8WOjs-JFRQw&s',
//   ),
// ];
