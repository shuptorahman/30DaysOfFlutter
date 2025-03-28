import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://tinyurl.com/mwnnmbpk";
    return Drawer(
      backgroundColor: Colors.deepPurple[200],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            accountName: Text(
              "Shupto Rahman",
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text(
              "shuptorahman8@gmail.com",
              style: TextStyle(color: Colors.white),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          SizedBox(height: 40),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.black87),
              textScaler: TextScaler.linear(1.2),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.black87),
              textScaler: TextScaler.linear(1.2),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail),
            title: Text(
              "Email Me",
              style: TextStyle(color: Colors.black87),
              textScaler: TextScaler.linear(1.2),
            ),
          ),
        ],
      ),
    );
  }
}
