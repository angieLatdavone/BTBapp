// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print, must_be_immutable

import 'package:btbpp/screen/widget/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent), // status bar color
  );
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final FirebaseAuth auth = FirebaseAuth.instance;
  late User? user = auth.currentUser;
  late String? uid = user?.uid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          print(uid);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BTB App',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            home: Splash_Screen(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
