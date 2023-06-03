import 'package:cloud_firestore/cloud_firestore.dart';

class RegularUserModel {
  final String? uid;
  final String? firstName;
  final String? secondName;
  final String? email;
  final String? status;
  RegularUserModel({
    this.uid,
    this.firstName,
    this.secondName,
    this.email,
    this.status,
  });

  factory RegularUserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return RegularUserModel(
      uid: data?['uid'],
      firstName: data?['firstName'],
      secondName: data?['secondName'],
      email: data?['email'],
      status: data?['status'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "uid": uid,
      if (firstName != null) "firstName": firstName,
      if (secondName != null) "secondName": secondName,
      if (status != null) "status": status,
      if (email != null) "email": email,
    };
  }
}
