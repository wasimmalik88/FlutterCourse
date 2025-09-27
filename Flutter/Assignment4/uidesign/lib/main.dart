import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image(image: AssetImage("assets/stylish.jpg"))),
      body: ListView(
        children: [
          SizedBox(height: 20),

          ListTile(
            //title: Text("Team Members"),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/1.jpg"),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Beauty",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/2.jpg"),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Fashion",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/3.jpg"),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Kids",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/4.jpg"),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Mens",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: Center(
              child: Container(
                width: 400,
                height: 200,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: const Color.fromRGBO(253, 110, 134, 1),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // centers vertically
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // centers horizontally
                    children: [
                      Text(
                        "50-40% OFF",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Now in product",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),

                      SizedBox(height: 20),
                      Text(
                        "All Colors",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),

                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Shop Now ->"),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Center(
              child: Container(
                width: 400,
                height: 100,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: const Color.fromRGBO(67, 146, 249, 1),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Deal of the day",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "22h 55m 20s remaining",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),

                        ElevatedButton(
                          onPressed: () {},
                          child: Text("View All ->"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Center(
              child: Container(
                width: 400,
                height: 100,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: const Color.fromARGB(255, 229, 230, 236),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(image: AssetImage("assets/sepcial.PNG")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Special Offers",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "We make sure you get the offer you need at best prices",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          ListTile(
            title: Center(
              child: Container(
                width: 400,
                height: 125,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: const Color.fromRGBO(231, 231, 235, 0.3),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(image: AssetImage("assets/shoes.PNG")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Flat and Heels",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Stand a chance to get rewarded",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {},

                              child: Text("Visit Now ->"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          ListTile(
            title: Center(
              child: Container(
                width: 400,
                height: 100,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: const Color.fromRGBO(253, 110, 135, 1),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Trending Products",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Last Date 29/02/22",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),

                        ElevatedButton(
                          onPressed: () {},
                          child: Text("View All ->"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          ListTile(
            title: Center(
              child: Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: const Color.fromARGB(255, 255, 255, 249),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image with top rounded corners
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.asset(
                        "assets/summer.PNG",
                        width: 400,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Row for text + button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // 👈 pushes button to right
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Trending Products",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Last Date 29/02/22",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("View All ->"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
      home: ShopScreen(),
      routes: {'/Shop': (context) => ShopScreen()},
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
            leading: Icon(Icons.shopping_bag),
            title: Text("Shop"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/Shop');
            },
            //trailing: Text("data"),
          ),
          // ,
          // ListTile(
          //   leading: Icon(Icons.star),
          //   title: Text("Status"),
          //   onTap: () {
          //     Navigator.pushReplacementNamed(context, '/status');
          //   },
          //   //trailing: Text("data"),
          // ),
          // ListTile(
          //   leading: Icon(Icons.message),
          //   title: Text("Call"),
          //   onTap: () {
          //     Navigator.pushReplacementNamed(context, '/call');
          //   },
          //   //trailing: Text("data"),
          // ),
        ],
      ),
    );
  }
}
