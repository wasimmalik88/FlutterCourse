import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Whatsup"), backgroundColor: Colors.blue),
        body: ListView(
          children: [
            ListTile(
              //tileColor: Colors.grey,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://media.licdn.com/dms/image/v2/D4D03AQGoqIKmBr1LOQ/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1714210789704?e=2147483647&v=beta&t=IAAYz9kBgp9JJm0yliV8kdtSDWDUoys_IA41KeY3Jh8",
                ),
              ),
              title: Text(
                "Abdullah",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            SizedBox(height: 20),
            ListTile(
              //tileColor: Colors.teal,
              leading: CircleAvatar(backgroundColor: Colors.red),
              title: Text("Ali"),
              subtitle: Text("Khany py chalen?"),
              trailing: Text("2:30 PM"),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.green),
              title: Text("Sara"),
              subtitle: Text("Khany py chalen?"),
              trailing: Text("2:30 PM"),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.yellow),
              title: Text("Ahsan"),
              subtitle: Text("Khany py chalen?"),
              trailing: Text("9:30 PM"),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.red),
              title: Text("Ikram"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.yellow),
              title: Text("Abdullah"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.red),
              title: Text("Ali"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.green),
              title: Text("Sara"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.yellow),
              title: Text("Ahsan"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.red),
              title: Text("Ikram"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.yellow),
              title: Text("Abdullah"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.red),
              title: Text("Ali"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.green),
              title: Text("Sara"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.yellow),
              title: Text("Ahsan"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.red),
              title: Text("Ikram"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.yellow),
              title: Text("Abdullah"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.red),
              title: Text("Ali"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.green),
              title: Text("Sara"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.yellow),
              title: Text("Ahsan"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.red),
              title: Text("Ikram"),
              subtitle: Text("Khany py chalen?"),
              trailing: Icon(Icons.message_sharp),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[200],
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Message"),
                //trailing: Text("data"),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text("Status"),
                //trailing: Text("data"),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Call"),
                //trailing: Text("data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
