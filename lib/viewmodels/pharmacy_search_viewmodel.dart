import 'package:flutter/material.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/services/database.dart';

class PharmacySearchViewModel extends ChangeNotifier {
  List<UserModel> users;

  PharmacySearchViewModel() {
    getPharm();
  }

  getPharm() async {
    Database database = new Database();
    users = await database.getP();
    print(users);
    notifyListeners();
  }
}
