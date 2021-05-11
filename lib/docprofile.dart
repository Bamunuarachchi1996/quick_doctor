import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quick_doctor/about_us.dart';
import 'package:quick_doctor/appointments_for_doctor.dart';
import 'package:quick_doctor/docmanageappointments.dart';
import 'package:quick_doctor/loginpage.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/user_doc_view.dart';

import 'package:quick_doctor/viewmodels/patient_search_viewmodel.dart';
import 'package:quick_doctor/views/homepage.dart';

//var count=0;

class DocProfile extends StatefulWidget {
  final UserModel user;

  const DocProfile({Key key, this.user}) : super(key: key);

  @override
  _DocProfileState createState() => _DocProfileState();
}

class _DocProfileState extends State<DocProfile> {
   Future<bool> _onBackPressed() {
    return AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            // customHeader: Image.asset("assets/images/macha.gif"),
            animType: AnimType.TOPSLIDE,
            btnOkText: "yes",
            btnCancelText: "No..",
            title: 'Are you sure ?',
            desc: 'Do you want to exit an App',
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              exit(0);
            }).show() ??
        false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
          child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Welcome Dr. ${widget.user.name}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Colors.green,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage("assets/doc.png"), fit: BoxFit.fill)),
                        margin: EdgeInsets.only(top: 10),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${widget.user.name}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.user.email}',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.user.docReg}',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
              )
            ],
          ),
        ),
        //below
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.only(top: 100, left: 40, right: 40, bottom: 40),
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentsForDoctor(user: widget.user)));

                  // ExtendedNavigator.of(context)
                  //     .push(Routes.appointmentsForDoctor, arguments: AppointmentsForDoctorArguments(user: user));
                  //Navigator.of(context).pushNamed('/appointmentsfordoctor');
                },
                child: Container(
                  height: 80.0,
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
                        Center(child: FaIcon(FontAwesomeIcons.list)),
                        SizedBox(
                          width: 10.0,
                        ),
                        Center(
                          child: Text(
                            ' My Appointments',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  showSearch(context: context, delegate: Searchdata());
                },
                child: Container(
                    height: 80.0,
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
                          Center(child: FaIcon(FontAwesomeIcons.search)),
                          SizedBox(
                            width: 10.0,
                          ),
                          Center(
                            child: Text(
                              ' Search Patients',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    )),
              ),

              SizedBox(
                height: 50,
              ), //************************************************************************************* */
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DocManageAppointments(user: widget.user)));

                  // ExtendedNavigator.of(context)
                  //     .push(Routes.docManageAppointments, arguments: DocManageAppointmentsArguments(user: user));
                  //Navigator.of(context).pushNamed('/appointmentsfordoctor');
                },
                child: Container(
                  height: 80.0,
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
                        Center(child: FaIcon(FontAwesomeIcons.edit)),
                        SizedBox(
                          width: 10.0,
                        ),
                        Center(
                          child: Text(
                            ' Manage Appointments',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              ///***************************************************************************************** */

              /*
              Column(
                changed hereeeeee
                children: <Widget>[
                  //_button('6.00'),
                  //_button('6.30'),
                  //_button('7.00'),
                  Text('6.00'),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: LiteRollingSwitch(
                      value: false,
                      textOn: "On",
                      textOff: "Off",
                      colorOn: Colors.greenAccent,
                      colorOff: Colors.redAccent,
                      
                      iconOff: Icons.alarm_off,
                      iconOn: Icons.done,
                      textSize: 18.0,
                      onChanged: (bool position) async {
                        //print("The button is $position");
                        DocumentReference docRef = Firestore.instance
                            .collection('Users')
                            .document(user.id);
                        DocumentSnapshot doc = await docRef.get();
                        List times = doc.data['slots'];
                        if (position) {
                          docRef.updateData({
                            'slots': FieldValue.arrayUnion(['6.00'])
                            
                          });
                          
                        }
                        else{
                          docRef.updateData({
                            'slots': FieldValue.arrayRemove(['6.00'])
                             });
                             
                        }
                      },
                    ),
                  ),
                ],
              ),*/
            ],
          ),
        ),

        //above
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.info_sharp),
              label: 'About us',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'news',
            ),
          ],
          selectedItemColor: Colors.green[900],
          backgroundColor: Colors.lightGreen[200],
          onTap: (value) {
            switch (value) {
              case 0:
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));

                break;
              case 1:
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

                break;
              default:
            }
          },
        ),
      ),
    );
  }
}

class Searchdata extends SearchDelegate<String> {
  PatientSearchViewModel viewModel = PatientSearchViewModel();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      viewModel.query(query);
    }

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<PatientSearchViewModel>(builder: (context, model, child) {
        return model.users != null
            ? ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserDocView(user: model.users[index])));

                    // ExtendedNavigator.of(context)
                    //     .push(Routes.userDocView, arguments: UserDocViewArguments(user: model.users[index]));
                  },
                  leading: Icon(Icons.person_rounded),
                  title: RichText(
                    text: TextSpan(
                        text: model.users[index].name.substring(0, query.length),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: model.users[index].name.substring(query.length),
                              style: TextStyle(color: Colors.grey))
                        ]),
                  ),
                ),
                itemCount: model.users.length,
              )
            : Container();
      }),
    );
  }
}
