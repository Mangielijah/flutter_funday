import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funday_1/logo.dart';
import 'package:flutter_funday_1/views/authentication/signup.dart';
import 'package:flutter_funday_1/widgets/button.dart';

class LogIn extends StatelessWidget {
  LogIn({Key key}) : super(key: key);
  final ValueNotifier<bool> rememberMe = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final boxSize = ((size.width / 3) >= 400.0) ? 400 : (size / 3);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: Container(
          color: Colors.white,
          width: boxSize,
          height: 600,
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Center(
                  child: Logo(
                    textColor: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BorderButton(
                text: "Log in with Google",
                borderColor: Colors.grey,
                fontSize: 18,
                textColor: Colors.black,
                image: "google-logo.png",
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "OR",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email of Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              TextField(
                maxLines: 1,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: rememberMe,
                          builder: (context, remember, _) {
                            return Checkbox(
                              value: remember,
                              onChanged: (isChecked) {
                                rememberMe.value = isChecked;
                              },
                            );
                          },
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Remember me",
                        ),
                      ],
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                text: "Log In",
                bgColor: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 16,
              ),
              Center(
                child: RichText(
                  text: new TextSpan(
                    children: [
                      new TextSpan(
                        text: "Don't have an account? ",
                        style: new TextStyle(color: Colors.black),
                      ),
                      new TextSpan(
                        text: 'Sign Up',
                        style: new TextStyle(color: Colors.blue),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            print("Signup button clicked");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ),
                            );
                          },
                      ),
                    ],
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
