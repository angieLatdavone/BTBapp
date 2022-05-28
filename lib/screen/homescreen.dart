// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, non_constant_identifier_names

import 'package:btbpp/models/bushome.dart';
import 'package:btbpp/screen/user/profile.dart';
import 'package:btbpp/screen/widget/bus_list.dart';
import 'package:btbpp/screen/widget/bus_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> model_Stream =
      FirebaseFirestore.instance.collection("model_tb_car").snapshots();
  CollectionReference model_destination =
      FirebaseFirestore.instance.collection('model_tb_car');
  // var selected = 0;
  final pageController = PageController();
  // final bus = Bus.generateTicket();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: model_Stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        final List storeDocs = [];
        snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          storeDocs.add(data);
          data['id'] = document.id;
        }).toList();
        print("------");
        print(storeDocs);

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 25, left: 25),
                    width: width,
                    height: 80,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text('BTB App',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text('Bus Ticket Booking',
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(height: 5),
                              Text('application and bus ticket booking',
                                  style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()));
                                },
                                child: Container(
                                  width: 55,
                                  height: 55,
                                  child: Icon(
                                    Icons.person,
                                    size: 45,
                                    color: Colors.white,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                              Text('profile', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ]),
                  ),
                  Container(
                    width: width,
                    color: Colors.grey.shade200,
                    child: BusList(storeDocs, (int index) {
                      setState(() {
                        storeDocs = index;
                      });
                      pageController.jumpToPage(index);
                    }, bus),
                  ),
                ],
              ),
              preferredSize: Size.fromHeight(90),
            ),
          ),
          backgroundColor: Colors.grey.shade200,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 210),
              Expanded(
                child: BusListView(storeDocs, (int index) {
                  setState(
                    () {
                      storeDocs = index;
                    },
                  );
                }, pageController, storeDocs),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: storeDocs.length,
                  effect: CustomizableEffect(
                    dotDecoration: DotDecoration(
                      width: 8,
                      height: 8,
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    activeDotDecoration: DotDecoration(
                        width: 10,
                        height: 10,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        dotBorder: DotBorder(
                            color: Colors.white, padding: 2, width: 2)),
                  ),
                  onDotClicked: (index) => pageController.jumpToPage(index),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
