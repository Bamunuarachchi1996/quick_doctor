import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quick_doctor/loginpage.dart';
import 'package:quick_doctor/models/userModel.dart';

import 'package:quick_doctor/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_doctor/utils/utils.dart';

class PatientSignup extends StatefulWidget {
  @override
  _PatientSignupState createState() => _PatientSignupState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

void getUser() async {
  final User user = auth.currentUser;
  final uid = user.uid;
}

class _PatientSignupState extends State<PatientSignup> {
  String _currentType;
  List _types = ["Patient", "Doctor", "Hospital"];
  final UserModel _user = UserModel();
  String _password = "";

  List<DropdownMenuItem<String>> _dropDownMenuItems;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentType = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String role in _types) {
      items.add(new DropdownMenuItem(value: role, child: new Text(role)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          //padding: EdgeInsets.only(left: 10.0, right: 10.0),
          children: [
            Container(
              alignment: Alignment.centerLeft,
              //color: Colors.yellow,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                    child: Text(
                      'Signup here',
                      style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(290.0, 50.0, 0.0, 0.0),
                    child: Text(
                      '.',
                      style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(
            //   height: 15.0,
            // ),
            Expanded(
              //height: height - 170,
              //color: Colors.red,
              //padding: EdgeInsets.only(top: 35.0, right: 20.0, left: 20),
              child: ListView(
                children: [
                  TextField(
                    onChanged: (value) {
                      _user.name = value;
                      _user.userName = value.trim().toLowerCase();
                    },
                    decoration: InputDecoration(
                        labelText: 'NAME',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 10.0),
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
                    onChanged: (value) => _user.birthday = value,
                    decoration: InputDecoration(
                        labelText: 'BIRTHDAY',
                        hintText: 'dd/mm/yy',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text("GENDER"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: Gender.Male,
                        groupValue: _user.gender,
                        onChanged: (value) => setState(() {
                          _user.gender = value;
                        }),
                      ),
                      Text(
                        'Male',
                      ),
                      Radio(
                        value: Gender.Femail,
                        groupValue: _user.gender,
                        onChanged: (value) => setState(() {
                          _user.gender = value;
                        }),
                      ),
                      Text('Female'),
                    ],
                  ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  TextField(
                    onChanged: (value) => _user.nic = value,
                    decoration: InputDecoration(
                        labelText: 'NIC',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                  ),
                  TextField(
                    onChanged: (value) => _user.email = value,
                    decoration: InputDecoration(
                        labelText: 'E-MAIL',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                  ),
                  TextField(
                    onChanged: (value) => _password = value,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                  ),
                  // SizedBox(
                  //   height: 20.0,
                  // ),
                  // Text(
                  //   "Sign in as a",
                  //   textAlign: TextAlign.left,
                  //   style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  // ),
                  // Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     height: 40,
                  //     margin: EdgeInsets.only(top: 10, bottom: 20),
                  //     padding: EdgeInsets.only(left: 16, right: 16),
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.all(Radius.circular(10)),
                  //         color: Colors.white,
                  //         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                  //     child: new DropdownButton(
                  //       value: _currentType,
                  //       items: _dropDownMenuItems,
                  //       onChanged: changedDropDownItem,
                  //     )),
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
                          _user.userType = "Patient";
                          if (checkNull()) {
                            bool res = await Auth().register(_user, _password).whenComplete(
                                  () => Fluttertoast.showToast(
                                    msg: _user.name + " Registered Successfully",
                                    toastLength: Toast.LENGTH_SHORT,
                                    textColor: Colors.black,
                                    fontSize: 16,
                                    backgroundColor: Colors.grey[200],
                                  ),
                                );
                            print(res);
                            Navigator.pop(context);
                          } else {
                            Dialogs.errorDialog(context, 'ERROR', "Fill all the fields");
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
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

  void changedDropDownItem(String selectedRole) {
    setState(() {
      _user.userType = selectedRole;
      _currentType = selectedRole;
    });
    print(selectedRole);
  }

  bool checkNull() {
    if (_user.name == '' ||
        _user.telnum == '' ||
        _user.address == '' ||
        _user.birthday == '' ||
        _user.gender == '' ||
        _user.nic == '' ||
        _user.email == '' ||
        _password == '' ||
        _user.userType == '') {
      return false;
    } else {
      return true;
    }
  }
}
