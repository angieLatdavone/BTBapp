// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors

import 'package:btbpp/models/bushome.dart';
import 'package:btbpp/screen/detail/detail.dart';
import 'package:btbpp/screen/widget/bus_item.dart';
import 'package:flutter/material.dart';

class BusListView extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  final Bus bus;
  BusListView(this.selected, this.callback, this.pageController, this.bus,);


  @override
  Widget build(BuildContext context) {
   final category = bus.menu.keys.toList();
    double screen = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: category
            .map(
              (e) => ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: (() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                bus.menu[category[selected]]!,index
                              )
                            ),
                          );
                        }
                        ),
                        child: TicketItem(bus.menu[category[selected]]![index]),
                      ),
                  separatorBuilder: (_, index) => SizedBox(height: 15),
                  itemCount: bus.menu[category[selected]]!.length),
            )
            .toList(),
      ),
    );
  }
}