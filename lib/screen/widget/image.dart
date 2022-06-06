// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Stack image() {
  return Stack(
    children: [
      Container(
        padding: EdgeInsets.all(5),
        width: 90,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/buslogo.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      // Positioned(
      //   top: 0,
      //   right: 0,
      //   child: Icon(Icons.favorite, color: Colors.pink, size: 25),
      // ),
    ],
  );
}
