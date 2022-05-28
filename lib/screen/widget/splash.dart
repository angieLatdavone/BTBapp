// ignore_for_file: prefer_const_constructors, camel_case_types, unused_local_variable, avoid_unnecessary_containers

import 'dart:async';
import 'package:btbpp/screen/user/login.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Padding(
                padding: const EdgeInsets.only(left: 100, top: 100, right: 100),
                child: Image.asset('assets/images/buslogo.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'BTB APP',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'Bus Ticket Booking Application',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: LinearProgressIndicator(
                minHeight: 4,
                valueColor: AlwaysStoppedAnimation(Colors.white),
                backgroundColor: Colors.white.withOpacity(.5),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'LOADING...',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
