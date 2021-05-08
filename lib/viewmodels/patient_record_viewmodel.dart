import 'package:flutter/material.dart';
import 'package:quick_doctor/models/medicine.dart';
import 'package:quick_doctor/services/database.dart';

class PatientRecordViewModel extends ChangeNotifier {
  List<Medicine> medicines;

  PatientRecordViewModel(String uid) {
    getMedicines(uid);
  }

  getMedicines(String uid) async {
    Database database = new Database();
    medicines = await database.getRecordsByUser(uid);
    print(medicines);
    notifyListeners();
  }
}
