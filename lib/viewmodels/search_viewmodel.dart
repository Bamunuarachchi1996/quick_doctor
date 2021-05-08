import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quick_doctor/models/userModel.dart';

class SearchViewModel extends ChangeNotifier {
  final String type;
  List<UserModel> users;

  SearchViewModel(this.type);

  query(String query) {
    if (type == "doctor") {
      FirebaseFirestore.instance
          .collection("Users")
          .where("docName", isGreaterThanOrEqualTo: query.toLowerCase())
          .where("docName", isLessThan: createSuccessorKey(query.toLowerCase()))
          .limit(5)
          .get()
          .then((value) {
        users = List();
        value.docs.forEach((doc) {
          UserModel user = UserModel();

          user = UserModel.fromMap(doc.data());
          users.add(user);
        });
        print(users);
        notifyListeners();
      });
    } else {
      FirebaseFirestore.instance
          .collection("Users")
          .where("userName", isGreaterThanOrEqualTo: query.toLowerCase())
          .where("userName",
              isLessThan: createSuccessorKey(query.toLowerCase()))
          .limit(5)
          .get()
          .then((value) {
        users = List();
        value.docs.forEach((doc) {
          UserModel user = UserModel();

          user = UserModel.fromMap(doc.data());
          users.add(user);
        });
        print(users);
        notifyListeners();
      });
    }
  }

  String createSuccessorKey(String query) {
    String lastCharacter = query[query.length - 1];
    String temp = query.substring(0, query.length - 1);
    int c = lastCharacter.codeUnitAt(0);

    int end = "z".codeUnitAt(0);
    if (c < end) {
      c++;
    }
    temp += String.fromCharCode(c);
    print("Successor Key : $temp");
    return temp;
  }
}
