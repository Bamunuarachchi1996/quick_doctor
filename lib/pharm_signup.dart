import 'package:flutter/material.dart';
import 'package:quick_doctor/admin_home.dart';
import 'package:quick_doctor/loginpage.dart';
import 'package:quick_doctor/models/userModel.dart';

import 'package:quick_doctor/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quick_doctor/utils/utils.dart';

class PharmSignup extends StatelessWidget {
  final UserModel _user = UserModel();
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pharmacy Registration',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          //padding: EdgeInsets.only(left: 10.0, right: 10.0),
          children: [
            SizedBox(
              height: 15.0,
            ),
            Container(
              //height: height - 170,
              //color: Colors.red,
              padding: EdgeInsets.only(top: 35.0, right: 20.0, left: 20),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) => {_user.name = value, _user.userName = value.trim().toLowerCase()},
                    decoration: InputDecoration(
                        labelText: 'NAME',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    onChanged: (value) => _user.pharmReg = value,
                    decoration: InputDecoration(
                        labelText: 'Reg No',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    onChanged: (value) => _user.telnum = value,
                    decoration: InputDecoration(
                        labelText: 'TEL No',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    onChanged: (value) => _user.address = value,
                    decoration: InputDecoration(
                        labelText: 'ADDRESS',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    onChanged: (value) => _user.email = value,
                    decoration: InputDecoration(
                        labelText: 'E-MAIL',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) => _password = value,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 40,
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
                          _user.userType = "Hospital";
                          bool res = await Auth().register(_user, _password);
                          print(res);
                          if (res) {
                            Fluttertoast.showToast(
                              msg: _user.name + " Registered Successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              textColor: Colors.black,
                              fontSize: 16,
                              backgroundColor: Colors.grey[200],
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          } else {
                            Dialogs.errorDialog(context, "Error", "Something went wrong !");
                          }
                        },
                        child: Center(
                          child: Text(
                            'REGISTER',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.5,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(60.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10.0,
                            ),
                            Center(
                              child: Text(
                                ' Go Back',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
