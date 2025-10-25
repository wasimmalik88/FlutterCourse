import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future getProduct(String collectionname) {
    return firestore
        .collection(collectionname)
        .get()
        .then((value) => print("Product Get"))
        .catchError((e) => print("this is error $e"));
  }

  addProduct(String collectionname, Map<String, dynamic> collectionData) {
    firestore
        .collection(collectionname)
        .add(collectionData)
        .then((value) => print("Product Added"))
        .catchError((e) => print("this is error $e"));
  }

  deleteProduct(productid) {
    firestore
        .collection("product")
        .doc("$productid")
        .delete()
        .then((value) => print("Product Deleted"))
        .catchError((e) => print("this is error $e"));
    print("this is productid $productid");
  }

  editProduct(String collectionname, Map<String, dynamic> collectionData,
      String docId) {
    firestore
        .collection(collectionname)
        .doc("$docId")
        .update(collectionData)
        .then((value) => print("Product Updated"))
        .catchError((e) => print("this is error $e"));
    print("this is productid");
  }
}
