import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final int days = 30;
  final String name = "Flutter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      drawer: Drawer(),
      body: Center(
        child: Container(
          child: Text("$days Days $name Tutorials."),
        ),
      ),
    );
  }
}
