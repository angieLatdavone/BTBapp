// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable, avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_field, unnecessary_null_comparison, prefer_final_fields, recursive_getters, avoid_returning_null_for_void, unused_element, prefer_typing_uninitialized_variables, avoid_function_literals_in_foreach_calls

import 'dart:io';

import 'package:btbpp/confirm/confirm_order.dart';
import 'package:btbpp/screen/detail/btbbooking.dart';
import 'package:btbpp/screen/detail/call_center.dart';
import 'package:btbpp/screen/detail/story.dart';
import 'package:btbpp/screen/detail/user.dart';
import 'package:btbpp/screen/user/login.dart';
import 'package:btbpp/util/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Profile extends StatefulWidget {
  get id => null;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // final Storage storage2 = Storage();
  int _selectedIndex = 2;
  XFile? _image;
  List<XFile>? _image1;
  ImagePicker? picker = ImagePicker();

  String imglink = '';

  get color => null;
  User? user = FirebaseAuth.instance.currentUser;

  final Stream<QuerySnapshot> model_Stream =
      FirebaseFirestore.instance.collection("user").snapshots();
  CollectionReference model_destination =
      FirebaseFirestore.instance.collection('user');

  late final data;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    // ignore: await_only_futures
    User? user = await firebaseAuth.currentUser;

    print("Current User ===>>> $user");

    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  late final List Userdateil = [];
  firebase_storage.UploadTask? uploadTask;
  late String urlImag;

  Future profileUser() async {
    final path = 'images/555-${_image!.name}';
    final file = File(_image!.path);

    final ref = firebase_storage.FirebaseStorage.instance.ref().child(path);

    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlImage = await snapshot.ref.getDownloadURL();
    setState(() {
      urlImag = urlImage;
    });

    print('Link: ' + urlImage);
  }

  final firebase_storage.FirebaseStorage storage2 =
      firebase_storage.FirebaseStorage.instance;
  String images = '';

  Future<void> Uploadimage(
    String filepath,
    String filename,
  ) async {
    File file = File(filepath);
    try {
      await storage2.ref('images/$filename').putFile(file);
      downloadURL(filename);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results =
        await storage2.ref('images').listAll();

    results.items.forEach((firebase_storage.Reference ref) {
      print('Found file: $ref');
    });
    return results;
  }

  CollectionReference reserve = FirebaseFirestore.instance.collection('user');
  Future<String> downloadURL(String imageName) async {
    String downloadURL =
        await storage2.ref('images/$imageName').getDownloadURL();
    print('=========================== ' + downloadURL);
    setState(() {
      imglink = downloadURL;
      _updatedBooking();
    });
    return downloadURL;
  }

  Future<void> _updatedBooking() {
    showDialog(context: context, builder: (_) => dialog());
    return reserve
        .doc(user!.uid)
        .update({'images': imglink})
        .then((value) {
          showDialogbox(context, 'ເພີ່ມຂໍ້ມູນສຳເລັດແລ້ວ.');
          Navigator.pop(context);
          Navigator.pop(context);
        })
        .catchError((error) {})
        .catchError((error) {
          showDialogbox(context, 'error: $error');
        });
  }

  Widget dialog() => CupertinoAlertDialog(
        title: Center(child: CircularProgressIndicator()),
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text('ກະລຸນາລໍຖ້າ'),
          ),
        ),
      );

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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        // model_Stream[0] == null ?
                        Container(
                          width: 180,
                          height: 180,
                          child:
                              Image.asset('assets/images/Profile-Pic-Icon.png'),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 20,
                          child: InkWell(
                            onTap: () async {
                              final results =
                                  await FilePicker.platform.pickFiles(
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

                              Uploadimage(path!, fileName);
                            },
                            child: Icon(
                              Icons.add_a_photo,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
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
                                        data: data['id'][widget].toString(),
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
