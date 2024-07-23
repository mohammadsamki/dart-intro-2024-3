// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('this is profile page');
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
