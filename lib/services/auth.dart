import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/patient_signup.dart';
import 'package:quick_doctor/services/database.dart';

class Auth {
  FirebaseAuth _auth;
  final _gooleSignIn = GoogleSignIn();
  Auth() {
    _auth = FirebaseAuth.instance;
  }

  Future<UserModel> googleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _gooleSignIn.signIn();
    try {
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

        UserCredential result = await auth.signInWithCredential(credential);
        var userModel = UserModel();
        //userModel.id = result.user.uid;
        userModel.email = result.user.email;
        userModel.userType = "Patient";
        userModel.name = result.user.displayName;
        userModel.userName = result.user.displayName.split(" ")[0];
        userModel.gender = null;
        if (!await Database().insertUser(userModel)) {
          result.user.delete();
          return null;
        }
        return userModel;
      } else
        return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> register(UserModel userModel, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: userModel.email, password: password);
      if (result.user == null) return false;
      userModel.id = result.user.uid;
      if (!await Database().insertUser(userModel)) {
        result.user.delete();
        return false;
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<bool> addMedi(Medicine medicine) async {
  //   try {
  //     UserCredential result = await _auth.createUserWithEmailAndPassword();
  //     if (result.user == null) return false;
  //     medicine.id = result.user.uid;
  //     if (!await Database().insertMedi(medicine)) {
  //       result.user.delete();
  //       return false;
  //     }
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  Future<UserModel> signIn(String email, String password) async {
    try {
      UserCredential results = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (results.user == null) return null;
      return await Database().getUser(results.user.uid);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel> curUser() async {
    try {
      User results = _auth.currentUser;
      if (results == null) return null;
      return await Database().getUser(results.uid);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> logout() async {
    return await _auth.signOut();
  }

  Future<String> getCurrentUID() async {
    return (_auth.currentUser).uid;
  }
}
