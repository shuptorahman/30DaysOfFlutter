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

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));

      await Navigator.pushNamed(
        context,
        MyRoutes.homeRoutes,
      );

      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 50),
              Image.asset("assets/images/welcome3.png"),
              SizedBox(height: 20),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 24),
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
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty) {
                          return "Username cannot be empty";
                        } else if (value.length < 5) {
                          return "Username length should be atlest 5";
                        }

                        return null;
                      },
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
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password lenght should be atleast 6";
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Material(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(
                  changeButton ? 50 : 8,
                ),
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: () {
                    moveToHome(context);
                  },

                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changeButton ? 50 : 150,
                    height: 50,

                    alignment: Alignment.center,

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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
