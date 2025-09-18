import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Profile Screen
class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Whatsup"), backgroundColor: Colors.blue),
      body: ListView(
        children: [
          ListTile(
            leading: Text(
              "Status",
              style: TextStyle(
                fontSize: 20, // 👈 change this value
                fontWeight: FontWeight.bold, // optional
              ),
            ),
          ),
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
            subtitle: Text("2:30 PM"),
          ),
          SizedBox(height: 20),
          ListTile(
            //tileColor: Colors.teal,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
              ),
            ),
            title: Text("Sana"),
            subtitle: Text("2:35 PM"),
            //trailing: Text("2:30 PM"),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.green),
            title: Text("Sara"),
            subtitle: Text("2:39 PM"),
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
              onTap: () {
                Navigator.pushReplacementNamed(context, '/message');
              },
              //trailing: Text("data"),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Status"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/status');
              },
              //trailing: Text("data"),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("Call"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/call');
              },
              //trailing: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Whatsup"), backgroundColor: Colors.blue),
      body: ListView(
        children: [
          ListTile(
            //tileColor: Colors.grey,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg",
              ),
            ),
            title: Text(
              "Abdullah",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            subtitle: Text("Khany py chalen?"),
            trailing: Text("2:30 PM"),
          ),
          SizedBox(height: 20),
          ListTile(
            //tileColor: Colors.teal,
            leading: CircleAvatar(backgroundColor: Colors.red),
            title: Text("Ali"),
            subtitle: Text("Or sunao"),
            trailing: Text("2:35 PM"),
            //trailing: Text("2:30 PM"),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.green),
            title: Text("Sara"),
            subtitle: Text("darwaza open kar dain"),
            trailing: Text("2:35 PM"),
          ),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.yellow),
            title: Text("Ahsan"),
            subtitle: Text("ok"),
            trailing: Text("9:30 PM"),
          ),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.red),
            title: Text("Ikram"),
            subtitle: Text("phr sy"),
            trailing: Text("9:30 PM"),
          ),
          ListTile(
            //tileColor: Colors.grey,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
              ),
            ),
            title: Text("Sana", style: TextStyle(fontStyle: FontStyle.italic)),
            subtitle: Text("thek ha"),
            trailing: Text("2:30 PM"),
          ),
          SizedBox(height: 20),
          ListTile(
            //tileColor: Colors.teal,
            leading: CircleAvatar(backgroundColor: Colors.red),
            title: Text("Ashan"),
            subtitle: Text("new daikhi?"),
            trailing: Text("2:35 PM"),
            //trailing: Text("2:30 PM"),
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
              onTap: () {
                Navigator.pushReplacementNamed(context, '/message');
              },
              //trailing: Text("data"),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Status"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/status');
              },
              //trailing: Text("data"),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("Call"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/call');
              },
              //trailing: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Whatsup"), backgroundColor: Colors.blue),
      body: ListView(
        children: [
          ListTile(
            leading: Text(
              "Calls",
              style: TextStyle(
                fontSize: 20, // 👈 change this value
                fontWeight: FontWeight.bold, // optional
              ),
            ),
          ),
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
            subtitle: Text("September 13, 4:03PM"),
            trailing: Icon(Icons.call),
          ),
          SizedBox(height: 20),
          ListTile(
            //tileColor: Colors.teal,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
              ),
            ),
            title: Text("Sana"),
            subtitle: Text("September 13, 4:03PM"),
            trailing: Icon(Icons.call),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.green),
            title: Text("Sara"),
            subtitle: Text("September 13, 4:03PM"),
            trailing: Icon(Icons.call),
          ),
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
            subtitle: Text("September 13, 4:03PM"),
            trailing: Icon(Icons.call),
          ),
          SizedBox(height: 20),
          ListTile(
            //tileColor: Colors.teal,
            leading: CircleAvatar(backgroundColor: Colors.red),
            title: Text("Ali"),
            subtitle: Text("September 13, 4:03PM"),
            trailing: Icon(Icons.call),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.green),
            title: Text("Sara"),
            subtitle: Text("September 13, 4:03PM"),
            trailing: Icon(Icons.call),
          ),
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
            subtitle: Text("September 13, 4:03PM"),
            trailing: Icon(Icons.call),
          ),
          SizedBox(height: 20),
          ListTile(
            //tileColor: Colors.teal,
            leading: CircleAvatar(backgroundColor: Colors.red),
            title: Text("Ali"),
            subtitle: Text("September 13, 4:03PM"),
            trailing: Icon(Icons.call),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.green),
            title: Text("Sara"),
            subtitle: Text("September 13, 4:03PM"),
            trailing: Icon(Icons.call),
          ),
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
            subtitle: Text("September 13, 4:03PM"),
            trailing: Icon(Icons.call),
          ),
          SizedBox(height: 20),
          ListTile(
            //tileColor: Colors.teal,
            leading: CircleAvatar(backgroundColor: Colors.red),
            title: Text("Ali"),
            subtitle: Text("September 13, 4:03PM"),
            trailing: Icon(Icons.call),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.green),
            title: Text("Sara"),
            subtitle: Text("September 13, 4:03PM"),
            trailing: Icon(Icons.call),
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
              onTap: () {
                Navigator.pushReplacementNamed(context, '/message');
              },
              //trailing: Text("data"),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Status"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/status');
              },
              //trailing: Text("data"),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("Call"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/call');
              },
              //trailing: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MessageScreen(),
      routes: {
        '/message': (context) => MessageScreen(),
        '/status': (context) => StatusScreen(),
        '/call': (context) => CallScreen(),
      },
    );
  }
}
