import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkillSection extends StatelessWidget {
  final ValueNotifier<List<String>> notifier;
  const SkillSection({this.notifier});
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
          SkillPanel(skillNotifier: notifier)
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
  // final ValueNotifier<List<String>> skillNotifier = ValueNotifier([]);
  final TextEditingController controller = TextEditingController();
  final ValueNotifier<List<String>> skillNotifier;
  SkillPanel({this.skillNotifier});
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
            ValueListenableBuilder<List<String>>(
              valueListenable: skillNotifier,
              builder: (context, skills, child) {
                return Container(
                  width: constraints.maxWidth,
                  height: /*(skills.isEmpty) ? 0 :*/ (75 / 2) - 5,
                  child: ListView.builder(
                    itemCount: skills.length,
                    scrollDirection: Axis.horizontal,
                    // primary: true,

                    itemBuilder: (BuildContext context, int index) {
                      // List<Skill> list = Skill.skillList;
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
                                  skills[index],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                List nSkill = skillNotifier.value;
                                nSkill.removeAt(index);
                                skillNotifier.value = [...nSkill];
                              },
                              child: Icon(
                                Icons.close,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Container(
              height: (75 / 2) - 5,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter skill here and press enter",
                ),
                onSubmitted: (skill) {
                  skillNotifier.value = [...skillNotifier.value, skill];

                  controller.text = "";
                },
                maxLines: 1,
              ),
            )
          ],
        ),
      );
    });
  }
}
