import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_doctor/about_us.dart';
import 'package:quick_doctor/models/userModel.dart';

import 'package:quick_doctor/viewmodels/appoinments_view_model.dart';
import 'package:quick_doctor/views/homepage.dart';

_buildTextView(String text) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
  );
}

class AppointmentsForDoctor extends StatelessWidget {
  final UserModel user;

  const AppointmentsForDoctor({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider(
        create: (context) => AppointmentsViewModel(user.id, "doctor"),
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'View Appointments',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView(
                padding: EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 40),
                children: [
                  Container(
                    child: Container(
                      height: 40,
                      child: Text(
                        'Appointments',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.lightGreen[900]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Consumer<AppointmentsViewModel>(builder: (context, model, child) {
                      return model.event != null && model.event.length > 0
                          ? Container(
                            height: MediaQuery.of(context).size.height/ 1.3,
                                                      child: ListView(
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 30, left: 0, right: 0, bottom: 40),
                                children: model.event.map((e) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                     margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                        decoration:
                                            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                      child: Column(
                                        children: [
                                          //Text(e.date),
                                           _buildTextView("Patient : ${e.patient}"),
                                          _buildTextView("Illness : ${e.illness}"),
                                          _buildTextView("Date : " +
                                              e.eventDate.year.toString() +
                                              "-" +
                                              e.eventDate.month.toString() +
                                              "-" +
                                              e.eventDate.day.toString()),
                                          _buildTextView("Time : ${e.timeSlot}"),
                                          ElevatedButton.icon(
                                              onPressed: () {},
                                              icon: Icon(Icons.cancel),
                                              label: Text("Reject Appointment"))
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
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
            )),
      ),
    );
  }
}
