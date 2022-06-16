// ignore_for_file: unused_local_variable, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CallCenter extends StatefulWidget {
  const CallCenter({Key? key}) : super(key: key);

  @override
  State<CallCenter> createState() => _CallCenterState();
}

class _CallCenterState extends State<CallCenter> {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 40),
                width: 200,
                height: 200,
                child: Image.asset('assets/images/icon.png'),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BTB Booking Customer Service',
                          style: TextStyle(
                              fontSize: 20, fontFamily: 'Times New Roman'),
                        ),
                        // SizedBox(width: 10),
                        // Text(
                        //   '020 98877117',
                        //   style: TextStyle(fontSize: 20),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ສຳສັບລູກຄ້າທີ່ຕ້ອງການຕິດຕໍ່ສອບຖາມຂໍ້ມູນ',
                          style: TextStyle(fontSize: 15),
                        ),
                        // SizedBox(width: 10),
                        Text(
                          'ສາມາດພົວພັນໄດ້ຕາມເບີທາງດ້ານລຸ່ມນີ້',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ເບີໂທ:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '020 95964011',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ເບີວອດແອັບ:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '020 98877117',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 200),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Email:',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'latdavone2002@gmail.com',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
