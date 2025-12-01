import 'package:flutter/material.dart';

class LikedItemsScreen extends StatelessWidget {
  const LikedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liked Items")),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.mic),
            title: Text("Shure Microphone"),
            subtitle: Text("₹ 24,999"),
            trailing: Icon(Icons.favorite, color: Colors.red),
          ),
        ],
      ),
    );
  }
}