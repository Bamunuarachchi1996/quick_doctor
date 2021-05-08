import 'package:flutter/material.dart';

class MyAppp extends StatefulWidget {
  @override
  _MyApppState createState() => _MyApppState();
}

class _MyApppState extends State<MyAppp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('el nuevo titulo'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: new Container(
          child: Text('hola mundo',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black)),
        ),
      ),
    );
  }
}
