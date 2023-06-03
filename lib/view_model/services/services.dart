import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../shared_components/routes/routes_name.dart';

//********************* Verification user **************************
Future checkStatus({
  required BuildContext context,
  required String? uid,
}) async {
  var regularUser = await FirebaseFirestore.instance
      .collection('regular user')
      .doc(uid)
      .get();
  if (regularUser.exists) {
    return Navigator.pushNamed(
      context,
      RouteName.homeScreen,
    );
  }

  var newUser =
      await FirebaseFirestore.instance.collection('new user').doc(uid).get();
  if (newUser.exists) {
    print('user is new');
    return Fluttertoast.showToast(msg: "User Account is still pending");
  }
}

//********************* Send Verification to user **************************
Future sendEmail({
  required String name,
  required String email,
  required String message,
}) async {
  var serviceId = "service_y16ohce";
  var templateId = "template_6ot3lr7";
  var userId = "KJZNHKq9UfmtGMt9m";
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  var response = await http.post(
    url,
    headers: {
      "origin": "http:localhost",
      'Content-Type': 'application/json ',
    },
    body: jsonEncode({
      "service_id": serviceId,
      "template_id": templateId,
      "user_id": userId,
      "template_params": {
        "name": name,
        "message": message,
        "sender_email": email,
      }
    }),
  );
}
