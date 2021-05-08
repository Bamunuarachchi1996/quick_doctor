String apiKey = "87676a18442842799f06c03bcff01038";

// 
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:quick_doctor/models/userModel.dart';
// 
// import 'package:quick_doctor/viewmodels/pharmacy_search_viewmodel.dart';
// import 'package:url_launcher/url_launcher.dart';

// _buildTextView(String text) {
//   return Container(
//     alignment: Alignment.centerLeft,
//     child: Text(text, style: TextStyle(fontSize: 25)),
//   );
// }

// class PharmacyList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ChangeNotifierProvider(
//         create: (context) => PharmacySearchViewModel(),
//         child: Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 'View Pharmacies',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             body: Container(
//                 child: Column(
//               children: [
//                 Container(
//                     child: ListTile(
//                   title: Text("Rajaye Osusala"),
//                   subtitle: Text("Hunupitiya Lake Rd, Colombo 00200"),
//                 )),
//                 Container(
//                     child: ListTile(
//                   title: Text("MyMed.lk"),
//                   subtitle: Text("460 Union Pl, Colombo 00200"),
//                 )),
//                 Container(
//                     child: ListTile(
//                   title: Text("Lanka Pharmacy"),
//                   subtitle: Text(
//                       "Sri Jayawardenepura Mawatha, Sri Jayawardenepura Kotte"),
//                 )),
//                 Container(
//                     child: ListTile(
//                   title: Text("Union Chemists"),
//                   subtitle: Text("708 Madiwela Rd, Ruhunupura 10116"),
//                 ))
//               ],
//             )),
//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.centerDocked,
//             bottomNavigationBar: BottomNavigationBar(
//               items: const <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.settings),
//                   label: 'Settings',
//                 ),
//               ],
//               selectedItemColor: Colors.green[900],
//               backgroundColor: Colors.lightGreen[200],
//               onTap: (value) {
//                 switch (value) {
//                   case 0:
//                     ExtendedNavigator.of(context).push(Routes.InitialRoute);
//                     break;
//                   case 1:
//                     ExtendedNavigator.of(context).push(Routes.InitialRoute);
//                     break;
//                   default:
//                 }
//               },
//             )),
//       ),
//     );
//   }
// }
