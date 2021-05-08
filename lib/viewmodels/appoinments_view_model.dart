import 'package:flutter/material.dart';
import 'package:quick_doctor/models/event.dart';
import 'package:quick_doctor/services/database.dart';

class AppointmentsViewModel extends ChangeNotifier {
  final String type;

  List<EventModel> event;

  AppointmentsViewModel(String uid, this.type) {
    getAppointment(uid);
  }

  getAppointment(String uid) async {
    Database database = new Database();
    event = await database.getAppointments(uid, this.type);
    print(event);
    notifyListeners();
  }
}
