// ignore_for_file: unused_local_variable, prefer_const_constructors, sized_box_for_whitespace, unused_field, avoid_print, prefer_const_literals_to_create_immutables, deprecated_member_use
import 'package:btbpp/screen/widget/tap.dart';
import 'package:btbpp/util/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isShowpassword = true;

  XFile? _image;
  List<XFile>? _image1;
  ImagePicker? picker = ImagePicker();

  _handleEye() {
    setState(() {
      _isShowpassword = !_isShowpassword;
    });
  }

  final globalKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwd2Controller = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pickController = TextEditingController();

  void handleLogin() async {
    if (globalKey.currentState!.validate()) {
      var data = {
        'name': firstnameController.text,
        'email': emailController.text,
        'numberphone': phoneController.text,
        'password': pwdController.text,
        'images' : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'
      };


    }
  }

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  Future<void> registermethod() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: pwdController.text)
        .then((value) async {

      var uid = value.user?.uid;

      await FirebaseFirestore.instance.collection('user').doc(uid).set({
        'name': firstnameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'password': pwdController.text,
        'images':'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'
      }).then((value) {
        print("=====>>>>> 1");

        showAboutDialog(context: context);

      });
      print("=====>>>>> 2");

      showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          title: Column(
            children: [
              Icon(Icons.check, color: Colors.green, size: 50),
              SizedBox(height: 10),
              Text(
                'ລົງທະບຽນສຳເລັດແລ້ວ',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomBar()));
              },
              child: Text(
                'ຕົກລົງ',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            )
          ],
        ),
      );

    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title = $title,message = $message');
      myAlert(
        title,
        message,
        context,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('error'),
            ),
            body: Center(
              child: Text('${snapshot.error}'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          double screen = MediaQuery.of(context).size.width;
          return Scaffold(
            appBar: AppBar(
              title: Text('ສ້າງບັນຊີຜູ້ໃຊ້'),
              backgroundColor: Colors.lightBlue,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: globalKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 25),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        controller: firstnameController,
                        validator: (value) => value!.isEmpty
                            ? 'ກະລຸນາປ້ອນຊື່ຜູ້ໃຊ້ຂອງທ່ານ'
                            : null,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          suffixIcon: Icon(
                            Icons.face,
                            color: Colors.lightBlue,
                          ),
                          hintText: 'ຊື່ຜູ້ໃຊ້',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) =>
                            value!.isEmpty ? 'ກະລຸນາປ້ອນອີເມວຂອງທ່ານ' : null,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          suffixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.lightBlue,
                          ),
                          hintText: 'ອີເມວ',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        validator: (value) => value!.isEmpty
                            ? 'ກະລຸນາປ້ອນເບີໂທລະສັບຂອງທ່ານ'
                            : null,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          suffixIcon: Icon(
                            Icons.phone_android,
                            color: Colors.lightBlue,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 12.5),
                            child: Text(
                              '+856 20 ',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.grey),
                            ),
                          ),
                          hintText: 'ເບີໂທ',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: pwdController,
                        validator: (value) => value!.length >= 6
                            ? null
                            : 'ກະລຸນາປ້ອນລະຫັດຜ່ານຂອງທ່ານ',
                        obscureText: _isShowpassword,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _handleEye();
                            },
                            icon: Icon(
                              _isShowpassword == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _isShowpassword == false
                                  ? Colors.grey
                                  : Colors.lightBlue,
                            ),
                          ),
                          hintText: 'ລະຫັດຜ່ານ',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: pwd2Controller,
                        validator: (value) => value!.length >= 6
                            ? null
                            : 'ກະລຸນາປ້ອນຢືນຢັນລະຫັດຜ່ານຂອງທ່ານ',
                        obscureText: _isShowpassword,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _handleEye();
                            },
                            icon: Icon(
                              _isShowpassword == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _isShowpassword == false
                                  ? Colors.grey
                                  : Colors.lightBlue,
                            ),
                          ),
                          hintText: 'ຢືນຢັນລະຫັດຜ່ານ',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      width: double.infinity,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.lightBlue),
                          onPressed: () {
                            if (pwdController.text == pwd2Controller.text) {
                              registermethod();
                            } else {
                              showDialogbox(context, 'ກະລຸນາກວດສອບລະຫັດຜ່ານ');
                            }
                          },
                          child: Text(
                            'ລົງທະບຽນ',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
