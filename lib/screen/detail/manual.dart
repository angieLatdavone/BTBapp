// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';

class HowToScreen extends StatefulWidget {
  const HowToScreen({Key? key}) : super(key: key);

  @override
  State<HowToScreen> createState() => _HowToScreenState();
}

class _HowToScreenState extends State<HowToScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(left: 5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey.withOpacity(0.3)),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 350,
              width: width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/how1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 350,
              width: width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/how2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 350,
              width: width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/how3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 350,
              width: width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/how4.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 350,
              width: width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/how5.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 350,
              width: width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/how6.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
