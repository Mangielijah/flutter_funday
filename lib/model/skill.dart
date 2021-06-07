import 'dart:collection';

import 'package:flutter/foundation.dart';

List<Skill> _skillList = [];

class Skill {
  String skillId;
  String skillName;
  Skill({
    @required this.skillId,
    @required this.skillName,
  });

  static List<Skill> get skillList => UnmodifiableListView(_getListOfSkills());

  static List<Skill> _getListOfSkills() {
    // List<Skill> _skillList = [];
    for (var skill in skillListJson) {
      _skillList.add(
        Skill(
          skillId: (skill["id"]).toString(),
          skillName: skill["skill"],
        ),
      );
    }

    return _skillList;
  }
}

// Map<String, dynamic> skillJson = {"id": 0, "skill": "Website Design"};

List<Map<String, dynamic>> skillListJson = [
  {"id": 0, "skill": "Website Design"},
  {"id": 1, "skill": "Graphics Design"},
  {"id": 2, "skill": "Mobile App Design"},
  {"id": 3, "skill": "UI / UX"},
  {"id": 4, "skill": "Wordpress"},
  {"id": 5, "skill": "Shopify"},
  {"id": 6, "skill": "Web Search"},
  {"id": 7, "skill": "SEO"},
  {"id": 8, "skill": "Digital Marketing"},
  {"id": 9, "skill": "React"},
  {"id": 10, "skill": "React Native"},
];
