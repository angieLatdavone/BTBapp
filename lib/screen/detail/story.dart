// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors, unused_local_variable, avoid_print, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  User? user = FirebaseAuth.instance.currentUser;

  final Stream<QuerySnapshot> model_Stream =
      FirebaseFirestore.instance.collection("reserve").snapshots();
  CollectionReference model_destination =
      FirebaseFirestore.instance.collection('reserve');
  @override
  Widget build(BuildContext context) {
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
        List storeDocs1 = [];
        snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          storeDocs.add(data);
          data['id'] = document.id;

          storeDocs1 = storeDocs
              .where((element) => element['email'] == user!.email)
              .toList();
        }).toList();
        print("------");
        print(storeDocs);
        return Scaffold(
          appBar: AppBar(
            title: Text('ປະຫັວດການຈອງ'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  storeDocs1.length,
                  (index) => GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: 400,
                      height: 200,
                      color: Colors.grey.shade200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  'ຖ້ຽວລົດ: ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  storeDocs1[index]['destination'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  'ອີເມວ: ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  storeDocs1[index]['email'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              storeDocs1[index]['price'].toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  'ທະບຽນລົດ: ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  storeDocs1[index]['numberplate'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              storeDocs1[index]['time_trip'].toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  'ວັນທີຈອງ: ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                              Container(
                                child: Text(
                                  storeDocs1[index]['datetime'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
