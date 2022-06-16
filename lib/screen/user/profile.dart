// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable, avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_field, unnecessary_null_comparison, prefer_final_fields, recursive_getters, avoid_returning_null_for_void, unused_element

import 'dart:io';

import 'package:btbpp/confirm/confirm_order.dart';
import 'package:btbpp/screen/detail/btbbooking.dart';
import 'package:btbpp/screen/detail/call_center.dart';
import 'package:btbpp/screen/detail/story.dart';
import 'package:btbpp/screen/detail/user.dart';
import 'package:btbpp/screen/user/login.dart';
import 'package:btbpp/services/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Storage storage = Storage();
  int _selectedIndex = 2;
  XFile? _image;
  List<XFile>? _image1;
  ImagePicker? picker = ImagePicker();

  get color => null;
  User? user = FirebaseAuth.instance.currentUser;

  final Stream<QuerySnapshot> model_Stream =
      FirebaseFirestore.instance.collection("user").snapshots();
  CollectionReference model_destination =
      FirebaseFirestore.instance.collection('user');

  get data => data;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();

    // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    // // ignore: await_only_futures
    // User? user = await firebaseAuth.currentUser;

    // print("Current User ===>>> $user");

    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  late final List Userdateil = [];
  UploadTask? uploadTask;
  late String urlImag;

  Future profileUser() async {
    final path = 'images/555-${_image!.name}';
    final file = File(_image!.path);

    final ref = FirebaseStorage.instance.ref().child(path);

    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlImage = await snapshot.ref.getDownloadURL();
    setState(() {
      urlImag = urlImage;
    });

    print('Link: ' + urlImage);
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
        //print(storeDocs);
        return Scaffold(
          // appBar: AppBar(
          //   title: Text('ບັນຊີຜູ້ໃຊ້ງານ'),
          //   centerTitle: true,
          // ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      final results = await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'png'],
                      );
                      if (results == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No file selected'),
                          ),
                        );
                        return null;
                      }
                      final path = results.files.single.path;
                      final fileName = results.files.single.name;

                      print(path);
                      print(fileName);

                      await storage.Uploadimage(path!, fileName)
                          .then((value) => print('done'));
                      // FutureBuilder(
                      //   future: storage.downloadURL(fileName),
                      //   builder: (BuildContext context,
                      //       AsyncSnapshot<String> snapshot) {
                      //     if (snapshot.connectionState ==
                      //             ConnectionState.done &&
                      //         snapshot.hasData) {
                      //       return Image.network(
                      //         snapshot.data!,
                      //         fit: BoxFit.cover,
                      //       );
                      //     }
                      //     if (snapshot.connectionState ==
                      //             ConnectionState.waiting ||
                      //         !snapshot.hasData) {
                      //       return CircularProgressIndicator();
                      //     }
                      //     return Container();
                      //   },
                      // );
                    },
                    child: Image.asset(
                      'assets/images/Profile-Pic-Icon.png',
                      width: 180,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: storage.downloadURL('Profile-Pic-Icon.png'),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Container(
                        child: Image.network(
                          snapshot.data!,
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        !snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return Container();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        padding: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfile()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.people,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "ບັນຊີຜູ້ໃຊ້",
                                  style: TextStyle(
                                      fontFamily: 'Phetsarath OT',
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        padding: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConfirmOrder(
                                        data: data,
                                      )));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.receipt,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "ຢືນຢັນການຈອງ",
                                  style: TextStyle(
                                      fontFamily: 'Times New Roman',
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        padding: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.white,
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "ຄູ່ມືການໃຊ້ງານ",
                              style: TextStyle(
                                  fontFamily: 'Phetsarath OT', fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        padding: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Story(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "ປະຫວັດການຈອງ",
                                  style: TextStyle(
                                      fontFamily: 'Phetsarath OT',
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        padding: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CallCenter()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.help,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "ຊ່ວຍເຫຼືອ ແລະ ໃຫ້ບໍລິການ",
                                  style: TextStyle(
                                      fontFamily: 'Phetsarath OT',
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        padding: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Booking()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.note,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "ກ່ຽວກັບ BTB Booking",
                                  style: TextStyle(
                                      fontFamily: 'Times New Roman',
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade200),
                  child: GestureDetector(
                    onTap: (() {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('ຄຳຢືນຢັນ'),
                            content: Text('ທ່ານຕ້ອງການອອກຈາກລະບົບແທ້ບໍ?'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    _signOut();
                                    //action code for "Yes" button
                                  },
                                  child: Text('ຕົກລົງ')),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); //close Dialog
                                },
                                child: Text('ຍົກເລີກ'),
                              )
                            ],
                          );
                        },
                      );
                    }),
                    child: Text(
                      'ອອກຈາກລະບົບ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Version: 1.0.0',
                    style: TextStyle(fontFamily: 'Times New Roman'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Widget _images() {
  //   return SingleChildScrollView(
  //     child: Container(
  //       height: 150,
  //       width: MediaQuery.of(context).size.width,
  //       margin: EdgeInsets.symmetric(
  //         horizontal: 20,
  //         vertical: 20,
  //       ),
  //       child: Column(
  //         children: <Widget>[
  //           Text(
  //             'ເລືອກຮູບໂປຮໄຟລ໌',
  //             style: TextStyle(fontSize: 20),
  //           ),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               // ignore: deprecated_member_use
  //               FlatButton.icon(
  //                 icon: Icon(Icons.camera),
  //                 onPressed: () {
  //                   getimage();
  //                 },
  //                 label: Text('ກ້ອງຖ່າຍຮູບ'),
  //               ),
  //               // ignore: deprecated_member_use
  //               FlatButton.icon(
  //                 icon: Icon(Icons.photo_album),
  //                 onPressed: () {
  //                   getimage1();
  //                 },
  //                 label: Text('ເປີດຄັງຮູບ'),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Future getimage() async {
  //   final XFile? pickedFile = await picker!.pickImage(
  //     source: ImageSource.camera,
  //     maxWidth: 2000,
  //     maxHeight: 2000,
  //   );
  //   setState(() {
  //     _image = pickedFile!;
  //   });
  //   profileUser();
  // }

  // Future getimage1() async {
  //   final XFile? pickedFile = await picker!.pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 2000,
  //     maxHeight: 2000,
  //   );
  //   setState(() {
  //     _image = pickedFile!;
  //   });
  //   profileUser();
  // }
}
