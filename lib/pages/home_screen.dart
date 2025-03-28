import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final int days = 30;
  final String name = "Flutter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
          child: Text("$days Days $name Tutorials."),
        ),
      ),
    );
  }
}
