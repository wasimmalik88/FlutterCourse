import 'package:get/get.dart';
import 'package:testgetx/model/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
    update();
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    update();
  }

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  String printCartItems() {
    String result = "";

    if (cartItems.isEmpty) {
      result = result + "Cart is empty";
      return result;
    }

    print("---- CART ITEMS ----");
    for (var item in cartItems) {
      result =
          result +
          "ID: ${item.id}, Name: ${item.name}, Price: ${item.price} \n\r";
    }

    result = result + "Total Price = $totalPrice";
    return result;
  }
}
