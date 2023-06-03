import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDashBoardItem extends StatelessWidget {
  final String text;
  final String imagePath;
  const AdminDashBoardItem({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff033345).withOpacity(0.1),
            offset: const Offset(5, 5),
            blurRadius: 10,
            blurStyle: BlurStyle.normal,
          ),
          const BoxShadow(
            color: Colors.white24,
            offset: Offset(-1, -4),
            blurRadius: 10,
            spreadRadius: -1,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: const Color(0xffFFDF33),
            child: Image.asset(
              width: 25.w,
              height: 25.h,
              imagePath,
              color: const Color(0xff033345),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            text,
            style: GoogleFonts.mulish(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
