import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funday_1/logo.dart';
import 'package:flutter_funday_1/utils/authentication.dart';
import 'package:flutter_funday_1/views/dashboard/applicants.dart';
import 'package:flutter_funday_1/views/jobs/jobtile.dart';
import 'package:flutter_funday_1/views/postjob/postjob.dart';
import 'package:flutter_funday_1/widgets/button.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

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
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => PostJob()));
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
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Create New Job",
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
                              FutureBuilder<
                                      QuerySnapshot<Map<String, dynamic>>>(
                                  future: firestore
                                      .collection("jobs")
                                      .where("employer_id", isEqualTo: uid)
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
                                "Total Jobs",
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
                      .where("employer_id", isEqualTo: uid)
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
                          final List<String> skills = (data['skills'] as List)
                              .map((e) => e as String)
                              .toList();
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
                                              data['title'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              "6 days left",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          data['description'],
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          child: Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            runSpacing: 8.0,
                                            spacing: 4.0,
                                            children: skills
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
                                Container(
                                  width: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Salary",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        (data['salary_type'] == "fixed")
                                            ? (data['salary'] != null)
                                                ? "${data['salary']} XAF/monthly"
                                                : 'Not Available'
                                            : (data['salary'] != null)
                                                ? "${data['salary']} XAF/hourly"
                                                : 'Not Available',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Button(
                                        text: "Manage Job",
                                        bgColor: Colors.blue[600],
                                        textColor: Colors.white,
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => Applicants(
                                                data: data,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Button(
                                            text: "Edit",
                                            bgColor: Colors.green[600],
                                            textColor: Colors.white,
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Applicants(data: data),
                                                ),
                                              );
                                            },
                                          ),
                                          Button(
                                            text: "Delete",
                                            bgColor: Colors.red[600],
                                            textColor: Colors.white,
                                            onTap: () async {
                                              await firestore
                                                  .collection("jobs")
                                                  .doc(data["job_id"])
                                                  .delete();
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
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
