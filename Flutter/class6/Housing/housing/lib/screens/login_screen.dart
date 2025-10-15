import 'package:flutter/material.dart';
import 'package:housing/screens/homes_screen.dart';

final List<String> names = List.generate(10, (index) => "User ${index + 1}");
String email = "";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailControl = new TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.health_and_safety,
                  color: Colors.blue,
                  size: 50,
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                "Login to Your Account",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(16, 49, 68, 1),
                ),
              ),
              const SizedBox(height: 32),

              TextField(
                controller: emailControl,
                onChanged: (value) => {email = value, print(value)},
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),

                  hintText: 'andrew_ainsley@yourdomain.com',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: '••••••••',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (val) {},
                        activeColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const Text(
                        "Remember me",
                        style: TextStyle(
                          color: Color.fromRGBO(16, 49, 68, 1),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot the password?",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 10, // space between items horizontally
                  runSpacing: 10, // space between lines
                  children: List.generate(5, (index) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: _getColor(index),
                    );
                  }),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentGeometry.center,
                  // spacing: 10, // space between items horizontally
                  // runSpacing: 10, // space between lines
                  children: [
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.amberAccent,
                      ),
                    ),

                    Container(width: 50, height: 100, color: Colors.black),
                    Container(width: 20, height: 100, color: Colors.green),
                  ],
                ),
              ),

              Container(
                color: Colors.red,
                width: MediaQuery.of(context).size.width * .30,
                height: MediaQuery.of(context).size.height * .10,
              ),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Hello, ${emailControl.text}!")),
                    );
                    print(emailControl.text);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BottomNavExample(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 3,
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "or continue with",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _socialButton(Icons.facebook, Colors.blue),
                  _socialButton(Icons.g_mobiledata, Colors.red),
                  _socialButton(Icons.apple, Colors.black),
                ],
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account?",
                    style: TextStyle(color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100, // or any height you want
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          names[index][0],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(names[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColor(int index) {
    // Just a list of 5 colors
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
    ];
    return colors[index % colors.length];
  }

  Widget _socialButton(IconData icon, Color color) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Icon(icon, color: color, size: 28),
    );
  }
}
