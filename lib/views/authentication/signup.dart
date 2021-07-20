import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funday_1/logo.dart';
import 'package:flutter_funday_1/utils/authentication.dart';
import 'package:flutter_funday_1/views/authentication/about_company.dart';
import 'package:flutter_funday_1/views/authentication/signin.dart';
import 'package:flutter_funday_1/views/dashboard/dashboard.dart';
import 'package:flutter_funday_1/widgets/button.dart';

class SignUp extends StatelessWidget {
  SignUp({Key key}) : super(key: key);
  final ValueNotifier<bool> acceptNotifier = ValueNotifier(false);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BorderButton(
                text: "Continue with Google",
                borderColor: Colors.grey,
                fontSize: 18,
                textColor: Colors.black,
                image: "google-logo.png",
                onTap: () async {
                  User user = await signInWithGoogle();
                  if (user != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AboutCompany(),
                      ),
                    );
                  }
                },
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
                controller: emailController,
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
                controller: passwordController,
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
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: acceptNotifier,
                      builder: (context, accept, _) {
                        return Checkbox(
                          value: accept,
                          onChanged: (isChecked) {
                            acceptNotifier.value = isChecked;
                          },
                        );
                      },
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Flexible(
                      child: RichText(
                        maxLines: 2,
                        text: new TextSpan(
                          children: [
                            new TextSpan(
                              text: "I agree to the Freelancer ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            new TextSpan(
                              text: "User Agreement",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  debugPrint("You tap agreement");
                                },
                            ),
                            new TextSpan(
                              text: " and ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            new TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    debugPrint("You tap policy");
                                  }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                text: "Create Account",
                bgColor: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                onTap: () async {
                  if (emailController.text != null &&
                      passwordController.text != null &&
                      acceptNotifier.value == true) {
                    User user = await registerWithEmailPassword(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                    );
                    if (user != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Dashboard(),
                        ),
                      );
                    }
                  }
                },
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
                        text: "Already have an account? ",
                        style: new TextStyle(color: Colors.black),
                      ),
                      new TextSpan(
                        text: 'Log in',
                        style: new TextStyle(color: Colors.blue),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LogIn(),
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
