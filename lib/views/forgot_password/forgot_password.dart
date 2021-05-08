import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quick_doctor/utils/utils.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _email = "";
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 170.0, 0.0, 0.0),
                  child: Text(
                    'Quick',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(150.0, 170.0, 0.0, 0.0),
                  child: Text(
                    'Doctor',
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter you email to recive password reset instructions',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10.0,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, right: 20.0, left: 20),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) => _email = value,
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(60.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: MaterialButton(
                      onPressed: () async {
                        if (_email != "") {
                          auth
                              .sendPasswordResetEmail(email: _email)
                              .whenComplete(
                                () => Fluttertoast.showToast(
                                  msg: " Reset Email Sent !",
                                  toastLength: Toast.LENGTH_SHORT,
                                  textColor: Colors.black,
                                  fontSize: 16,
                                  backgroundColor: Colors.grey[200],
                                ),
                              )
                              .whenComplete(() => Navigator.pop(context));
                        } else {
                          Dialogs.errorDialog(
                              context, 'ERROR', "Fill the email field");
                        }

                        //Navigator.of(context).pushNamed('/adminhome');
                      },
                      child: Center(
                        child: Text(
                          'Send Reset Email',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          
        ],
      ),
    );
  }
}
