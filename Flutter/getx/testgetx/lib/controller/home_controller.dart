import 'dart:convert' as convert;

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
//simle statemanagement
// class HomeController extends GetxController {
//   int counter = 0;
//   increaseCounter() {
//     counter++;
//     update();
//   }
// }

class HomeController extends GetxController {
  var counter = 0.obs;
  increaseCounter() {
    counter.value++;
  }

  var userId = "".obs;
  void GetData() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      /// print(jsonResponse['id']);

      userId.value = jsonResponse['name'];
      print(userId.value);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
