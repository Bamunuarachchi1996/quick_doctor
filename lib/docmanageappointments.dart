
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_doctor/about_us.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/user_doc_view.dart';

import 'package:quick_doctor/viewmodels/patient_search_viewmodel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quick_doctor/views/homepage.dart';

//var count=0;

class DocManageAppointments extends StatelessWidget {
  final UserModel user;

  const DocManageAppointments({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Appointments',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //below
      body: ListView(
        padding: EdgeInsets.only(top: 0, left: 40, right: 40, bottom: 40),
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
              'Tap once to add the time slot & Double tap will be remove the time slot',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Column(
              // changed hereeeeee
              children: <Widget>[
                _button('6.00'),
                _button('6.30'),
                _button('7.00'),
                _button('7.30'),
                _button('18.00'),
                _button('18.30'),
                _button('19.00'),
                _button('19.30'),
                _button('20.00'),
                _button('20.30'),
                _button('21.00'),
                _button('21.30'),
                _button('22.00'),
              ])
        ],
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
    );
  }

  Widget _button(event) => FlatButton(
        //newly added........
        child: Text(event),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.deepOrange)),
        onPressed: () async {
          DocumentReference docRef =
              FirebaseFirestore.instance.collection('Users').doc(user.id);
          DocumentSnapshot doc = await docRef.get();
          // List times = doc.data['slots'];
          if (doc.data().containsValue(event) == true) {
            docRef.update({
              'slots': FieldValue.arrayRemove([event])
            });
            Fluttertoast.showToast(
              msg: " Remove the slot",
              toastLength: Toast.LENGTH_SHORT,
              textColor: Colors.red,
              fontSize: 16,
              backgroundColor: Colors.grey[200],
            );
          } else {
            docRef.update({
              'slots': FieldValue.arrayUnion([event])
            });
            Fluttertoast.showToast(
              msg: " Added the slot",
              toastLength: Toast.LENGTH_SHORT,
              textColor: Colors.green,
              fontSize: 16,
              backgroundColor: Colors.grey[200],
            );
          }
        },
      );
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

                    // ExtendedNavigator.of(context).push(Routes.userDocView,
                    //     arguments:
                    //         UserDocViewArguments(user: model.users[index]));
                  },
                  leading: Icon(Icons.person_rounded),
                  title: RichText(
                    text: TextSpan(
                        text:
                            model.users[index].name.substring(0, query.length),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: model.users[index].name
                                  .substring(query.length),
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
