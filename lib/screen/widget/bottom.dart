// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, unused_element, unnecessary_this

import 'package:btbpp/screen/homescreen.dart';
import 'package:btbpp/screen/user/profile.dart';
import 'package:btbpp/screen/widget/promotion.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selcetdindex = 0;
  final tabs = [
    Promotion(),
    HomePage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selcetdindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            this._selcetdindex = index;
          });
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ໜ້າຫຼັກ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ການຈອງ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ໂປຣໄຟລ',
          ),
        ],
        currentIndex: _selcetdindex,
        fixedColor: Colors.lightBlue,
      ),
    );
  }
}
