// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors

import 'package:btbpp/models/bushome.dart';
import 'package:flutter/material.dart';

class BusList extends StatelessWidget {
  final int selected;
  final Function callback;
  final Bus bus;
  BusList(this.selected, this.callback, this.bus);

  // ໂຄ໊ດຂອງພາກສ່ວນໝວດໝູ່ ນະຄອນຫຼວງ ກັບ ຕ່າງແຂວງ

  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    final category = bus.menu.keys.toList();
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 20,bottom: 15),
      child: ListView.separated(
        
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => callback(index),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.43,
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: selected == index ? Colors.deepPurple : Colors.white,
                  ),
                  child: Text(
                    category[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          separatorBuilder: (_, index) => SizedBox(width: 10),
          itemCount: category.length),
    );
  }
}
