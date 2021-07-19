import 'package:flutter/material.dart';
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
  JobList({Key key}) : super(key: key);

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
          child: ListView.builder(
            itemCount: 20 * 2,
            itemBuilder: (context, index) {
              if (index.isOdd) return Divider();
              final position = index ~/ 2;
              return JobTile();
            },
          ),
        )
      ],
    );
  }
}
