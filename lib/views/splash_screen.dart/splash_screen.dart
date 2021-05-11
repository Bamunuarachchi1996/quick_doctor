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
import 'package:quick_doctor/utils/colorScheme.dart';
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
      backgroundColor: bgColor,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: pathPainter(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(50),
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Doctor's Appointment in 2 Minutes",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "Finding a doctor was never \nso easy",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Image.asset('assets/onBoardDoc.png'),
                    )),
              ),
               Positioned(
                bottom: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // padding: EdgeInsets.fromLTRB(15.0, 170.0, 0.0, 0.0),
                      child: Text(
                        'Quick',
                        style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                     Container(
                // padding: EdgeInsets.fromLTRB(150.0, 170.0, 0.0, 0.0),
                child: Text(
                  'Doctor',
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              )
                  ],
                ),
              ),
             
              // Positioned(
              //   bottom: 0,
              //   right: 0,
              //   child: InkWell(
              //     child: Container(
              //       height: 80,
              //       width: 200,
              //       decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //           stops: [0,1],
              //           colors: [getStartedColorStart,getStartedColorEnd],
              //         ),
              //         borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(25),
              //         )
              //       ),
              //       child: Center(
              //         child: Text(
              //           "Get Started", style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 20,
              //           fontWeight: FontWeight.w800,
              //         ),
              //         ),
              //       ),
              //     ),
              //     // onTap: openHomePage,
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}

class pathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = path1Color;
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.40, size.width * 0.58, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.72, size.height * 0.8, size.width * 0.92, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.98, size.height * 0.8, size.width, size.height * 0.82);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
