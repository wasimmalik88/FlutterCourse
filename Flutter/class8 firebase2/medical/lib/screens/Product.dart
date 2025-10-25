class Product {
  final String id;
  final String name;
  final String desc;
  final double price;
  final String image;
  final double rating;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.image,
    this.rating = 4.5,
  });
}

final List<Product> demoProducts = [
  Product(
    id: 'p1',
    name: 'Paracetamol 500mg',
    desc: 'Pain & fever relief',
    price: 150,
    image:
        'https://bf1af2.akinoncloudcdn.com/products/2025/10/14/73253/ec4c6890-39aa-4034-943a-1ef0928b11c5_size1920_cropCenter.jpg',
  ),
  Product(
    id: 'p2',
    name: 'Vitamin C 1000mg',
    desc: 'Immune support',
    price: 549,
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHWpb7ngcOFrhtIoaJnbisVwlVMpA1qsZ0fA&s',
  ),
  Product(
    id: 'p3',
    name: 'Cough Syrup 120ml',
    desc: 'Soothes cough',
    price: 225,
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYCZa1KuGmkgO3X8VMLAID5S0YohCEBEBATw&s',
  ),
  Product(
    id: 'p4',
    name: 'Thermometer',
    desc: 'Digital thermometer',
    price: 520,
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-h36FaIVmgBrJAq-xXusOX0k8WOjs-JFRQw&s',
  ),
];
