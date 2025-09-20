import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

int count = 0;

// Profile Screen5
class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Whatsup"), backgroundColor: Colors.blue),
      body: ListView(
        children: [
          ListTile(
            leading: Text(
              "Status $count",
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
      drawer: MyDrawer(),
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
      drawer: MyDrawer(),
    );
  }
}

class CallScreen extends StatefulWidget {
  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Icon(Icons.add), // You can use any icon here
        tooltip: 'Add Item', // Tooltip that shows on long press
      ),
      appBar: AppBar(title: Text("Whatsup"), backgroundColor: Colors.blue),
      body: ListView(
        children: [
          ListTile(
            title: Center(
              child: Text(
                "Count  $count",
                style: TextStyle(
                  fontSize: 20, // 👈 change this value
                  fontWeight: FontWeight.bold, // optional
                ),
              ),
            ),
          ),

          SizedBox(height: 100),
          ListTile(
            title: Center(
              child: Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage("assets/Images/aeroplane.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            //tileColor: Colors.grey,
            title: Container(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: Text("Increase"),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count--;
                      });
                    },
                    child: Text("Desc"),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count = 0;
                      });
                    },
                    child: Text("Reset"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
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

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
