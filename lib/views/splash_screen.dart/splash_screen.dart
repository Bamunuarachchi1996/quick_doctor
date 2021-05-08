
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quick_doctor/admin_home.dart';
import 'package:quick_doctor/docprofile.dart';
import 'package:quick_doctor/loginpage.dart';
import 'package:quick_doctor/main.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/pharmprofile.dart';
import 'package:quick_doctor/services/auth.dart';
import 'package:quick_doctor/user_profile.dart';
import 'package:quick_doctor/utils/shared_pref.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initAuth();
  }

  initAuth() {
    SharedPref.instance.containsKey("email").then((value) {
      if (value) {
        SharedPref.instance.getStringValue("email").then((email) {
          SharedPref.instance.getStringValue("pass").then((pass) async {
            UserModel user = await Auth().signIn(email, pass);
            print("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
            Get.put(user);
            print(user);
            switch (user.userType) {
              case 'Patient':
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile(user: user)));
                }

                break;
              case 'Doctor':
                Navigator.push(context, MaterialPageRoute(builder: (context) => DocProfile(user: user)));

                break;
              case 'Admin':
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome(user: user)));

                break;
              case 'Hospital':
                Navigator.push(context, MaterialPageRoute(builder: (context) => PharmProfile(user: user)));

                break;
              default:
            }
          });
        });
      } else {
        navigateToLogin();
      }
    });
  }

  navigateToLogin() {
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.of(context)
            .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (Route<dynamic> route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
        child: Container(
          child: Stack(
            children: [
                Container(
                padding: EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                child: Text(
                  'Welcome To',
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
              ),
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
      ),
    );
  }
}
