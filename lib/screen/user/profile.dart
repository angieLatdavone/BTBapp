// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable, avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:btbpp/screen/user/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  get color => null;
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    // ignore: await_only_futures
    User? user = await firebaseAuth.currentUser;

    print("Current User ===>>> $user");

    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 180,
            width: 180,
            child: Stack(
              fit: StackFit.expand,
              // ignore: deprecated_member_use
              overflow: Overflow.visible,
              children: [
                Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {},
                      child: Image.asset("assets/images/Profile-Pic-Icon.png"),
                    ),
                  ),
                )
              ],
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // Column(
          //   children: [
          //     Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //       // ignore: deprecated_member_use
          //       child: FlatButton(
          //         padding: EdgeInsets.all(15),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(30),
          //         ),
          //         color: Colors.grey.shade200,
          //         onPressed: () {},
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.people,
          //               color: Colors.deepPurple,
          //             ),
          //             SizedBox(
          //               width: 10,
          //             ),
          //             Row(
          //               children: [
          //                 Expanded(
          //                   child: Text("Username:"),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //       // ignore: deprecated_member_use
          //       child: FlatButton(
          //         padding: EdgeInsets.all(15),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(30),
          //         ),
          //         color: Colors.grey.shade200,
          //         onPressed: () {},
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.email,
          //               color: Colors.deepPurple,
          //             ),
          //             SizedBox(
          //               width: 10,
          //             ),
          //             Expanded(
          //               child: Text("Email:"),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //       // ignore: deprecated_member_use
          //       child: FlatButton(
          //         padding: EdgeInsets.all(15),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(30),
          //         ),
          //         color: Colors.grey.shade200,
          //         onPressed: () {},
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.phone,
          //               color: Colors.deepPurple,
          //             ),
          //             SizedBox(
          //               width: 10,
          //             ),
          //             Expanded(
          //               child: Text("Phone:"),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: GestureDetector(
              onTap: (() {
                _signOut();
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ອອກຈາກລະບົບ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
