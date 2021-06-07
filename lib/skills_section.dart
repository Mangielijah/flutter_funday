import 'package:flutter/material.dart';
import 'package:flutter_funday_1/model/skill.dart';

class SkillSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeader(
            text: "What skills are required?",
          ),
          SizedBox(
            height: 12,
          ),
          SubtitleText(
            subtitleText:
                "Enter up to 5 skills that best describe your project. Freelancers will use these skills to find projects they are most interested and experienced in.",
          ),
          SizedBox(
            height: 12,
          ),
          SkillPanel()
        ],
      ),
    );
  }
}

class TextHeader extends StatelessWidget {
  final String text;
  TextHeader({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class SubtitleText extends StatelessWidget {
  final subtitleText;
  SubtitleText({
    this.subtitleText: "This is an optional parameter",
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.subtitleText,
      ),
    );
  }
}

class SkillPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: 75,
        width: constraints.maxWidth,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
        padding: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: constraints.maxWidth,
              height: (75 / 2) - 5,
              child: ListView.builder(
                itemCount: Skill.skillList.length,
                scrollDirection: Axis.horizontal,
                // primary: true,

                itemBuilder: (BuildContext context, int index) {
                  List<Skill> list = Skill.skillList;
                  return Container(
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    margin: EdgeInsets.only(right: 4),
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 4,
                      bottom: 4,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              list[index].skillName,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.close,
                          size: 18,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: (75 / 2) - 5,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter skills here...",
                ),
                maxLines: 1,
              ),
            )
          ],
        ),
      );
    });
  }
}
