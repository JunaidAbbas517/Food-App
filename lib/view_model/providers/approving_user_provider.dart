import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../model/userModel.dart';
import '../../shared_components/routes/routes_name.dart';

class ApprovingNewUser extends ChangeNotifier {
  UserModel approvingModel = UserModel();
  //==================Approving user Provider===============================
  approvedDataProvider({
    required BuildContext context,
    required String uid,
  }) async {
    try {
      print('uid $uid');
      await FirebaseFirestore.instance
          .collection('new user')
          .doc(uid)
          .get()
          .then((value) {
        approvingModel.email = value.get("email");
        approvingModel.uid = uid;
        approvingModel.firstName = value.get("firstName");
        approvingModel.lastName = value.get("secondName");
        approvingModel.contact = value.get("contact");
        approvingModel.address = value.get("address");
        approvingModel.status = 'regular';
        // this.approvingModel = UserModel.fromMap(value.data());
      });

      print('zxc ${approvingModel.lastName}');

      final CollectionReference userCollection =
          FirebaseFirestore.instance.collection('regular user');

      // save data in firestore
      await userCollection
          .doc(uid)
          .set(approvingModel.toMap())
          .then((value) async {
        final collection = FirebaseFirestore.instance.collection('new user');
        collection
            .doc(uid) // <-- Doc ID to be deleted.
            .delete() // <-- Delete
            .then((_) => print('Deleted'))
            .catchError((error) => print('Delete failed: $error'));
        Navigator.pushNamed(
          context,
          RouteName.newUserScreen,
        );

        Fluttertoast.showToast(msg: "User Account has been approved");
      });
    } catch (e) {
      // signupModelLoading = false;
      // Fluttertoast.showToast(msg: e.toString());
      print(e.toString());
      return null;
    }
    notifyListeners();
  }
}
