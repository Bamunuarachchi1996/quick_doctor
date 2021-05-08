import 'package:flutter/material.dart';
import 'package:quick_doctor/models/event.dart';

class EventDetailsPage extends StatelessWidget {
  final EventModel event;

  const EventDetailsPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Illness - ${event.illness}",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              "Appointment Date - ${event.eventDate}",
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20.0),
            Text("${event.timeSlot}"),
            
          ],
        ),
      ),
    );
  }
}
