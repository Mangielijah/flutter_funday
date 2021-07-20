import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_funday_1/views/dashboard/applicants.dart';
import 'package:flutter_funday_1/views/jobs/jobdetail.dart';
import 'package:flutter_funday_1/widgets/button.dart';

class JobTile extends StatelessWidget {
  final Map<String, dynamic> data;
  const JobTile({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> skills =
        (data['skills'] as List).map((e) => e as String).toList();
    return Container(
      padding:
          const EdgeInsets.only(left: 64.0, right: 64.0, top: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runSpacing: 8.0,
                      spacing: 4.0,
                      children: skills
                          .map(
                            (String skill) => Badge(
                              badgeColor: Colors.blue[900],
                              shape: BadgeShape.square,
                              borderRadius: BorderRadius.circular(6),
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  text: "View Job",
                  bgColor: Colors.blue[600],
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => JobDetial(data: data),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
