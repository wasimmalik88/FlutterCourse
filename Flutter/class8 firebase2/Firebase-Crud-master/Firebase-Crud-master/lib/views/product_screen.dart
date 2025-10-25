import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice_image/service/firebase_database.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future getProduct() {
    return firestore
        .collection("product")
        .get()
        .then((value) => print("Product Get"))
        .catchError((e) => print("this is error $e"));
  }

  addProduct() {
    print(
        "Working Button ${textEditingControlproductname.text} ${textEditingControlproductimg.text} ${textEditingControlproductprice.text}");
    firestore
        .collection("product")
        .add(
          {
            "prodName": textEditingControlproductname.text,
            "prodImg": textEditingControlproductimg.text,
            "prodPrice": textEditingControlproductprice.text,
          },
        )
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

  editProduct(productid) {
    firestore
        .collection("product")
        .doc("$productid")
        .update({
          "prodName": textEditingControlproductname.text,
          "prodImg": textEditingControlproductimg.text,
          "prodPrice": textEditingControlproductprice.text,
        })
        .then((value) => print("Product Updated"))
        .catchError((e) => print("this is error $e"));
    print("this is productid $productid");
  }

  TextEditingController textEditingControlproductname = TextEditingController();
  TextEditingController textEditingControlproductimg = TextEditingController();
  TextEditingController textEditingControlproductprice =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: textEditingControlproductname,
              decoration: InputDecoration(hintText: "Product Name"),
            ),
            TextField(
              controller: textEditingControlproductimg,
              decoration: InputDecoration(hintText: "Product image"),
            ),
            TextField(
              controller: textEditingControlproductprice,
              decoration: InputDecoration(hintText: "Product Price"),
            ),
            ElevatedButton(
                onPressed: () {
                  // addProduct();
                  FirebaseDatabase firebaseDatabase = FirebaseDatabase();
                  firebaseDatabase.addProduct("bills", {
                    "billid": "7932",
                    "billname": "KE",
                    "billamout": "323423"
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No file was selected'),
                    ),
                  );
                },
                child: Text("Add Products")),
            FutureBuilder(
                future: getProduct(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData &&
                      snapshot.data != null) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text("${snapshot.data.docs[index]["prodName"]}"),
                          subtitle:
                              Text("${snapshot.data.docs[index]["prodPrice"]}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    editProduct(snapshot.data.docs[index].id);
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    deleteProduct(snapshot.data.docs[index].id);
                                  },
                                  icon: Icon(Icons.delete)),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.data != null) {
                    return Text("No Data");
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
