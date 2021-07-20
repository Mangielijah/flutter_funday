import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funday_1/logo.dart';
import 'package:flutter_funday_1/utils/authentication.dart';
import 'package:flutter_funday_1/widgets/button.dart';
import 'dart:html' as html;

class Applicants extends StatelessWidget {
  final Map<String, dynamic> data;
  const Applicants({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: 150,
          right: 150,
        ),
        child: Column(
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
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          },
                          child: Center(
                            child: Logo(
                              textColor: Colors.black,
                            ),
                          ),
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
                        // Button(
                        //   text: "I Want To Hire",
                        //   bgColor: Colors.orange,
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              padding: EdgeInsets.all(
                20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => PostJob()));
                      },
                      child: Container(
                        color: Colors.blue,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 50,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Create New Job",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        color: Colors.blue,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FutureBuilder<
                                      QuerySnapshot<Map<String, dynamic>>>(
                                  future: firestore
                                      .collection("jobs")
                                      .doc(data['job_id'])
                                      .collection('applications')
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        snapshot.data.docs.length.toString(),
                                        style: TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                        ),
                                      );
                                    }
                                    if (snapshot.hasError) {
                                      return Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      );
                                    }
                                    return CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                    );
                                  }),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Applicant's",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        color: Colors.blue,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 50,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: firestore
                      .collection("jobs")
                      .doc(data['job_id'])
                      .collection('applications')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final docList = snapshot.data.docs;
                      return ListView.builder(
                        itemCount: docList.length * 2,
                        itemBuilder: (context, index) {
                          if (index.isOdd) return Divider();
                          final position = index ~/ 2;
                          final data = docList[position].data();
                          return Container(
                            padding: const EdgeInsets.only(
                                left: 64.0, right: 64.0, top: 24, bottom: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              data['name'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              "6 days ago",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Email: ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Container(
                                              child: Badge(
                                                badgeColor: Colors.blue[900],
                                                shape: BadgeShape.square,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                badgeContent: Text(
                                                  data['email'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Phone Number: ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Container(
                                              child: Badge(
                                                badgeColor: Colors.blue[900],
                                                shape: BadgeShape.square,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                badgeContent: Text(
                                                  data['phone'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                          child: Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            runSpacing: 8.0,
                                            spacing: 4.0,
                                            children: <String>[
                                              data['city'],
                                              data['state'],
                                              data['country'],
                                            ]
                                                .map(
                                                  (String skill) => Badge(
                                                    badgeColor:
                                                        Colors.blue[900],
                                                    shape: BadgeShape.square,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    badgeContent: Text(
                                                      skill,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 24,
                                ),
                                Button(
                                  text: "View Resume",
                                  onTap: () async {
                                    html.window.open(data['resume'], "_blank");
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    if (snapshot.hasError) {
                      return Icon(
                        Icons.cancel,
                        color: Colors.white,
                      );
                    }
                    return CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    );
                  }),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
