// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:pedometer/pedometer.dart';

// class StepCount extends StatefulWidget {
//   @override
//   _StepCountState createState() => _StepCountState();
// }

// class _StepCountState extends State<StepCount> {
//   String muestrePasos = "";
//   String _km = "1";
//   String _calories = "1";

//   String _stepCountValue = '1';
//   StreamSubscription<int> _subscription;

//   double _numerox; //numero pasos
//   double _convert;
//   double _kmx;
//   double burnedx;
//   double _porciento;
//   // double percent=0.1;

//   @override
//   void initState() {
//     super.initState();
//     //initPlatformState();
//     setUpPedometer();
//   }

//   //inicia codigo pedometer
//   void setUpPedometer() {
//     Pedometer pedometer = new Pedometer();
//     _subscription = pedometer.stepCountStream.listen(_onData,
//         onError: _onError, onDone: _onDone, cancelOnError: true);
//   }

//   void _onData(int stepCountValue) async {
//     // print(stepCountValue); //impresion numero pasos por consola
//     setState(() {
//       _stepCountValue = "$stepCountValue";
//       // print(_stepCountValue);
//     });

//     var dist = stepCountValue; //pasamos el entero a una variable llamada dist
//     double y = (dist + .0); //lo convertimos a double una forma de varias

//     setState(() {
//       _numerox =
//           y; //lo pasamos a un estado para ser capturado ya convertido a double
//     });

//     var long3 = (_numerox);
//     long3 = num.parse(y.toStringAsFixed(2));
//     var long4 = (long3 / 10000);

//     int decimals = 1;
//     int fac = pow(10, decimals);
//     double d = long4;
//     d = (d * fac).round() / fac;
//     print("d: $d");

//     getDistanceRun(_numerox);

//     setState(() {
//       _convert = d;
//       print(_convert);
//     });
//   }

//   void reset() {
//     setState(() {
//       int stepCountValue = 0;
//       stepCountValue = 0;
//       _stepCountValue = "$stepCountValue";
//     });
//   }

//   void _onDone() {}

//   void _onError(error) {
//     print("Flutter Pedometer Error: $error");
//   }

//   //function to determine the distance run in kilometers using number of steps
//   void getDistanceRun(double _numerox) {
//     var distance = ((_numerox * 78) / 100000);
//     distance = num.parse(distance.toStringAsFixed(2)); //dos decimales
//     var distancekmx = distance * 34;
//     distancekmx = num.parse(distancekmx.toStringAsFixed(2));
//     //print(distance.runtimeType);
//     setState(() {
//       _km = "$distance";
//       //print(_km);
//     });
//     setState(() {
//       _kmx = num.parse(distancekmx.toStringAsFixed(2));
//     });
//   }

//   //function to determine the calories burned in kilometers using number of steps
//   void getBurnedRun() {
//     setState(() {
//       var calories = _kmx; //dos decimales
//       _calories = "$calories";
//       //print(_calories);
//     });
//   }

//   //fin codigo pedometer

//   @override
//   Widget build(BuildContext context) {
//     getBurnedRun();
//     return MaterialApp(
//       //debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//             automaticallyImplyLeading: false,
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back),
//               color: Colors.white,
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   "Quick Doctor",
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   " healthy Steps",
//                   style: TextStyle(
//                       color: Colors.black87, fontWeight: FontWeight.bold),
//                 )
//               ],
//             ),
//             backgroundColor: Colors.green),
//         body: new Container(
//           color: Colors.white38,
//           child: ListView(
//             padding: EdgeInsets.all(5.0),
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.only(top: 10.0),
//                 width: 150,
//                 height: 150,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                       colors: [Color(0xCCFF99), Color(0x66CC00)],
//                     ),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(27.0),
//                       bottomRight: Radius.circular(27.0),
//                       topLeft: Radius.circular(27.0),
//                       topRight: Radius.circular(27.0),
//                     )),
//                 child: new CircularPercentIndicator(
//                   radius: 100.0,
//                   lineWidth: 13.0,
//                   animation: true,
//                   center: new Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         padding: EdgeInsets.only(left: 20.0),
//                         child: Icon(
//                           FontAwesomeIcons.walking,
//                           size: 30.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Container(
//                         //color: Colors.orange,
//                         child: Text(
//                           '$_stepCountValue',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20.0,
//                               color: Colors.green),
//                         ),
//                         // height: 50.0,
//                         // width: 50.0,
//                       ),
//                     ],
//                   ),
//                   percent: 0.217,
//                   //percent: _convert,
//                   footer: new Text(
//                     "STEPS:  $_stepCountValue",
//                     style: new TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0,
//                         color: Colors.black),
//                   ),
//                   circularStrokeCap: CircularStrokeCap.round,
//                   progressColor: Colors.green,
//                 ),
//               ),
//               Divider(
//                 height: 10,
//               ),
//               Container(
//                 width: 80,
//                 height: 100,
//                 padding: EdgeInsets.only(left: 25.0, top: 10.0, bottom: 10.0),
//                 color: Colors.white,
//                 child: Row(
//                   children: <Widget>[
//                     new Container(
//                       child: new Card(
//                         child: Container(
//                           height: 80.0,
//                           width: 80.0,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage("assets/distance.png"),
//                               fit: BoxFit.fitWidth,
//                               alignment: Alignment.topCenter,
//                             ),
//                           ),
//                           child: Text(
//                             "$_km Km",
//                             textAlign: TextAlign.right,
//                             style: new TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 14.0),
//                           ),
//                         ),
//                         color: Colors.white54,
//                       ),
//                     ),
//                     VerticalDivider(
//                       width: 20.0,
//                     ),
//                     new Container(
//                       child: new Card(
//                         child: Container(
//                           height: 80.0,
//                           width: 80.0,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage("assets/burned.png"),
//                               fit: BoxFit.fitWidth,
//                               alignment: Alignment.topCenter,
//                             ),
//                           ),
//                         ),
//                         color: Colors.transparent,
//                       ),
//                     ),
//                     VerticalDivider(
//                       width: 20.0,
//                     ),
//                     new Container(
//                       child: new Card(
//                         child: Container(
//                           height: 80.0,
//                           width: 80.0,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage("assets/step.png"),
//                               fit: BoxFit.fitWidth,
//                               alignment: Alignment.topCenter,
//                             ),
//                           ),
//                         ),
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 height: 2,
//               ),
//               //info data km, kcal, steps
//               Container(
//                 padding: EdgeInsets.only(top: 2.0),
//                 width: 150, //ancho
//                 height: 30, //largo tambien por numero height: 300
//                 color: Colors.transparent,
//                 child: Row(
//                   children: <Widget>[
//                     new Container(
//                       padding: EdgeInsets.only(left: 40.0),
//                       child: new Card(
//                         child: Container(
//                           child: Text(
//                             "$_km km",
//                             textAlign: TextAlign.right,
//                             style: new TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20.0,
//                                 color: Colors.white),
//                           ),
//                         ),
//                         color: Colors.green,
//                       ),
//                     ),
//                     VerticalDivider(
//                       width: 20.0,
//                     ),
//                     new Container(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child: new Card(
//                         child: Container(
//                           child: Text(
//                             "$_calories kCal",
//                             textAlign: TextAlign.right,
//                             style: new TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20.0,
//                                 color: Colors.white),
//                           ),
//                         ),
//                         color: Colors.red,
//                       ),
//                     ),
//                     VerticalDivider(
//                       width: 20.0,
//                     ),
//                     new Container(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child: new Card(
//                         child: Container(
//                           child: Text(
//                             "$_stepCountValue Steps",
//                             textAlign: TextAlign.right,
//                             style: new TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20.0,
//                                 color: Colors.white),
//                           ),
//                         ),
//                         color: Colors.green,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 height: 10,
//               ),
//               Container(
//                 padding: EdgeInsets.only(left: 25.0, top: 10.0, bottom: 10.0),
//                 color: Colors.white,
//                 child: Row(
//                   children: <Widget>[
//                     new Container(
//                       child: new Card(
//                         child: Container(
//                           height: 80.0,
//                           width: 80.0,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage("assets/barras.png"),
//                               fit: BoxFit.fitWidth,
//                               alignment: Alignment.topCenter,
//                             ),
//                           ),
//                         ),
//                         color: Colors.white,
//                       ),
//                     ),
//                     VerticalDivider(
//                       width: 20.0,
//                     ),
//                     new Container(
//                       child: new Card(
//                         child: Container(
//                           height: 80.0,
//                           width: 80.0,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage("assets/water.png"),
//                               fit: BoxFit.fitWidth,
//                               alignment: Alignment.topCenter,
//                             ),
//                           ),
//                         ),
//                         color: Colors.transparent,
//                       ),
//                     ),
//                     VerticalDivider(
//                       width: 20.0,
//                     ),
//                     new Container(
//                       child: new Card(
//                         child: Container(
//                           height: 80.0,
//                           width: 80.0,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage("assets/heart.jpg"),
//                               fit: BoxFit.fitWidth,
//                               alignment: Alignment.topCenter,
//                             ),
//                           ),
//                         ),
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               Divider(
//                 height: 10,
//               ),

//               Container(
//                 padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
//                 width: 220, //ancho
//                 height: 250, //l
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/cor.png"),
//                     fit: BoxFit.fitWidth,
//                     alignment: Alignment.topCenter,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
