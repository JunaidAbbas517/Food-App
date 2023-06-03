import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../model/userModel.dart';
import '../../shared_components/routes/routes_name.dart';
import '../../view/auth_screens/verify_screen.dart';
import '../services/services.dart';

class UserAuth extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel signupModel = UserModel() ;
  // bool signupModelLoading = false;
  // bool signInModelLoading = false;
  //==================SignUp Provider===============================
  signUpDataProvider(
    BuildContext context, {
    required String firstName,
    required String lastName,
    required String email,
    required String contact,
    required String password,
    required String address,
  }) async {
      try {
        await _auth
            .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((value) async {
          // signupModelLoading = true;
          User? user = _auth.currentUser;
          // for firestore

          UserModel userModel = UserModel();
          userModel.email = user!.email;
          userModel.uid = user.uid;
          userModel.firstName = firstName;
          userModel.lastName = lastName;
          userModel.password = password;
          userModel.contact = contact;
          userModel.address = address;
          userModel.status = 'pending';
          print('user $user');
          try {
            final CollectionReference userCollection =
                FirebaseFirestore.instance.collection('new user');

            // save data in firestore
            await userCollection
                .doc(user.uid)
                .set(userModel.toMap())
                .then((value) async {
              // final prefs = await SharedPreferences.getInstance();

              Navigator.pushAndRemoveUntil(
                  (context),
                  MaterialPageRoute(builder: (context) =>   VerifyScreen(uid: user.uid,)),
                  (route) => false);
              // await prefs.setString('email', user.uid);
            });
            Fluttertoast.showToast(msg: "Account created sucessfully");
          } on FirebaseAuthException catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        });
      } catch (e) {
        // signupModelLoading = false;
        print(e.toString());
        return null;
      }
    notifyListeners();
  }

  //==================SignIn Provider===============================
  Future<User?> signUserIn({
    required String email,
    required String password,
    required BuildContext context,}
      ) async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    // try sign in
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        Fluttertoast.showToast(msg:'user-not-found');
      }

      // WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        // show error to user
        Fluttertoast.showToast(msg:'user-not-found');
      }
    }
    return user;
  }
}
