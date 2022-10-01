// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, non_constant_identifier_names, prefer_final_fields, unused_field, unused_element

import 'package:btbpp/screen/widget/bus_item.dart';
import 'package:btbpp/screen/detail/image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final Stream<QuerySnapshot> model_Stream =
      FirebaseFirestore.instance.collection("model_destination").snapshots();
  CollectionReference model_destination =
      FirebaseFirestore.instance.collection('model_destination');
  final pageController = PageController();
  var outputFormat = DateFormat('dd/MM/yyyy');
  DateTime _date = DateTime.now();

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
          return Scaffold(
            body: Center(
              child: Text("Loading"),
            ),
          );
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
          //extendBodyBehindAppBar: true,
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
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text('Bus Ticket Booking',
                                style: TextStyle(fontSize: 14)),
                            SizedBox(height: 5),
                            Text('application and bus ticket booking',
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              preferredSize: Size.fromHeight(30),
            ),
          ),
          backgroundColor: Colors.grey.shade200,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: List.generate(
                    storeDocs.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TicketItem(storeDocs[index]),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: 110,
                        width: width * 0.95,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            image(),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: 20,
                                  left: 10,
                                  right: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          storeDocs[index]['name'].toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              height: 1),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          storeDocs[index]['price'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Times New Roman'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          outputFormat.format(_date),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
