import 'package:cloud_firestore/cloud_firestore.dart';

class NewUserModel {
  final String? uid;
  final String? firstName;
  final String? secondName;
  final String? email;
  final String? status;
  NewUserModel({
    this.uid,
    this.firstName,
    this.secondName,
    this.email,
    this.status,
  });

  factory NewUserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return NewUserModel(
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
