// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, unused_element, prefer_final_fields

import 'package:btbpp/models/busdata.dart';
import 'package:btbpp/util/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowDetail extends StatefulWidget {
  late final List<Ticket> ticket;
  late final int index;
  ShowDetail(this.ticket, this.index);

  @override
  State<ShowDetail> createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {
  User? user = FirebaseAuth.instance.currentUser;
  var outputFormat = DateFormat('dd/MM/yyyy');
  DateTime _date = DateTime.now();

  _confirmBooking() async {
    try {
      await FirebaseFirestore.instance.collection('reserve').doc().set({
        'destination': widget.ticket[widget.index].name,
        'time_trip':
            widget.ticket[widget.index].currenSelectedValueTime[widget.index],
        'numberplate':
            widget.ticket[widget.index].currenValueSelectedCar[widget.index],
        'price': widget.ticket[widget.index].price.toStringAsFixed(3),
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
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
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
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 150,
              child: Image.asset(
                widget.ticket[widget.index].imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.ticket[widget.index].name,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ລົດອອກເວລາ:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'ໂມງ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.ticket[widget.index]
                      .currenSelectedValueTime[widget.index],
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ປ້າຍລົດ:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.ticket[widget.index]
                      .currenValueSelectedCar[widget.index],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ລາຄາ:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.ticket[widget.index].price.toStringAsFixed(3) + ' ກີບ',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ວັນທີ/ເດືອນ/ປີ:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  DateTime.now().day.toString() + '/',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  DateTime.now().month.toString() + '/',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  DateTime.now().year.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                  onPressed: () {
                    _confirmBooking();
                  },
                  child: Text(
                    'ຢືນຢັນການສັ່ງຈອງ ',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
