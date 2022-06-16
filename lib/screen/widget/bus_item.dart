// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_string_interpolations, non_constant_identifier_names, unused_local_variable, avoid_print, prefer_typing_uninitialized_variables

import 'package:btbpp/screen/detail/showdetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TicketItem extends StatelessWidget {
  final ticket;
  TicketItem(this.ticket);

  final Stream<QuerySnapshot> model_Stream =
      FirebaseFirestore.instance.collection('model_destination').snapshots();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder<QuerySnapshot>(
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
          backgroundColor: Colors.grey.shade200,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: List.generate(
                    ticket.length,
                    (index) => GestureDetector(
                      onTap: () {
                        print('55555' + ticket['valuetime'][index].toString());
                        print('55555' + ticket['name'].toString());
                        print('55555' +
                            ticket['numberplate'][index].toString());
                        print('55555' + ticket['price'].toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Showdatil(
                                valuetime:
                                    ticket['valuetime'][index].toString(),
                                destination: ticket['name'].toString(),
                                numberplate:
                                    ticket['numberplate'][index].toString(),
                                price: ticket['price'].toString()),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: 110,
                        width: width * 0.95,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // border:
                          //     Border.all(color: Colors.lightBlue, width: 3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              width: 90,
                              height: 90,
                              child: Image.asset('assets/images/Icon_app.png'),
                            ),
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
                                          ticket['name'].toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
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
                                          ticket['price'].toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ticket['valuetime'][index].toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          ticket['numberplate'][index]
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
