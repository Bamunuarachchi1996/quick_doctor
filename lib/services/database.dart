import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_doctor/models/event.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/models/medicine.dart';

class Database {
  FirebaseFirestore _firestore;
  final String userPath = 'Users';
  final String patient = 'PatientData';
  final String appointment = 'Appointments';

  Database() {
    _firestore = FirebaseFirestore.instance;
  }

  Future<bool> insertUser(
    UserModel user,
  ) async {
    try {
      await _firestore.collection(userPath).doc(user.id).set(user.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> insertMedi(
    Medicine medicine,
  ) async {
    try {
      await _firestore.collection(patient).doc(medicine.id).set(medicine.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection(userPath).doc(uid).get();
      return UserModel.fromMap(snapshot.data());
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Medicine> getMedi(String id) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection(patient).doc(id).get();
      return Medicine.fromMap(snapshot.data());
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Medicine>> getRecordsByUser(String uid) async {
    try {
      print("User: $uid");
      List<Medicine> medicines = List();
      QuerySnapshot snapshot = await _firestore.collection(patient).where("patient_id", isEqualTo: uid).get();
      print("Snaps : $snapshot");
      for (DocumentSnapshot r in snapshot.docs) {
        Medicine model = Medicine.fromMap(r.data());
        medicines.add(model);
      }
      return medicines;
    } catch (e) {
      print(e);
    }
  }

  Future<List<UserModel>> getTime(String uid) async {
    try {
      print("User: $uid");
      List<UserModel> user = List();
      QuerySnapshot snapshot = await _firestore.collection(userPath).where("id", isEqualTo: uid).get();
      print("Snaps : $snapshot");
      for (DocumentSnapshot r in snapshot.docs) {
        UserModel model = UserModel.fromMap(r.data());
        user.add(model);
      }
      return user;
    } catch (e) {
      print(e);
    }
  }

  Future<List<UserModel>> getP() async {
    try {
      // print("User: $uid");
      List<UserModel> user = List();
      QuerySnapshot snapshot = await _firestore.collection(userPath).where("userType", isEqualTo: "Hospital").get();
      print("Snaps : $snapshot");
      for (DocumentSnapshot r in snapshot.docs) {
        UserModel model = UserModel.fromMap(r.data());
        user.add(model);
      }
      return user;
    } catch (e) {
      print(e);
    }
  }

  Future<List<UserModel>> getD() async {
    try {
      // print("User: $uid");
      List<UserModel> user = List();
      QuerySnapshot snapshot = await _firestore.collection(userPath).where("userType", isEqualTo: "Doctor").get();
      print("Snaps : $snapshot");
      for (DocumentSnapshot r in snapshot.docs) {
        UserModel model = UserModel.fromMap(r.data());
        user.add(model);
      }
      return user;
    } catch (e) {
      print(e);
    }
  }

  Future<List<UserModel>> getDocCat(String cat) async {
    try {
      print("User: $cat");
      List<UserModel> user = List();
      QuerySnapshot snapshot = await _firestore.collection(userPath).where("docCat", isEqualTo: cat).get();
      print("Snaps : ${snapshot.docs.length}");
      for (DocumentSnapshot r in snapshot.docs) {
        UserModel model = UserModel.fromMap(r.data());
        print(model.docCat);
        user.add(model);
      }
      return user;
    } catch (e) {
      print(e);
    }
  }

  Future<List<EventModel>> getAppointments(String uid, String type) async {
    try {
      print("User: $uid");
      if (type == "doctor") {
        List<EventModel> event = List();
        QuerySnapshot snapshot = await _firestore.collection(appointment).where("doc_id", isEqualTo: uid).get();
        print("Snaps : $snapshot");
        for (DocumentSnapshot r in snapshot.docs) {
          EventModel model = EventModel.fromMap(r.data());
          event.add(model);
        }

        return event;
      } else {
        List<EventModel> event = List();
        QuerySnapshot snapshot = await _firestore.collection(appointment).where("id", isEqualTo: uid).get();
        print("Snaps : $snapshot");
        for (DocumentSnapshot r in snapshot.docs) {
          EventModel model = EventModel.fromMap(r.data());
          event.add(model);
        }

        return event;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> deleteField(String uniqid) async {
    return await _firestore.collection(appointment).doc(uniqid).update({'status': 'cancelled'}).then((value) {
      print("cancelled");
      return true;
    }).catchError((error) {
      print("Failed to cancel user's property: $error");
      return false;
    });
  }
}
