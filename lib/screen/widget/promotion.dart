// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_unnecessary_containers

import 'package:btbpp/confirm/confirm_order.dart';
import 'package:btbpp/screen/detail/call_center.dart';
import 'package:btbpp/screen/detail/story.dart';
import 'package:btbpp/screen/homescreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Promotion extends StatefulWidget {
  const Promotion({Key? key}) : super(key: key);

  @override
  State<Promotion> createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  final List<String> imageList = [
    'assets/images/lazada1.jpg',
    'assets/images/lazada2.jpg',
    'assets/images/lazada3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              CarouselSlider(
                options: CarouselOptions(
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 50),
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    //enableInfiniteScroll: false,

                    autoPlay: true
                    // autoPlay: false,
                    ),
                items: imageList
                    .map(
                      (item) => Container(
                        margin: EdgeInsets.all(10),
                        height: 350,
                        width: width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(26, 253, 246, 246),
                )),
                onPressed: () {},
                icon: Icon(
                  Icons.apps,
                  color: Colors.black,
                ),
                label: Text(
                  'ບໍລິການຂອງເຮົາ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Ink(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            icon: Icon(
                              Icons.airport_shuttle,
                              color: Colors.lightBlue,
                            ),
                            iconSize: 80,
                          ),
                        ),
                      ),
                      Text(
                        'ຈອງປີ້ລົດເມ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Ink(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            onPressed: () {
                              var data;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ConfirmOrder(data: data)));
                            },
                            icon: Icon(
                              Icons.check,
                              color: Colors.lightBlue,
                            ),
                            iconSize: 80,
                          ),
                        ),
                      ),
                      Text(
                        'ຢືນຢັນການຈອງ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Ink(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Story()));
                            },
                            icon: Icon(
                              Icons.date_range,
                              color: Colors.lightBlue,
                            ),
                            iconSize: 80,
                          ),
                        ),
                      ),
                      Text(
                        'ປະຫວັດການຈອງ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Ink(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CallCenter()));
                            },
                            icon: Icon(
                              Icons.badge_outlined,
                              color: Colors.lightBlue,
                            ),
                            iconSize: 80,
                          ),
                        ),
                      ),
                      Text(
                        'ຕິດຕໍ່ເຮົາ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Ink(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.assignment_outlined,
                              color: Colors.lightBlue,
                            ),
                            iconSize: 80,
                          ),
                        ),
                      ),
                      Text(
                        'ຄູ່ມືການໃຊ້ງານ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Ink(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.book_rounded,
                              color: Colors.lightBlue,
                            ),
                            iconSize: 80,
                          ),
                        ),
                      ),
                      Text(
                        'ຂ່າວສານ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
