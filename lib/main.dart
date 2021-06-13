import 'package:flutter/material.dart';
import 'package:flutter_funday_1/freelancer.dart';
import 'package:flutter_funday_1/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Freelancer(),
    );
  }
}
