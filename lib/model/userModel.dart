import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? address;
  String? contact;
  String? status;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.lastName,
      this.password,
      this.contact,
      this.address,
      this.status});


  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': lastName,
      'contact': contact,
      'address': address,
      'status': status,
    };
  }

// //data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map?['uid'],
        email: map?['email'],
        firstName: map?['firstName'],
        lastName: map?['secondName'],
        password: map?['password'],
        contact: map?['contact'],
        address: map?['address'],
        status: map?['status']);
  }
}
