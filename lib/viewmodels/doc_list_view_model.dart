import 'package:flutter/material.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/services/database.dart';

class DocListViewModel extends ChangeNotifier {
  List<UserModel> users;
  List<UserModel> docList = [];
  String cat;

  DocListViewModel({this.cat}) {
    print("calling $cat");
    getdoc();
    getdocbycat(cat);
  }

  getdoc() async {
    Database database = new Database();
    users = await database.getD();
    print(users);
    notifyListeners();
  }

   getdocbycat(String cat) async {
    Database database = new Database();
    docList = await database.getDocCat(cat);
    print(docList);
    notifyListeners();
  }
}