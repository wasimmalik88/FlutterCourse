import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_image/service/firebase_storage_service.dart';

class AddImageScreen extends StatefulWidget {
  const AddImageScreen({super.key});

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  File? imageFile;

  getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    print("this is an image file ${image}");
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
        print("this is image path ${image.path}");
        print("this is image name ${image.name}");
        // saveimagetoFirebase(imageFile);
        saveimage(image);
      });
    }
  }

  saveimage(XFile file) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('image/some-image${DateTime.now()}.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );
    ref.putData(await file.readAsBytes(), metadata);
    var imageurl = await ref.getDownloadURL();
    print("imageurl --$imageurl");
    firestore
        .collection("userprofile")
        .add(
          {
            "prodName": "car",
            "prodImg": "$imageurl",
            "prodPrice": 33,
          },
        )
        .then((value) => print("Product Added"))
        .catchError((e) => print("this is error $e"));
  }

  saveimagetoFirebase(uploadingFile) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final mountainImagesRef = storageRef.child("abc.jpg");
      await mountainImagesRef.putFile(uploadingFile);
    } catch (e) {
      print("thsi is an erroe $e");
    }
  }

  getimagefromFirebase() async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imageUrl = await storageRef
          .child("flutter-tests/some-image.jpg")
          .getDownloadURL();
      print("image from firebase ${imageUrl}");
    } catch (e) {
      print("thsi is an erroe $e");
    }
  }
  // images/some-image.jpg

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Image"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                FirebaseStorageService firebaseStorageService =
                    FirebaseStorageService();
                setState(() {
                  imageFile = firebaseStorageService.getImageFromGallery();
                });
              },
              child: Text("Get image from gallery")),
          ElevatedButton(
              onPressed: () {
                getimagefromFirebase();
              },
              child: Text("Get Image from Firebase"))
        ],
      ),
    );
  }
}

// Complab02
// Wow78692

// Complab03
// SAIMSCS2024