import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tools/screens/HomeScreen.dart';

import 'package:tools/screens/qrscan.dart';
import 'package:tools/screens/sound.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ReBuy")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Log in",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const TextField(decoration: InputDecoration(labelText: "Email")),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.to(Homescreen());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Log in"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.to(MobileScannerSimple());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("QR Code"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.to(SimpleRecorder());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Audio Recorder"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                AwesomeNotifications().initialize(
                  // set the icon to null if you want to use the default app icon
                  'resource://drawable/res_app_icon',
                  [
                    NotificationChannel(
                      channelGroupKey: 'basic_channel_group',
                      channelKey: 'basic_channel',
                      channelName: 'Basic notifications',
                      channelDescription:
                          'Notification channel for basic tests',
                      defaultColor: Color(0xFF9D50DD),
                      ledColor: Colors.white,
                    ),
                  ],
                  // Channel groups are only visual and are not required
                  channelGroups: [
                    NotificationChannelGroup(
                      channelGroupKey: 'basic_channel_group',
                      channelGroupName: 'Basic group',
                    ),
                  ],
                  debug: true,
                );
                AwesomeNotifications().createNotification(
                  content: NotificationContent(
                    id: 10,
                    channelKey: 'basic_channel',
                    actionType: ActionType.Default,
                    title: 'Hello World!',
                    body: 'This is my first notification!',
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Awsome Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
