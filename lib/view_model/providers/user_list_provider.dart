import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../model/new_user_model.dart';
import '../../model/regular_user_model.dart';

class UserListProvider with ChangeNotifier {
  //*************************  new user ************************************
  List<NewUserModel> newUserList = [];
  NewUserModel? newUserModel;
  fetchNewUserList() async {
    List<NewUserModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("new user").get();
    value.docs.forEach(
      (element) {
        print('asdf ${element.get("email")}');
        newUserModel = NewUserModel(
          uid: element.get("uid"),
          email: element.get("email"),
          firstName: element.get("firstName"),
          secondName: element.get("secondName"),
          status: element.get("status"),
        );
        newList.add(newUserModel!);
      },
    );
    newUserList = newList;
    notifyListeners();
  }

  List<NewUserModel> get getNewUserList {
    return newUserList;
  }

  //************************ regular user *********************************

  List<RegularUserModel> regularUserList = [];
  RegularUserModel? regularUserModel;
  fetchRegularUserList() async {
    List<RegularUserModel> regularList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("regular user").get();
    value.docs.forEach(
      (element) {
        print('asdf ${element.get("email")}');
        regularUserModel = RegularUserModel(
          uid: element.get("uid"),
          email: element.get("email"),
          firstName: element.get("firstName"),
          secondName: element.get("secondName"),
          status: element.get("status"),
        );
        regularList.add(regularUserModel!);
      },
    );
    regularUserList = regularList;
    notifyListeners();
  }

  List<RegularUserModel> get getRegularUserList {
    return regularUserList;
  }
}
