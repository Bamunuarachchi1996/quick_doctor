import 'package:flutter/material.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/services/database.dart';

class TimeViewModel extends ChangeNotifier {
  List<UserModel> time;

  TimeViewModel(String uid) {
    getAppointment(uid);
  }

  getAppointment(String uid) async {
    Database database = new Database();
    time = await database.getTime(uid);
    print(time);
    notifyListeners();
  }
}
