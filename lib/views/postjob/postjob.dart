import 'package:flutter/material.dart';
import 'package:flutter_funday_1/views/postjob/list_state_notifier.dart';
import 'package:flutter_funday_1/logo.dart';
import 'package:flutter_funday_1/next_button.dart';
import 'package:flutter_funday_1/skill/skills_section.dart';
import 'package:flutter_funday_1/strings.dart';
import 'package:flutter_funday_1/text_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostJob extends StatelessWidget {
  const PostJob({Key key}) : super(key: key);
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
                                  height: 10,
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
                                    height: 200,
                                    color: Colors.red,
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
}
