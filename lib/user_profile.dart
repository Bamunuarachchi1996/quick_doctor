import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quick_doctor/about_us.dart';
import 'package:quick_doctor/appointments_for_patient.dart';
import 'package:quick_doctor/doc_Profile_Main.dart';
import 'package:quick_doctor/loginpage.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/pharmacy_list.dart';
import 'package:quick_doctor/services/auth.dart';

import 'package:quick_doctor/viewmodels/search_viewmodel.dart';
import 'package:quick_doctor/views/doctor/doctorlist.dart';
import 'package:quick_doctor/views/homepage.dart';
import 'viewmodels/patient_record_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

_buildTextView(String text) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(text, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
  );
}

_makingPhoneCall() async {
  const url = 'tel:0719855825';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class UserProfile extends StatefulWidget {
  final UserModel user;
  const UserProfile({Key key, this.user}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: ChangeNotifierProvider(
        create: (context) => PatientRecordViewModel(widget.user.id),
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'User Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                    icon: Icon(Icons.logout),
                    color: Colors.white,
                    onPressed: () {
                      Auth().logout();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    }),
              ],
              backgroundColor: Colors.green,
              bottom: TabBar(
                tabs: [
                  // if (userNow.userType != 'Pharmacy')
                  Tab(
                    text: 'Profile',
                    icon: Icon(Icons.person),
                  ),
                  Tab(
                    text: 'Terminal',
                    icon: Icon(Icons.assignment),
                  ),
                  // if (widget.user.userType == userNow.userType)
                  Tab(
                    text: 'Appointments',
                    icon: Icon(Icons.assignment),
                  ),
                  Tab(
                    text: 'Emergency',
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
                  //if (userNow.userType != 'Pharmacy')
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
                                Text('Name\t\t\t\t: ${widget.user.name}')
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
                                Text('E-Mail\t\t\t\t: ${widget.user.email}')
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
                                Text('Tel No\t\t\t\t: ${widget.user.telnum}')
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
                                Text('Address\t: ${widget.user.address}')
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
                                Text('NIC\t\t\t\t\t\t\t\t\t: ${widget.user.nic}')
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
                                  Text('Gender\t\t\t: ${widget.user.gender == Gender.Male ? 'Male' : 'Female'}')
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          onPressed: () {
                            // ExtendedNavigator.of(context)
                            //     .push(Routes.stepCount);
                          },
                          child: Container(
                              height: 50.0,
                              width: 170,
                              color: Colors.greenAccent,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(child: FaIcon(FontAwesomeIcons.heartbeat)),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Center(
                                      child: Container(
                                        child: Text(
                                          'HEALTH',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PharmacyList()));
                          },
                          child: Container(
                              height: 50.0,
                              width: 170,
                              color: Colors.greenAccent,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(child: FaIcon(FontAwesomeIcons.syringe)),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Center(
                                      child: Container(
                                        child: Text(
                                          'Hospitals List',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      padding: EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 40),
                      children: [
                        Container(
                          child: Container(
                            height: 40,
                            child: Text(
                              'Medical Records',
                              style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.lightGreen[900]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Consumer<PatientRecordViewModel>(builder: (context, model, child) {
                            return model.medicines != null && model.medicines.length > 0
                                ? ListView(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 40),
                                    children: model.medicines.map((e) {
                                      return GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) => Dialog(
                                                    child: Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: ListView(
                                                          shrinkWrap: true,
                                                          children: <Widget>[
                                                            Container(
                                                              padding: EdgeInsets.all(10),
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                    color: Colors.black,
                                                                    width: 3,
                                                                  ),
                                                                  borderRadius: BorderRadius.circular(10)),
                                                              child: Column(
                                                                children: [
                                                                  _buildTextView("Illness : " + e.illness),
                                                                  SizedBox(
                                                                    height: 25.0,
                                                                  ),
                                                                  _buildTextView("Days since illness: " + e.daysSince),
                                                                  SizedBox(
                                                                    height: 25.0,
                                                                  ),
                                                                  _buildTextView("Allergies: " + e.allergies),
                                                                  SizedBox(
                                                                    height: 25.0,
                                                                  ),
                                                                  _buildTextView("Medicine : " + e.medicines),
                                                                  SizedBox(
                                                                    height: 25.0,
                                                                  ),
                                                                  _buildTextView("For How many days : " + e.duration),
                                                                  SizedBox(
                                                                    height: 25.0,
                                                                  ),
                                                                  _buildTextView("Tests to Do : " + e.testsTo),
                                                                  SizedBox(
                                                                    height: 25.0,
                                                                  ),
                                                                  _buildTextView("Comments : " + e.comments),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ));
                                        },
                                        child: Container(
                                          height: 100,
                                          child: Column(
                                            children: [
                                              //Text(e.date),
                                              _buildTextView(e.date),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  )
                                : Container();
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  // if (userNow.userType != 'Doctor' &&
                  // userNow.userType != 'Admin' &&
                  // userNow.userType != 'Pharmacy')
                  ListView(
                    padding: EdgeInsets.only(top: 100, left: 40, right: 40, bottom: 40),
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AppointmentsForPatient(user: widget.user)));

                          // ExtendedNavigator.of(context).push(Routes.appointmentsForPatient,
                          //     arguments: AppointmentsForPatientArguments(user: widget.user));
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
                                borderRadius: BorderRadius.circular(40.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(child: FaIcon(FontAwesomeIcons.list)),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Center(
                                  child: Text(
                                    ' Current Appointments',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                      MaterialButton(
                        onPressed: () {
                          // showSearch(context: context, delegate: Searchdata());
                          //ExtendedNavigator.of(context).push(Routes.docSearch);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                  title: const Text('Select doctor by Category,'),
                                  children: <Widget>[
                                    ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => DoctorList(cat: "eye")));
                                        },
                                        icon: Icon(Icons.remove_red_eye_outlined),
                                        label: Text("Eye")),
                                    ElevatedButton.icon(
                                        onPressed: () {
                                           Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => DoctorList(cat: "dental")));
                                        },
                                        icon: Icon(Icons.accessibility_outlined),
                                        label: Text("Dental")),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      " Or Search doctor by name :",
                                      textAlign: TextAlign.center,
                                    ),
                                    ElevatedButton.icon(
                                        onPressed: () {
                                          showSearch(context: context, delegate: Searchdata());
                                        },
                                        icon: Icon(Icons.search),
                                        label: Text("Search Doctor")),
                                  ],
                                );
                              });
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
                                  borderRadius: BorderRadius.circular(40.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(child: FaIcon(FontAwesomeIcons.search)),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Center(
                                    child: Text(
                                      ' Make an Appointment',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      )
                    ],
                  ),

                  ///*************************************************************************** */
                  ListView(
                    padding: EdgeInsets.only(top: 100, left: 40, right: 40, bottom: 40),
                    children: [
                      RaisedButton.icon(
                        // Icon(Icons.call),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: new Text("Suwa Seriya"),
                        color: Colors.lightBlue,
                        onPressed: () => launch("tel://1990"),
                        icon: Icon(Icons.call),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new RaisedButton.icon(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: new Text("Red cross"),
                        color: Colors.lightBlue,
                        onPressed: () => launch("tel://0332289743"),
                        icon: Icon(Icons.call),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new RaisedButton.icon(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: new Text("Eye donate"),
                        color: Colors.lightBlue,
                        onPressed: () => launch("tel://0112289743"),
                        icon: Icon(Icons.call),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new RaisedButton.icon(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: new Text("Clinic"),
                        color: Colors.lightBlue,
                        onPressed: () => launch("tel://0662287743"),
                        icon: Icon(Icons.call),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new RaisedButton.icon(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: new Text("Organ donate"),
                        color: Colors.lightBlue,
                        onPressed: () => launch("tel://0442289743"),
                        icon: Icon(Icons.call),
                      ),
                    ],
                  ),

                  ///********************************************************************************* */
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // ExtendedNavigator.of(context).push(Routes.chatBot);
              },
              tooltip: 'Increment',
              child: Icon(Icons.child_care),
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
            )),
      ),
    );
  }
}

class Searchdata extends SearchDelegate<String> {
  SearchViewModel viewModel = SearchViewModel("doctor");
  @override
  String get searchFieldLabel => "Search Doctor";

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
      child: Consumer<SearchViewModel>(builder: (context, model, child) {
        return model.users != null
            ? ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DocProfileMain(user: model.users[index], type: "patient")));

                    // ExtendedNavigator.of(context).push(Routes.docProfileMain,
                    //     arguments: DocProfileMainArguments(user: model.users[index], type: "patient"));
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
