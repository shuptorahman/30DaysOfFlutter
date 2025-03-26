import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/myroutes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login_page.png"),
            SizedBox(height: 20),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32,
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Passsword",
                      labelText: "Password",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () async {
                setState(() {
                  changeButton = true;
                });
                await Future.delayed(Duration(seconds: 1));
                Navigator.pushNamed(
                  context,
                  MyRoutes.homeRoutes,
                );
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: changeButton ? 50 : 150,
                height: 50,

                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(
                    changeButton ? 50 : 8,
                  ),
                ),
                child:
                    changeButton
                        ? Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                        : Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
              ),
            ),

            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     foregroundColor: Colors.white,
            //     textStyle: TextStyle(fontSize: 16),
            //     minimumSize: Size(110, 40),
            //   ),
            //   onPressed: () {
            //     Navigator.pushNamed(
            //       context,
            //       MyRoutes.homeRoutes,
            //     );
            //   },
            //   child: Text("Login"),
            // ),
          ],
        ),
      ),
    );
  }
}
