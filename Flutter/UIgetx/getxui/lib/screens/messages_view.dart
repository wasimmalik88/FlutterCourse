import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rebuy_flutter_getx/screens/liked_items.dart';
import 'package:rebuy_flutter_getx/screens/message_tile.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Hey Alice"),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () => Get.to(LikedItemsScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () => Get.to(MessagesView()),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search in messages',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 16),
          MessageTile(
            name: 'DJI Mavic Mini 2 | Paul Molive',
            message: 'You: Does it come with an additional battery?',
            time: '9:03 AM',
            avatar: 'https://i.pravatar.cc/100?img=3',
          ),
          MessageTile(
            name: 'DJI Mavic Mini 2 | Petey Cruiser',
            message: 'Petey: Sorry, I\'m unlisting it',
            time: 'Yesterday',
            avatar: 'https://i.pravatar.cc/100?img=5',
          ),
          MessageTile(
            name: 'Apple AirPods Pro | Bob Frappes',
            message: 'Bob: You\'re welcome',
            time: '25 Jan',
            avatar: 'https://i.pravatar.cc/100?img=7',
          ),
        ],
      ),
    );
  }
}
