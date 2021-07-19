import 'dart:html';

import 'package:badges/badges.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funday_1/widgets/button.dart';
import 'package:flutter_funday_1/widgets/header.dart';
import 'package:csc_picker/csc_picker.dart';

class JobDetial extends StatelessWidget {
  JobDetial({Key key}) : super(key: key);

  final ValueNotifier<FilePickerResult> filePickerNotifier =
      ValueNotifier(null);
  final ValueNotifier<Map<String, dynamic>> cscNotifier = ValueNotifier({});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: AppHeader(),
            ),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.only(
                  left: 100, right: 100, top: 18, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Market Research (Agencies)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Badge(
                            badgeContent: Text(
                              "APPLICATION OPEN",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            badgeColor: Colors.blue[900],
                            borderRadius: BorderRadius.circular(50),
                            shape: BadgeShape.square,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "SALARY",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                TextSpan(
                                  text: "20,000 XAF / monthly",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 100,
                  right: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
                      child: Text(
                          "Freelancer  >  Jobs  >  Browse All Jobs  >  Programming & Tech"),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Filter Section
                            Expanded(
                              flex: 3,
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.only(
                                  left: 64,
                                  right: 64,
                                  top: 30,
                                ),
                                child: ListView(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Location: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Badge(
                                          badgeColor: Colors.blue[900],
                                          shape: BadgeShape.square,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          badgeContent: Text(
                                            "Remote",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        // Text(
                                        //   "Remote",
                                        //   style: TextStyle(
                                        //     fontSize: 16,
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Language: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Container(
                                          child: Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            runSpacing: 8.0,
                                            spacing: 4.0,
                                            children: [
                                              "English",
                                              "French",
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
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Skill: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Container(
                                          child: Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            runSpacing: 8.0,
                                            spacing: 4.0,
                                            children: [
                                              "Data Entry",
                                              "Internet Marketing",
                                              "Market Research",
                                              "Marketing",
                                              "Research"
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
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      "Description",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      """Hi Friends, We need help in building a database of agency emails so we can run some promotion actives. You will need to research online and find design, advertising, and marketing agencies then enter their name, email, and size ranking into a spread sheet provided. By size ranking I mean small, medium. Hi Friends, We need help in building a database of agency emails so we can run some promotion actives. You will need to research online and find design, advertising, and marketing agencies then enter their name, email, and size ranking into a spread sheet provided. By size ranking I mean small, medium.

                                    Hi Friends, We need help in building a database of agency emails so we can run some promotion actives. You will need to research online and find design, advertising, and marketing agencies then enter their name, email, and size ranking into a spread sheet provided. By size ranking I mean small, medium. Hi Friends, We need help in building a database of agency emails so we can run some promotion actives. You will need to research online and find design, advertising, and marketing agencies then enter their name, email, and size ranking into a spread sheet provided. By size ranking I mean small, medium""",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 17,
                                        letterSpacing: 1.2,
                                        wordSpacing: 1.5,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      "Apply for this job",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    TextField(
                                      maxLines: 1,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        hintText: "Full Names",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    TextField(
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: "Email address",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    TextField(
                                      maxLines: 1,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintText: "Phone number",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable: cscNotifier,
                                      builder: (context, cscMap, _) {
                                        return CSCPicker(
                                          defaultCountry:
                                              DefaultCountry.Cameroon,
                                          onCountryChanged: (value) {
                                            cscNotifier.value = {
                                              "country": value,
                                              "state": cscMap['state'],
                                              "city": cscMap['city']
                                            };
                                          },
                                          onStateChanged: (value) {
                                            // setState(() {
                                            //   stateValue = value;
                                            // });
                                            cscNotifier.value = {
                                              "country": cscMap['country'],
                                              "state": value,
                                              "city": cscMap['city']
                                            };
                                          },
                                          onCityChanged: (value) {
                                            // setState(() {
                                            //   cityValue = value;
                                            // });
                                            cscNotifier.value = {
                                              "country": cscMap['country'],
                                              "state": cscMap['city'],
                                              "city": value,
                                            };
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Button(
                                          onTap: () {
                                            getInput();
                                          },
                                          text: 'Input Cover Letter',
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        ValueListenableBuilder<
                                            FilePickerResult>(
                                          valueListenable: filePickerNotifier,
                                          builder:
                                              (context, filePickerResult, _) {
                                            return (filePickerResult == null)
                                                ? Text('')
                                                : Container(
                                                    padding:
                                                        EdgeInsets.all(9.0),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.grey[100]),
                                                    child: Text(
                                                      filePickerResult.names[0],
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                      ),
                                                    ),
                                                  );
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Button(text: 'Submit')
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getInput() async {
    filePickerNotifier.value = await FilePicker.platform.pickFiles();
    // return result;
  }
}
