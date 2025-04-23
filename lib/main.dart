import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/home_screen.dart';
import 'package:flutter_catalog/pages/login_screen.dart';
import 'package:flutter_catalog/utils/myroutes.dart';
import 'package:flutter_catalog/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //theme blueprint here

    return MaterialApp(
      themeMode: ThemeMode.system,
      theme:
          MyTheme
              .lightTheme, //adopting custom light theme data from a blueprint

      darkTheme:
          MyTheme
              .darkTheme, //adopting custom dark theme data from a blueprint through instance
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoutes,
      routes: {
        "/": (context) => LoginScreen(),
        MyRoutes.homeRoutes: (context) => HomeScreen(),
        MyRoutes.loginRoutes: (context) => LoginScreen(),
        MyRoutes.cartRoutes: (context) => CartPage(),
      },
    );
  }
}
