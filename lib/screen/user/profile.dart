// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable, avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_field, unnecessary_null_comparison, prefer_final_fields

import 'dart:io';

import 'package:btbpp/screen/detail/story.dart';
import 'package:btbpp/screen/user/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    // ignore: await_only_futures
    User? user = await firebaseAuth.currentUser;

    print("Current User ===>>> $user");

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
    double screen = MediaQuery.of(context).size.width;
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
        print(storeDocs);
        return Scaffold(
          appBar: AppBar(
            title: Text('ບັນຊີຜູ້ໃຊ້ງານ'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 180,
                  width: 180,
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80.0,
                        child: _image == null
                            ? Image.asset('assets/images/Profile-Pic-Icon.png')
                            : Container(
                                width: 150,
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(75),
                                  child: Image.file(
                                    File(_image!.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        backgroundColor: Colors.grey.shade100,
                      ),
                      Positioned(
                        bottom: 25,
                        right: 35,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      content: _images(),
                                    ));
                          },
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.deepPurple,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.grey.shade200,
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.people,
                              color: Colors.deepPurple,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Text("ຜູ້ໃຊ້:"),
                                SizedBox(width: 10),
                                Text(storeDocs1[0]['name']),
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
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.grey.shade200,
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.deepPurple,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("ອີເມວ:"),
                            SizedBox(width: 10),
                            Text(storeDocs1[0]['email']),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.grey.shade200,
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.deepPurple,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Text("ເບີໂທ:"),
                                SizedBox(width: 10),
                                Text(storeDocs1[0]['phone']),
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
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.grey.shade200,
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
                              color: Colors.deepPurple,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Text("ປະຫວັດການຈອງ"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.deepPurple),
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
                                    child: Text('Yes')),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); //close Dialog
                                  },
                                  child: Text('Close'),
                                )
                              ],
                            );
                          });
                    }),
                    child: Text(
                      'ອອກຈາກລະບົບ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _images() {
    return SingleChildScrollView(
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            Text(
              'ເລືອກຮູບໂປຮໄຟລ໌',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ignore: deprecated_member_use
                FlatButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: () {
                    getimage();
                  },
                  label: Text('ກ້ອງຖ່າຍຮູບ'),
                ),
                // ignore: deprecated_member_use
                FlatButton.icon(
                  icon: Icon(Icons.photo_album),
                  onPressed: () {
                    getimage1();
                  },
                  label: Text('ເປີດຄັງຮູບ'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future getimage() async {
    final XFile? pickedFile = await picker!.pickImage(
      source: ImageSource.camera,
      maxWidth: 2000,
      maxHeight: 2000,
    );
    setState(() {
      _image = pickedFile!;
    });
    profileUser();
  }

  Future getimage1() async {
    final XFile? pickedFile = await picker!.pickImage(
      source: ImageSource.gallery,
      maxWidth: 2000,
      maxHeight: 2000,
    );
    setState(() {
      _image = pickedFile!;
    });
    profileUser();
  }
}
