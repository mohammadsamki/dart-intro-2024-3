// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  Widget screen = HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('this is a drawer page '),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 109, 210, 112),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('this is the drawer menu')),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages'),
              onTap: () {
                setState(() {
                  screen = Messages();
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                setState(() {
                  screen = Profile();
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                setState(() {
                  screen = Settings();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: screen,
      ),
    );
  }
}

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('this is messages page');
  }
}

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List images = [
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/301',
    'https://picsum.photos/200/302',
    'https://picsum.photos/200/303',
    'https://picsum.photos/200/304',
    'https://picsum.photos/200/305',
    'https://picsum.photos/200/306',
    'https://picsum.photos/200/307',
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("images List"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex == 0) {
                      currentIndex = currentIndex;
                    } else {
                      currentIndex -= 1;
                    }
                  });
                },
                icon: Icon(Icons.arrow_back),
              ),
              Container(
                color: Colors.red,
                child: Column(
                  children: [
                    Image.network(images[currentIndex]),
                    Container(
                      width: 200,
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return Icon(
                              Icons.circle,
                              size: images.length / .34,
                              color: index == currentIndex
                                  ? Colors.blue
                                  : Colors.grey,
                            );
                          }),
                    )
                  ],
                ),
                width: 200,
                height: 200,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex == images.length - 1) {
                      currentIndex = currentIndex;
                    } else {
                      currentIndex += 1;
                    }
                  });
                },
                icon: currentIndex == images.length - 1
                    ? Text('')
                    : Icon(Icons.arrow_forward),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('this is settings page');
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('this is home page');
  }
}
