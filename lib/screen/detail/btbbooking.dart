// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Padding(
                padding: const EdgeInsets.only(left: 100, top: 70, right: 100),
                child: Image.asset('assets/images/Icon_app.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 20),
              child: Text(
                'ແອັບ BTB Booking ແມ່ນແອັບທີ່ໃຫ້ບໍລິການກ່ຽວກັບການຈອງປີ້ລົດເມໃນການເດີນທາງໃຫ້ແກ່ລູກຄ້າ',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
