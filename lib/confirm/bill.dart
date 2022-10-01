// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_print

import 'package:btbpp/confirm/confirm_order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  User? user = FirebaseAuth.instance.currentUser;

  final Stream<QuerySnapshot> model_Stream =
      FirebaseFirestore.instance.collection("reserve").snapshots();
  CollectionReference model_destination =
      FirebaseFirestore.instance.collection('reserve');
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
              child: storeDocs1.length.toString() != '0'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        storeDocs1.length,
                        (index) => GestureDetector(
                          onTap: () {
                            print(index);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConfirmOrder(
                                        data: storeDocs1[index]['id'])));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 120,
                            width: width * 0.95,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 100,
                                  height: 100,
                                  child:
                                      Image.asset('assets/images/Icon_app.png'),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'ຖ້ຽວລົດ: ',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              storeDocs1[index]['destination']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'ອີເມວ: ',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              storeDocs1[index]['email']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'ທະບຽນລົດ: ',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              storeDocs1[index]['numberplate']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              storeDocs1[index]['price']
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'ວັນທີຈອງ',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              storeDocs1[index]['datetime']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
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
                    )
                  : Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 200),
                        child: Text(
                          'Not found!!!!😐',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
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
