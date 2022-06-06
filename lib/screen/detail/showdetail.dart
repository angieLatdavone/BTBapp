// ignore_for_file: prefer_typing_uninitialized_variables, prefer_final_fields, non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:btbpp/util/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swag_package_ag/widget/resize_button.dart';

class Showdatil extends StatefulWidget {
  final destination;
  final valuetime;
  final numberplate;
  final price;
  const Showdatil(
      {Key? key,
      this.destination,
      this.valuetime,
      this.numberplate,
      this.price})
      : super(key: key);
  @override
  State<Showdatil> createState() => _ShowdatilState();
}

class _ShowdatilState extends State<Showdatil> {
  User? user = FirebaseAuth.instance.currentUser;
  var outputFormat = DateFormat('dd/MM/yyyy');
  DateTime _date = DateTime.now();
  get color => null;
  bool status = false;

  final Stream<QuerySnapshot> model_Stream =
      FirebaseFirestore.instance.collection("user").snapshots();
  CollectionReference model_destination =
      FirebaseFirestore.instance.collection('user');

  _confirmBooking() async {
    try {
      await FirebaseFirestore.instance.collection('reserve').doc().set({
        'destination': widget.destination,
        'time_trip': widget.valuetime,
        'numberplate': widget.numberplate,
        'price': widget.price,
        'datetime': outputFormat.format(_date),
        'status': 'ຈອງ',
        'email': user!.email,
      }).then((value) {
        showDialogbox(context, 'ເພີ່ມຂໍ້ມູນສຳເລັດແລ້ວ');
      });
    } catch (e) {
      showDialogbox(context, 'ເພີ່ມຂໍ້ມູນບໍ່ສຳເລັດ');
    }
  }

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
        List storeDocs1 = [];
        snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          storeDocs.add(data);
          data['id'] = document.id;

          storeDocs1 =
              storeDocs.where((element) => element['id'] == user!.uid).toList();
        }).toList();
        print("------");
        print(storeDocs);
        return Scaffold(
          backgroundColor: Colors.deepPurple.shade200,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Container(
              margin: EdgeInsets.only(left: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.3),
              ),
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(5),
                width: 180,
                height: 180,
                child: Image.asset('assets/images/buslogo.png'),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ຊື່ລູກຄ້າ: ',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Text(
                    storeDocs1[0]['name'],
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  widget.destination,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  widget.valuetime,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'ທະບຽນລົດ: ',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.numberplate,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 216, 93, 93),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  widget.price,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 216, 93, 93),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              status == false
                  ? Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ResizeButton(
                          function: () {
                            _confirmBooking();
                            setState(() {
                              status = true;
                            });
                          },
                          buttonName: 'ຢືນຢັນການຈອງ',
                          icon: Icon(Icons.autorenew),
                          startColor: Colors.deepPurple,
                          endColor: Colors.deepPurple,
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ResizeButton(
                          function: () {},
                          buttonName: 'ຢືນຢັນການຈອງສຳເລັັດແລ້ວ',
                          icon: Icon(Icons.autorenew),
                          startColor: Colors.deepPurple,
                          endColor: Colors.deepPurple,
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
