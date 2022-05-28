// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers, avoid_print, prefer_const_literals_to_create_immutables, unused_import

import 'dart:convert';

import 'package:btbpp/screen/homescreen.dart';
import 'package:btbpp/screen/user/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../util/alert.dart';
import 'callapi.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isShowpassword = true;

  @override
  void initState() {
    super.initState();
    checkState();
  }

  _handleEye() {
    setState(() {
      _isShowpassword = !_isShowpassword;
    });
  }

  final globalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  // handleLogin() async {
  //   if (globalKey.currentState!.validate()) {
  //     print('null!!!!');
  //     var data = {
  //       'numberphone': phoneController.text,
  //       'password': pwdController.text
  //     };
  //     var res = await CallApi().postDatalogin(
  //       data,
  //       'login',
  //     );
  //     var body = json.decode(res.body);
  //     print(body);
  //     if (res.statusCode == 200) {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => HomePage()));
  //     } else {
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //           content: Container(
  //             alignment: Alignment.center,
  //             width: MediaQuery.of(context).size.width,
  //             height: 60,
  //             child: Text('ເບີໂທ ຫຼື ລະຫັດຜ່ານບໍ່ຖືກຕ້ອງ'),
  //           ),
  //         ),
  //       );
  //     }
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => HomePage()));
  //   }
  // }

  Future<void> signinWithEmailAndPassword() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(
      email: emailController.text,
      password: pwdController.text,
    )
        .then((value) async {
      setState(() {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (BuildContext context) => HomePage());
        Navigator.of(context).pushAndRemoveUntil(route, (route) => false);
      });
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title = $title,message = $message');
      myAlert(title, message, context);
    });
  }

  ///check status
  Future<void> checkState() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    // ignore: await_only_futures
    User? user = await firebaseAuth.currentUser;

    print("Current User ===>>> $user");

    if (user != null) {
      CircularProgressIndicator();
      MaterialPageRoute route =
          MaterialPageRoute(builder: (BuildContext context) => HomePage());
      Navigator.of(context).pushAndRemoveUntil(route, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 50, 100, 20),
                child: Container(
                  child: Image.asset('assets/images/buslogo.png'),
                ),
              ),
              SizedBox(
                child: Text(
                  'ເຂົ້າສູ່ລະບົບ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                          BorderSide(color: Colors.deepPurple, width: 3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.deepPurple,
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
                  controller: pwdController,
                  validator: (value) =>
                      value!.isEmpty ? 'ກະລຸນາປ້ອນລະຫັດຜ່ານຂອງທ່ານ' : null,
                  obscureText: _isShowpassword,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.deepPurple,
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
                            : Colors.deepPurple,
                      ),
                    ),
                    hintText: 'ລະຫັດຜ່ານ',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        'ລືມລະຫັດຜ່ານ?',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                    onPressed: () {
                      // handleLogin();
                      signinWithEmailAndPassword();
                    },
                    child: Text(
                      'ເຂົ້າສູ່ລະບົບ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ທ່ານມີບັນຊີແລ້ວຫຼືບໍ່?',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'ລົງທະບຽນ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
