import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funday_1/utils/authentication.dart';
import 'package:flutter_funday_1/views/authentication/signin.dart';
import 'package:flutter_funday_1/views/dashboard/dashboard.dart';
import 'package:flutter_funday_1/views/home/home.dart';
import 'package:flutter_funday_1/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<bool>(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data) {
                return Dashboard();
              }
              return Home();
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
