// ignore_for_file: prefer_const_constructors

import 'package:catalog/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool isLogin = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/welcome.png",
                    ),
                  ),
                ),
                Text(
                  "Hello $name",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        onChanged: (value) {
                          // When text form field is changed, the change is given back as value
                          name = value;
                          setState(
                              () {}); // This re-runs the build function and renders the page again
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Invalid! Enter username";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Invalid! Enter password";
                          } else if (value.length < 6) {
                            return "Invalid! Password must contain more than 6 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Material(
                        color: context.theme.buttonColor,
                        borderRadius: BorderRadius.circular(isLogin ? 100 : 8),
                        child: InkWell(
                          // To give ripple effect to a container or button, inkwell must be ancestored by material widget
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLogin = true;
                              });
                              await Future.delayed(Duration(seconds: 1));
                              await Navigator.pushNamed(
                                  context, MyRoutes.homeRoute);
                              setState(() {
                                isLogin = false;
                              });
                            }
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 50,
                            width: isLogin ? 50 : 150,
                            alignment: Alignment.center,
                            child: isLogin
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
