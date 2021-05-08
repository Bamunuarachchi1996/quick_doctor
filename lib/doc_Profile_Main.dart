import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_doctor/about_us.dart';
import 'package:quick_doctor/appointments_for_doctor.dart';
import 'package:quick_doctor/calendar.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/views/homepage.dart';

import 'package:url_launcher/url_launcher.dart';

class DocProfileMain extends StatelessWidget {
  final UserModel user;
  final String type;

  const DocProfileMain({Key key, this.user, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //getCurUser();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            title: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '          Doctor Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Profile',
                  icon: Icon(Icons.person),
                ),
                Tab(
                  text: 'Appointments',
                  icon: Icon(Icons.assignment),
                ),
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: TabBarView(
              children: [
                Container(
                  child: ListView(
                    padding: EdgeInsets.all(40),
                    children: [
                      Container(
                          child: Container(
                        height: 30,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.person),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Name\t\t\t\t: ${user.name}')
                            ],
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Container(
                        height: 30,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.alternate_email_rounded),
                              SizedBox(
                                width: 10,
                              ),
                              Text('E-Mail\t\t\t\t: ${user.email}')
                            ],
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Container(
                        height: 30,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.phone),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Tel No\t\t\t\t: ${user.telnum}'),
                            ],
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Container(
                        height: 30,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.mail),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Address\t: ${user.address}')
                            ],
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Container(
                        height: 30,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.person),
                              SizedBox(
                                width: 10,
                              ),
                              Text('NIC\t\t\t\t\t\t\t\t\t: ${user.nic}')
                            ],
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Container(
                        height: 30,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.group),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Gender\t\t\t: ${user.gender == Gender.Male ? 'Male' : 'Female'}')
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                ListView(
                  padding: EdgeInsets.only(top: 100, left: 40, right: 40, bottom: 40),
                  children: [
                    MaterialButton(
                      onPressed: () {
                        if (type == "patient") {
                           Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Calendar(user: user)));
                          //  ExtendedNavigator.of(context).push(Routes.calendar, arguments: CalendarArguments(user: user));
                          print("not done");
                        } else {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => AppointmentsForDoctor(user: user)));
                        }
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
                              Center(child: FaIcon(FontAwesomeIcons.bookMedical)),
                              SizedBox(
                                width: 10.0,
                              ),
                              if (type == "patient")
                                Center(
                                  child: Text(
                                    ' Make an Appointment',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                )
                              else
                                Center(
                                  child: Text(
                                    ' Current Appointments',
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
                  ],
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () => launch("tel://${user.telnum}"),
            tooltip: 'Increment',
            child: Icon(Icons.phone),
            elevation: 2.0,
            backgroundColor: Colors.green,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.info_sharp),
                label: 'About us',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
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
          )),
    );
  }
}
