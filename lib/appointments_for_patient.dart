import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_doctor/about_us.dart';
import 'package:quick_doctor/models/userModel.dart';

import 'package:quick_doctor/viewmodels/appoinments_view_model.dart';
import 'package:quick_doctor/views/homepage.dart';

//DateTime dateTime = EventModel().eventDate;
//DateTime dateTime = DateTime.now();
//DateFormat dateFormat = DateFormat("yyyy-MM-dd");
//String string = dateFormat.format(dateTime);
//DateTime _eventDate = EventModel().eventDate;

_buildTextView(String text) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(text, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
  );
}

class AppointmentsForPatient extends StatelessWidget {
  final UserModel user;

  const AppointmentsForPatient({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider(
        create: (context) => AppointmentsViewModel(user.id, "patient"),
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
                          ? ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 40),
                              children: model.event.map((e) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 140,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          //Text(e.date),
                                          _buildTextView("Dr." + e.doctor),
                                          _buildTextView("Illness : " + e.illness),
                                          _buildTextView(e.eventDate.year.toString() +
                                              "-" +
                                              e.eventDate.month.toString() +
                                              "-" +
                                              e.eventDate.day.toString() +
                                              " _ "+
                                              "${e.eventDate}"),
                                        ],
                                      ),
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

class Searchdata extends SearchDelegate<String> {
  final names = ['amal', 'kamal', 'nimal', 'kalum'];

  final recentsearch = ['kamal', 'niaml'];

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
    final finalList = query.isEmpty ? recentsearch : names.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/userprofile');
        },
        leading: Icon(Icons.person_rounded),
        title: RichText(
          text: TextSpan(
              text: finalList[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(text: finalList[index].substring(query.length), style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: finalList.length,
    );
  }
}
