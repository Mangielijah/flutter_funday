import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funday_1/model/category.dart';
import 'package:flutter_funday_1/list_state_notifier.dart';
import 'package:flutter_funday_1/logo.dart';
import 'package:flutter_funday_1/next_button.dart';
import 'package:flutter_funday_1/skill/skills_section.dart';
import 'package:flutter_funday_1/strings.dart';
import 'package:flutter_funday_1/text_input.dart';
import 'package:flutter_funday_1/widgets/button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostJob extends StatelessWidget {
  final ValueNotifier<List<int>> categoryNotifier = ValueNotifier([]);
  final ValueNotifier<bool> fixedSalaryNotifier = ValueNotifier(false);
  final ValueNotifier<bool> hourlySalaryNotifier = ValueNotifier(false);
  final ValueNotifier<bool> remoteNotifier = ValueNotifier(false);
  final ValueNotifier<List<String>> languageNotifier =
      ValueNotifier(['english', 'french']);
  final ValueNotifier<List<String>> jobTypeNotifier =
      ValueNotifier(['fulltime']);
  final ValueNotifier<Country> countryNotifier =
      ValueNotifier(CountryPickerUtils.getCountryByIsoCode('CM'));

  PostJob({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: size.height,
        child: ListView(
          children: [
            Container(
              height: size.height,
              child: Stack(children: [
                Container(
                  height: (2 / 3) * size.height,
                  color: Colors.blue,
                ),
                Center(
                  child: Container(
                    width: 900,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 38, right: 38),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 48,
                              ),
                              Logo(),
                              SizedBox(
                                height: 38,
                              ),
                              Text(
                                "Tell us what you need done",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 38,
                              ),
                              Text(
                                "Contact skilled freelancers within minutes. View profiles, ratings, portfolios and chat with them. Pay the freelancer only when you are 100% satisfied with their work.",
                                style: TextStyle(
                                  color: Colors.white,
                                  height: 1.7,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(36),
                            width: 900,
                            child: ListView(
                              children: [
                                TextInputWidget(
                                  textType: TextType.text,
                                  title: Strings.whatDoYouWantBuild,
                                  hint: "e.g Build me a Website",
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Select Categories",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 40.0 * categories.length,
                                  child: ListView.builder(
                                    itemCount: categories.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return
                                          //Categories CheckBoxs
                                          Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ValueListenableBuilder<List<int>>(
                                              valueListenable: categoryNotifier,
                                              builder:
                                                  (context, categoriesId, _) {
                                                final categoryChecked =
                                                    categoriesId
                                                        .contains(index);
                                                return Checkbox(
                                                  value: categoryChecked,
                                                  onChanged: (isChecked) {
                                                    if (isChecked) {
                                                      categoryNotifier.value = [
                                                        ...categoriesId,
                                                        index
                                                      ];
                                                    } else {
                                                      categoriesId
                                                          .remove(index);

                                                      categoryNotifier.value = [
                                                        ...categoriesId
                                                      ];
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              categories[index].categoryName,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                TextInputWidget(
                                  textType: TextType.textarea,
                                  title: "Tell us more about your project",
                                  subtitle:
                                      "Start with a bit about yourself or your business, and include an overview of what you need done.",
                                  hint: "Describe your project here ...",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Consumer(
                                  child: NextButton(
                                    sideText: Strings.ctrlEnter,
                                    onTap: () {
                                      ListStateNotifier notifier = context
                                          .read(listStateProvider.notifier);
                                      List<String> tempState = notifier.state;
                                      tempState.add("SKILLS");
                                      tempState.add("BUTTON2");
                                      notifier.state = [...tempState];
                                    },
                                  ),
                                  builder: (context, watch, child) {
                                    List<String> listState =
                                        watch(listStateProvider);
                                    return (listState.isEmpty)
                                        ? child
                                        : Container();
                                  },
                                ),
                                Consumer(
                                  child: SkillSection(),
                                  builder: (context, watch, child) {
                                    List<String> listState =
                                        watch(listStateProvider);
                                    return (listState.contains("SKILLS"))
                                        ? child
                                        : Container();
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Consumer(
                                  child: NextButton(
                                    sideText: Strings.pressEnter,
                                    onTap: () {
                                      ListStateNotifier notifier = context
                                          .read(listStateProvider.notifier);
                                      List<String> tempState = notifier.state;
                                      tempState.add("CHOICESECTION");
                                      tempState.remove("BUTTON2");
                                      notifier.state = [...tempState];
                                    },
                                  ),
                                  builder: (context, watch, child) {
                                    List<String> listState =
                                        watch(listStateProvider);
                                    return (listState.contains("BUTTON2"))
                                        ? child
                                        : Container();
                                  },
                                ),
                                Consumer(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Salary",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ValueListenableBuilder(
                                              valueListenable:
                                                  fixedSalaryNotifier,
                                              builder: (context,
                                                  fixedSalaryEnabled, _) {
                                                return Checkbox(
                                                  value: fixedSalaryEnabled,
                                                  onChanged: (isChecked) {
                                                    fixedSalaryNotifier.value =
                                                        isChecked;
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "Fixed/Non-Fixed",
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            //min fixed price
                                            Expanded(
                                              flex: 2,
                                              child: TextField(
                                                maxLines: 1,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  hintText: "min",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.zero,
                                                    borderSide: BorderSide(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text("to"),
                                              ),
                                            ),
                                            //max fixed Price
                                            Expanded(
                                              flex: 2,
                                              child: TextField(
                                                maxLines: 1,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  hintText: "max",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.zero,
                                                    borderSide: BorderSide(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 18,
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        //Language Section
                                        Text(
                                          "Languages",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ValueListenableBuilder<
                                                List<String>>(
                                              valueListenable: languageNotifier,
                                              builder: (context, languages, _) {
                                                final englishChecked = languages
                                                    .contains("english");
                                                return Checkbox(
                                                  value: englishChecked,
                                                  onChanged: (isChecked) {
                                                    final langs =
                                                        languageNotifier.value;
                                                    if (isChecked) {
                                                      languageNotifier.value = [
                                                        ...langs,
                                                        'english'
                                                      ];
                                                    } else {
                                                      langs.remove('english');

                                                      languageNotifier.value = [
                                                        ...langs
                                                      ];
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "English",
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        //French CheckBoxs
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ValueListenableBuilder<
                                                List<String>>(
                                              valueListenable: languageNotifier,
                                              builder: (context, languages, _) {
                                                final englishChecked = languages
                                                    .contains("french");
                                                return Checkbox(
                                                  value: englishChecked,
                                                  onChanged: (isChecked) {
                                                    final langs =
                                                        languageNotifier.value;
                                                    if (isChecked) {
                                                      languageNotifier.value = [
                                                        ...langs,
                                                        'french'
                                                      ];
                                                    } else {
                                                      langs.remove('french');

                                                      languageNotifier.value = [
                                                        ...langs
                                                      ];
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "French",
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 18,
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 16,
                                        ),

                                        //Location Section
                                        Text(
                                          "Location",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ValueListenableBuilder(
                                              valueListenable: remoteNotifier,
                                              builder: (context, isRemote, _) {
                                                return Checkbox(
                                                  value: isRemote,
                                                  onChanged: (isChecked) {
                                                    remoteNotifier.value =
                                                        isChecked;
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "Remote",
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        //French CheckBoxs
                                        InkWell(
                                          onTap: () =>
                                              openFilteredCountryPickerDialog(
                                                  context),
                                          child:
                                              ValueListenableBuilder<Country>(
                                            valueListenable: countryNotifier,
                                            builder: (context, country, _) {
                                              return buildDialogItem(country);
                                            },
                                          ),
                                        ),

                                        SizedBox(
                                          height: 18,
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 16,
                                        ),

                                        //Job Type Section
                                        Text(
                                          "Job Type",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ValueListenableBuilder<
                                                List<String>>(
                                              valueListenable: jobTypeNotifier,
                                              builder: (context, jobTypes, _) {
                                                final fullTimeChecked = jobTypes
                                                    .contains("fulltime");
                                                return Checkbox(
                                                  value: fullTimeChecked,
                                                  onChanged: (isChecked) {
                                                    // final types =
                                                    //     jobTypeNotifier.value;
                                                    if (isChecked) {
                                                      jobTypeNotifier.value = [
                                                        ...jobTypes,
                                                        "fulltime"
                                                      ];
                                                    } else {
                                                      jobTypes
                                                          .remove('fulltime');

                                                      jobTypeNotifier.value = [
                                                        ...jobTypes
                                                      ];
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "Full Time",
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        //Part Time CheckBoxs
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ValueListenableBuilder<
                                                List<String>>(
                                              valueListenable: jobTypeNotifier,
                                              builder: (context, jobTypes, _) {
                                                final fullTimeChecked = jobTypes
                                                    .contains("parttime");
                                                return Checkbox(
                                                  value: fullTimeChecked,
                                                  onChanged: (isChecked) {
                                                    // final types =
                                                    //     jobTypeNotifier.value;
                                                    if (isChecked) {
                                                      jobTypeNotifier.value = [
                                                        ...jobTypes,
                                                        "parttime"
                                                      ];
                                                    } else {
                                                      jobTypes
                                                          .remove('parttime');

                                                      jobTypeNotifier.value = [
                                                        ...jobTypes
                                                      ];
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "Part Time",
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        //Contract CheckBoxs
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ValueListenableBuilder<
                                                List<String>>(
                                              valueListenable: jobTypeNotifier,
                                              builder: (context, jobTypes, _) {
                                                final fullTimeChecked = jobTypes
                                                    .contains("contract");
                                                return Checkbox(
                                                  value: fullTimeChecked,
                                                  onChanged: (isChecked) {
                                                    // final types =
                                                    //     jobTypeNotifier.value;
                                                    if (isChecked) {
                                                      jobTypeNotifier.value = [
                                                        ...jobTypes,
                                                        "contract"
                                                      ];
                                                    } else {
                                                      jobTypes
                                                          .remove('contract');

                                                      jobTypeNotifier.value = [
                                                        ...jobTypes
                                                      ];
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "Contract",
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 6,
                                        ),
                                        //Internship CheckBoxs
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ValueListenableBuilder<
                                                List<String>>(
                                              valueListenable: jobTypeNotifier,
                                              builder: (context, jobTypes, _) {
                                                final fullTimeChecked = jobTypes
                                                    .contains("internship");
                                                return Checkbox(
                                                  value: fullTimeChecked,
                                                  onChanged: (isChecked) {
                                                    // final types =
                                                    //     jobTypeNotifier.value;
                                                    if (isChecked) {
                                                      jobTypeNotifier.value = [
                                                        ...jobTypes,
                                                        "internship"
                                                      ];
                                                    } else {
                                                      jobTypes
                                                          .remove('internship');

                                                      jobTypeNotifier.value = [
                                                        ...jobTypes
                                                      ];
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "Internship",
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 18,
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Button(
                                          text: 'Submit',
                                        ),
                                      ],
                                    ),
                                  ),
                                  builder: (context, watch, child) {
                                    List<String> listState =
                                        watch(listStateProvider);
                                    return listState.contains("CHOICESECTION")
                                        ? child
                                        : Container();
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  void openFilteredCountryPickerDialog(context) => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your phone code'),
            onValuePicked: (Country country) => countryNotifier.value = country,
            // itemFilter: (c) => ['AR', 'DE', 'GB', 'CN'].contains(c.isoCode),
            itemBuilder: buildDialogItem,
          ),
        ),
      );

  Widget buildDialogItem(Country country) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: <Widget>[
            SizedBox(width: 8.0),
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(width: 8.0),
            Expanded(child: Text(country.name)),
          ],
        ),
      );
}
