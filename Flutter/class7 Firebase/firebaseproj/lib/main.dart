import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MessageApp());
}

class MessageApp extends StatelessWidget {
  const MessageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Box Example',
      debugShowCheckedModeBanner: false,
      home: const MessagePage(),
    );
  }
}

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  Future<void> _showMessage() async {
    String message = _usernamecontroller.text.trim();
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _usernamecontroller.text,
            password: _passwordcontroller.text,
          );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User Created")));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("The password provided is too weak.")),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The account already exists for that email."),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _login() async {
    String message = _usernamecontroller.text.trim();
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernamecontroller.text,
        password: _passwordcontroller.text,
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login Successful")));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No user found for that email.")),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Wrong password provided for that user."),
          ),
        );
      } else if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("invalid credential provided.")),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Flutter Appp')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernamecontroller,
              decoration: const InputDecoration(
                labelText: "Enter Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordcontroller,
              decoration: const InputDecoration(
                labelText: "Enter Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showMessage,
              child: const Text("Sign Up"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
