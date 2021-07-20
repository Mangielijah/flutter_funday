import 'package:flutter/material.dart';
import 'package:flutter_funday_1/logo.dart';
import 'package:flutter_funday_1/utils/authentication.dart';
import 'package:flutter_funday_1/views/authentication/signin.dart';
import 'package:flutter_funday_1/views/authentication/signup.dart';
import 'package:flutter_funday_1/views/dashboard/dashboard.dart';
import 'package:flutter_funday_1/views/jobs/jobs.dart';
import 'package:flutter_funday_1/views/postjob/postjob.dart';
import 'package:flutter_funday_1/widgets/button.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 48, right: 48),
        child: ListView(
          children: [
            Container(
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
                        Logo(
                          textColor: Colors.blue[900],
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
                        (uid != null)
                            ? Container(
                                child: Button(
                                  text: "Dashboard",
                                  bgColor: Colors.transparent,
                                  textColor: Colors.black,
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Dashboard(),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(
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
                              ),
                        SizedBox(
                          width: 4,
                        ),
                        Button(
                          text: "I Want To Hire",
                          bgColor: Colors.orange,
                          onTap: () {
                            if (uid != null)
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Dashboard(),
                                ),
                              );
                            else
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => LogIn()),
                              );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: size.height,
              child: Row(
                children: [
                  Container(
                    width: (size.width - 96) / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hire the best talent for any job, online today.",
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 58,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Millions of people use freelancer.com to hire the best talents for their projects and companies.",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Button(
                                text: "Hire A Talent",
                                bgColor: Colors.pink,
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(24),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SignUp(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Flexible(
                              child: BorderButton(
                                text: "Find A New Job Today",
                                borderColor: Colors.black,
                                textColor: Colors.black,
                                padding: const EdgeInsets.all(24),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Jobs(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  Container(
                    width: (size.width - 96) / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "home-img.jpg",
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
