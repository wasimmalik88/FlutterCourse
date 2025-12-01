import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String avatar;
  const MessageTile(
      {required this.name,
      required this.message,
      required this.time,
      required this.avatar,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(avatar)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: Text(time,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
      ),
    );
  }
}
