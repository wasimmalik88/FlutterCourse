class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});
}

// STATIC PRODUCTS
List<Product> productList = [
  Product(id: 1, name: "Apple", price: 2.0),
  Product(id: 2, name: "Banana", price: 1.5),
  Product(id: 3, name: "Orange", price: 3.0),
];
