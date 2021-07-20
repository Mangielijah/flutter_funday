import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funday_1/utils/authentication.dart';
import 'package:flutter_funday_1/views/jobs/jobtile.dart';

enum OrderBy {
  latest,
  oldest,
}

extension OrderExt on OrderBy {
  String get string => toString().replaceAll("OrderBy.", "");
}

class JobList extends StatelessWidget {
  final ValueNotifier<int> orderByNotifier = ValueNotifier(0);
  final bool fixedSalaryNotifier;
  final bool hourlySalaryNotifier;
  final bool remoteNotifier;
  final List<String> languageNotifier;
  final List<String> jobTypeNotifier;
  final List<int> categoryNotifier;

  final Country countryNotifier;
  JobList({
    Key key,
    this.fixedSalaryNotifier,
    this.hourlySalaryNotifier,
    this.remoteNotifier,
    this.languageNotifier,
    this.jobTypeNotifier,
    this.categoryNotifier,
    this.countryNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 18,
            left: 64,
            right: 64,
            bottom: 18,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ValueListenableBuilder<int>(
                valueListenable: orderByNotifier,
                builder: (context, order, _) {
                  return DropdownButton<int>(
                    value: order,
                    style: TextStyle(),
                    items: <int>[
                      0,
                      1,
                    ].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                          ),
                          child: new Text(OrderBy.values[value].string),
                        ),
                      );
                    }).toList(),
                    onChanged: (odr) => orderByNotifier.value = odr,
                  );
                },
              ),
              SizedBox(
                width: 8,
              ),
              Text('16,037 jobs found, with pricing in XAF'),
            ],
          ),
        ),
        Divider(),
        Expanded(
          flex: 2,
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: query().snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final docList = snapshot.data.docs;
                if (docList.isEmpty)
                  return Container(
                    child: Center(
                      child: Text("No Job Found"),
                    ),
                  );
                return ListView.builder(
                  itemCount: docList.length * 2,
                  itemBuilder: (context, index) {
                    if (index.isOdd) return Divider();
                    final position = index ~/ 2;

                    final data = docList[position].data();
                    return JobTile(data: data);
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
            },
          ),
        )
      ],
    );
  }

  Query<Map<String, dynamic>> query() {
    Query<Map<String, dynamic>> initQuery = firestore.collection("jobs");
    // if(orderByNotifier.value)
    if (categoryNotifier.isNotEmpty) {
      initQuery =
          initQuery.where("categories", arrayContainsAny: categoryNotifier);
    }

    // if(orderByNotifier.value)
    // if (jobTypeNotifier.isNotEmpty) {
    //   initQuery = initQuery.where("job_type", arrayContains: jobTypeNotifier);
    // }
    return initQuery;
  }
}
