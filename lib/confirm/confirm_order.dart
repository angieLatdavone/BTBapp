// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, avoid_print, prefer_adjacent_string_concatenation, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConfirmOrder extends StatefulWidget {
  final data;
  const ConfirmOrder({Key? key, required this.data}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  final Stream<QuerySnapshot> model_Stream =
      FirebaseFirestore.instance.collection("reserve").snapshots();
  CollectionReference model_destination =
      FirebaseFirestore.instance.collection('reserve');
  @override
  Widget build(BuildContext context) {
    // print(widget.data);
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
        List data1 = [];

        snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          storeDocs.add(data);
          data['id'] = document.id;

          data1 = storeDocs
              .where((element) => element['id'] == widget.data)
              .toList();
        }).toList();
        print("------");

        print('data========>' + '${data1}');
        //print('anfjfjf==>'+'${storeDocs.where((element) => element.id == widget.data.toString())}');
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
                  Navigator.of(context).pop();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                data1[0]['status'].toString() == 'null'
                    ? Column(
                        children: [
                          Center(
                            child: CircularProgressIndicator(
                              color: Colors.lightBlue,
                              strokeWidth: 10.0,
                            ),
                          ),
                          Center(
                            child: Text(
                              "ລູກຄ້າກົດຢືນຢັນການຈອງແລ້ວ \nກະລຸນາໄປຊຳລະເງິນກ່ອນຮອດເວລາລົດອອກ \nເພື່ອໃຫ້ແອດມິນກົດຢືນຢັນການຈອງ",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800),
                            ),
                          ),
                        ],
                      )
                    : data1[0]['status'].toString() == 'true'
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Icon(Icons.check,
                                    size: 100.0, color: Colors.green),
                              ),
                              Text('ຊຳລະເງິນສຳເລັດແລ້ວ'),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.close, size: 100.0, color: Colors.red),
                              Text('ຍັງບໍ່ໄດ້ຮັບການຊຳລະເງິນ'),
                            ],
                          ),
              ],
            ),
          ),
        );
      },
    );
  }
}
