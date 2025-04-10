import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://media.licdn.com/dms/image/v2/D5603AQETfitLbrAFNA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1694279586932?e=1749686400&v=beta&t=0mGjzbLWFst_XcR4fXf-MzwzhpcOWrDNtb40g6-HhUU";
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
