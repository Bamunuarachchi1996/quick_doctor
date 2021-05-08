import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quick_doctor/about_us.dart';
import 'package:quick_doctor/doc_Profile_Main.dart';
import 'package:quick_doctor/doctor_signup.dart';
import 'package:quick_doctor/loginpage.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/pharm_signup.dart';

import 'package:quick_doctor/services/auth.dart';
import 'package:quick_doctor/user_admin_view.dart';
import 'package:quick_doctor/viewmodels/search_viewmodel.dart';
import 'package:quick_doctor/views/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

String userType;

_makingPhoneCall() async {
  const url = 'tel:0719855825';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class AdminHome extends StatefulWidget {
  final UserModel user;

  const AdminHome({Key key, this.user}) : super(key: key);
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Admin Page',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
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
                            image: DecorationImage(image: AssetImage("assets/admin.png"), fit: BoxFit.fill)),
                        margin: EdgeInsets.only(top: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.user.name}",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        '${widget.user.email}',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.add_box),
                title: Text(
                  'Add Doctor',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorSignup()));
                },
              ),
              ListTile(
                leading: Icon(Icons.add_box),
                title: Text(
                  'Add Hospital',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PharmSignup()));
                  
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () async {
                  Auth().logout();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
              )
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
          child: ListView(
            padding: EdgeInsets.only(top: 100, left: 40, right: 40, bottom: 40),
            children: [
              GestureDetector(
                onTap: () {
                  userType = "doctor";
                  showSearch(context: context, delegate: Searchdata());
                  //showSearch(context: context, delegate: Searchdata("doctor"));
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
                            ' Search Doctor',
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
                  userType = "patient";
                  //showSearch(context: context, delegate: Searchdata("patient"));
                  showSearch(context: context, delegate: Searchdata());
                  // ExtendedNavigator.of(context).push(Routes.patientSearch);
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
                              ' Search Patient',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _makingPhoneCall();
          },
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
          backgroundColor: Colors.lightGreen[300],
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
        ));
  }
}

class Searchdata extends SearchDelegate<String> {
  SearchViewModel viewModel = SearchViewModel(userType);

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
                    if (userType == "patient") {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => UserAdminView(user: model.users[index])));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DocProfileMain(user: model.users[index], type: "admin")));
                    }
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
