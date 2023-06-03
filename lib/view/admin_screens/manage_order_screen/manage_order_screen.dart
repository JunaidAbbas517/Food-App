import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared_components/widgets/back_button.dart';

class ManageOrderScreen extends StatefulWidget {
  const ManageOrderScreen({Key? key}) : super(key: key);

  @override
  State<ManageOrderScreen> createState() => _ManageOrderScreenState();
}

class _ManageOrderScreenState extends State<ManageOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            SizedBox(
              width: 250.w,
              height: 42.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtons(onPress: () {
                    Navigator.pop(context);
                  }),
                  Text(
                    'Manage Orders',
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: const Color(0xff2F2F37),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
