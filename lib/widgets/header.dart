import 'package:flutter/material.dart';
import 'package:flutter_funday_1/logo.dart';
import 'package:flutter_funday_1/views/authentication/signin.dart';
import 'package:flutter_funday_1/views/authentication/signup.dart';
import 'package:flutter_funday_1/views/jobs/jobs.dart';
import 'package:flutter_funday_1/widgets/button.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                  width: 8,
                ),
                Button(
                  text: "Browse Jobs",
                  bgColor: Colors.transparent,
                  textColor: Colors.black,
                  onTap: () {
                    debugPrint("Open browse jobs");
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Jobs(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 4,
                ),
                Button(
                  text: "How it works",
                  bgColor: Colors.transparent,
                  textColor: Colors.black,
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Button(
                  text: "Log In",
                  bgColor: Colors.transparent,
                  textColor: Colors.black,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LogIn(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 4,
                ),
                Button(
                  text: "Sign Up",
                  bgColor: Colors.transparent,
                  textColor: Colors.black,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 4,
                ),
                // Button(
                //   text: "I Want To Hire",
                //   bgColor: Colors.orange,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
