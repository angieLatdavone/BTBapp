// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final globalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  Future<void> senpasswordlink(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.sendPasswordResetEmail(email: email).then((value) {
      print('ພວກເຮົາຈະສົ່ງລິ້ງປ່ຽນລະຫັດຜ່ານໄປທີ່ $email');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ຂໍ້ຄວາມແຈ້ງເຕືອນ'),
            content: Text('ພວກເຮົາຈະສົ່ງລິ້ງປ່ຽນລະຫັດຜ່ານໄປທີ່ $email'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('ປຶດ'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }).catchError(
      (err) {
        print('ເກີດຂໍ້ຜິດພາດໃນການສົ່ງລິ້ງໄປທີ່ $email and $err');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('ຂໍ້ຄວາມແຈ້ງເຕືອນ'),
              content: Text('ເກີດຂໍ້ຜິດພາດໃນການສົ່ງລິ້ງໄປທີ່ $email and $err'),
              actions: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  child: Text('ປິດ'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 150),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value) =>
                      value!.isEmpty ? 'ກະລຸນາປ້ອນອີເມວຂອງທ່ານ' : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue, width: 3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue, width: 3),
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
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
                    // onPressed: () async {
                    //   FirebaseAuth.instance
                    //       .sendPasswordResetEmail(email: emailController.text)
                    //       .then((value) => Navigator.of(context).pop());
                    // },
                    onPressed: () {
                      senpasswordlink(emailController.text);
                      // Navigator.of(context).pop();
                    },
                    child: Text(
                      'ສົ່ງອີເມວ',
                      style: TextStyle(fontSize: 20),
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
}
