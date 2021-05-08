import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quick_doctor/admin_home.dart';
import 'package:quick_doctor/docprofile.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/patient_signup.dart';
import 'package:quick_doctor/pharm_signup.dart';
import 'package:quick_doctor/pharmprofile.dart';
import 'package:quick_doctor/user_profile.dart';
import 'package:quick_doctor/utils/loading.dart';
import 'package:quick_doctor/utils/shared_pref.dart';
import 'package:quick_doctor/utils/utils.dart';
import 'package:quick_doctor/views/forgot_password/forgot_password.dart';
import 'package:quick_doctor/services/auth.dart';

import 'doctor_signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  String _email = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Loading()
          : ListView(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 170.0, 0.0, 0.0),
                        child: Text(
                          'Quick',
                          style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(150.0, 170.0, 0.0, 0.0),
                        child: Text(
                          'Doctor',
                          style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 35.0, right: 20.0, left: 20),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (value) => _email = value,
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        onChanged: (value) => _password = value,
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                        },
                        child: Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15.0, left: 20.0),
                          child: InkWell(
                              child: Text(
                            'forgot password',
                            style: TextStyle(
                                color: Colors.green, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                          )),
                        ),
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
                              if (checkNull()) {
                                setState(() {
                                  loading = true;
                                });
                                UserModel user = await Auth().signIn(_email, _password);
                                if (user == null) {
                                  setState(() {
                                    loading = false;
                                  });
                                  Dialogs.errorDialog(context, 'ERROR', "Invalid Username or Password");
                                  // Fluttertoast.showToast(
                                  //   msg: " Invalid Username or Password",
                                  //   toastLength: Toast.LENGTH_SHORT,
                                  //   textColor: Colors.black,
                                  //   fontSize: 16,
                                  //   backgroundColor: Colors.grey[200],
                                  // );
                                  // ExtendedNavigator.of(context)
                                  //     .push(Routes.InitialRoute);
                                  // return;
                                } else {
                                  SharedPref.instance.setStringValue("email", _email);
                                  SharedPref.instance.setStringValue("pass", _password);
                                  Get.put(user);
                                  print(user);
                                  switch (user.userType) {
                                    case 'Patient':
                                      {
                                        setState(() {
                                          loading = false;
                                        });

                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => UserProfile(user: user)));
                                      }

                                      break;
                                    case 'Doctor':
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) => DocProfile(user: user)));

                                      break;
                                    case 'Admin':
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) => AdminHome(user: user)));

                                      break;
                                    case 'Hospital':
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) => PharmProfile(user: user)));

                                      break;
                                    default:
                                  }
                                }
                              } else {
                                setState(() {
                                  loading = false;
                                });
                                Dialogs.errorDialog(context, 'ERROR', "Fill all the fields");
                              }

                              //Navigator.of(context).pushNamed('/adminhome');
                            },
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      MaterialButton(
                        onPressed: () async {
                          UserModel user = await Auth().googleSignIn();
                          Get.put(user);
                          print(user);
                          switch (user.userType) {
                            case 'Patient':
                              {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => UserProfile(user: user)));
                              }

                              break;
                            case 'Doctor':
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DocProfile(user: user)));

                              break;
                            case 'Admin':
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome(user: user)));

                              break;
                            case 'Hospital':
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => PharmProfile(user: user)));

                              break;
                            default:
                          }
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
                                Center(child: FaIcon(FontAwesomeIcons.google)),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Center(
                                  child: Text(
                                    ' Log In With Google',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New to Quick Doctor ?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                title: const Text('Register as a,'),
                                children: <Widget>[
                                  SimpleDialogOption(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PatientSignup()));
                                    },
                                    child: const Text('Patient',textAlign: TextAlign.center),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorSignup()));
                                    },
                                    child: const Text('Doctor',textAlign: TextAlign.center),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PharmSignup()));
                                    },
                                    child: const Text('Hospital',textAlign: TextAlign.center),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
    );
  }

  bool checkNull() {
    if (_email == '' || _password == '') {
      return false;
    } else {
      return true;
    }
  }
}
