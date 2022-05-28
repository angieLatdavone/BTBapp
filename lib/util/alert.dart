// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void showDialogbox(context, String title) {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Column(
        children: [
          Icon(Icons.error, color: Colors.red, size: 50),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'ຕົກລົງ',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        )
      ],
    ),
  );
}

void myAlert(String title, String message, BuildContext context) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: ListTile(
            leading: Icon(
              Icons.add_alert,
              color: Colors.red,
            ),
            title: Text(
              title,
              style: TextStyle(color: Colors.red),
            ),
          ),
          content: Text(message),
          actions: [
            // ignore: deprecated_member_use
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}
