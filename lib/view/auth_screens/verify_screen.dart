import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared_components/routes/routes_name.dart';
import '../../view_model/services/services.dart';

class VerifyScreen extends StatefulWidget {
  String? uid;
   VerifyScreen({Key? key ,this.uid}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  // Timer? timer;
  // @override
  // void initState() {
  //   timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //
  //   });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text(
              "Account is on pending",
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
            height: 10.h
          ),
            GestureDetector(
              onTap:() {
                checkStatus(context :context, uid: widget.uid ,);
              },
              child: Text(
                "click here to check your account status",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );



  }

}
