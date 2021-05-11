import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quick_doctor/about_us.dart';
import 'package:quick_doctor/add_record.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/views/homepage.dart';

import 'viewmodels/patient_record_viewmodel.dart';

_buildTextView(String text) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
  );
}

// UserModel tmp;
// void getUser() async {
//   final FirebaseUser user = await auth.currentUser();
//   final uid = user.uid;
//   //tmp = Uuid(user);
// }

UserModel _user;
// void getCurUser() async {
//   _user = await Auth().curUser();
// }

class UserDocView extends StatefulWidget {
  final UserModel user;
  const UserDocView({Key key, this.user}) : super(key: key);

  @override
  _UserDocViewState createState() => _UserDocViewState();
}

class _UserDocViewState extends State<UserDocView> {
  @override
  Widget build(BuildContext context) {
    //getCurUser();

    return DefaultTabController(
      length: 2,
      child: ChangeNotifierProvider(
        create: (context) => PatientRecordViewModel(widget.user.id),
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
                  '          Patient Profile',
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
                    text: 'Terminal',
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
                        ))
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
                              'Patient Records',
                              style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.lightGreen[900]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => AddRecord(user: widget.user)));

                            // ExtendedNavigator.of(context).push(Routes.addRecord,
                            //     arguments:
                            //         AddRecordArguments(user: widget.user));
                            //ExtendedNavigator.of(context).push(Routes.addRecord);
                          },
                          child: Container(
                            alignment: Alignment.topLeft,
                            height: 40.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(child: FaIcon(FontAwesomeIcons.plus)),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Center(
                                    child: Text(
                                      ' Add Record',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
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
                                          margin: EdgeInsets.only(bottom: 10),
                                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                      decoration:
                                          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                          child: Column(
                                            children: [
                                              //Text(e.date),
                                               ElevatedButton(onPressed: (){}, child: Text("Illness:  ${e.illness}")),
                                                _buildTextView("Allergies : ${e.allergies}"),
                                                _buildTextView("Days since : ${e.daysSince}"),
                                                _buildTextView("Days since : ${e.duration}"),
                                                _buildTextView("Medicines : ${e.medicines}"),
                                                _buildTextView("Comments from doctor : ${e.comments}"),
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
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
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
