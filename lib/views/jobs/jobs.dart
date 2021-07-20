import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funday_1/model/category.dart';
import 'package:flutter_funday_1/views/authentication/signup.dart';
import 'package:flutter_funday_1/views/jobs/joblist.dart';
import 'package:flutter_funday_1/widgets/button.dart';
import 'package:flutter_funday_1/widgets/header.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

class Jobs extends StatelessWidget {
  final ValueNotifier<bool> fixedSalaryNotifier = ValueNotifier(false);
  final ValueNotifier<bool> hourlySalaryNotifier = ValueNotifier(false);
  final ValueNotifier<bool> remoteNotifier = ValueNotifier(false);
  final ValueNotifier<List<String>> languageNotifier = ValueNotifier([]);
  final ValueNotifier<List<String>> jobTypeNotifier = ValueNotifier([]);
  final ValueNotifier<List<int>> categoryNotifier = ValueNotifier([]);

  final ValueNotifier<Country> countryNotifier =
      ValueNotifier(CountryPickerUtils.getCountryByIsoCode('CM'));
  Jobs({Key key}) : super(key: key);

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
                    "Browse Jobs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Button(
                    text: "I want to Hire",
                    bgColor: Colors.orange,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
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
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 30,
                                  left: 30,
                                  right: 30,
                                  bottom: 2,
                                ),
                                color: Colors.white,
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "Filter By:",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 18,
                                    ), //Job Type Section
                                    Text(
                                      "Categories",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18,
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
                                                ValueListenableBuilder<
                                                    List<int>>(
                                                  valueListenable:
                                                      categoryNotifier,
                                                  builder: (context,
                                                      categoriesId, _) {
                                                    final categoryChecked =
                                                        categoriesId
                                                            .contains(index);
                                                    return Checkbox(
                                                      value: categoryChecked,
                                                      onChanged: (isChecked) {
                                                        if (isChecked) {
                                                          categoryNotifier
                                                              .value = [
                                                            ...categoriesId,
                                                            index
                                                          ];
                                                        } else {
                                                          categoriesId
                                                              .remove(index);

                                                          categoryNotifier
                                                              .value = [
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
                                                  categories[index]
                                                      .categoryName,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
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
                                        ValueListenableBuilder<List<String>>(
                                          valueListenable: jobTypeNotifier,
                                          builder: (context, jobTypes, _) {
                                            final fullTimeChecked =
                                                jobTypes.contains("fulltime");
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
                                                  jobTypes.remove('fulltime');

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
                                        ValueListenableBuilder<List<String>>(
                                          valueListenable: jobTypeNotifier,
                                          builder: (context, jobTypes, _) {
                                            final fullTimeChecked =
                                                jobTypes.contains("parttime");
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
                                                  jobTypes.remove('parttime');

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
                                        ValueListenableBuilder<List<String>>(
                                          valueListenable: jobTypeNotifier,
                                          builder: (context, jobTypes, _) {
                                            final fullTimeChecked =
                                                jobTypes.contains("contract");
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
                                                  jobTypes.remove('contract');

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
                                        ValueListenableBuilder<List<String>>(
                                          valueListenable: jobTypeNotifier,
                                          builder: (context, jobTypes, _) {
                                            final fullTimeChecked =
                                                jobTypes.contains("internship");
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
                                                  jobTypes.remove('internship');

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
                                          valueListenable: fixedSalaryNotifier,
                                          builder:
                                              (context, fixedSalaryEnabled, _) {
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
                                          "Fixed Salary Jobs",
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
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: "min",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.zero,
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
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: "max",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.zero,
                                                borderSide: BorderSide(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    //Hourly Salary Jobs

                                    SizedBox(
                                      height: 18,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ValueListenableBuilder(
                                          valueListenable: hourlySalaryNotifier,
                                          builder: (context,
                                              hourlySalaryEnabled, _) {
                                            return Checkbox(
                                              value: hourlySalaryEnabled,
                                              onChanged: (isChecked) {
                                                hourlySalaryNotifier.value =
                                                    isChecked;
                                              },
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "Hourly Salary Jobs",
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
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: "min",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.zero,
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
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: "max",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.zero,
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
                                        ValueListenableBuilder<List<String>>(
                                          valueListenable: languageNotifier,
                                          builder: (context, languages, _) {
                                            final englishChecked =
                                                languages.contains("english");
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
                                        ValueListenableBuilder<List<String>>(
                                          valueListenable: languageNotifier,
                                          builder: (context, languages, _) {
                                            final englishChecked =
                                                languages.contains("french");
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
                                      child: ValueListenableBuilder<Country>(
                                        valueListenable: countryNotifier,
                                        builder: (context, country, _) {
                                          return buildDialogItem(country);
                                        },
                                      ),
                                    ),

                                    SizedBox(
                                      height: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                color: Colors.white,
                                child: MultiValueListenableBuider(
                                    valueListenables: [
                                      fixedSalaryNotifier,
                                      hourlySalaryNotifier,
                                      remoteNotifier,
                                      languageNotifier,
                                      jobTypeNotifier,
                                      categoryNotifier,
                                      countryNotifier
                                    ],
                                    builder: (context, values, _) {
                                      return JobList(
                                        fixedSalaryNotifier:
                                            fixedSalaryNotifier.value,
                                        hourlySalaryNotifier:
                                            hourlySalaryNotifier.value,
                                        remoteNotifier: remoteNotifier.value,
                                        languageNotifier:
                                            languageNotifier.value,
                                        jobTypeNotifier: jobTypeNotifier.value,
                                        categoryNotifier:
                                            categoryNotifier.value,
                                        countryNotifier: countryNotifier.value,
                                      );
                                    }),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
