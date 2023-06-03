import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButtons extends StatelessWidget {
  final VoidCallback onPress;
  const BackButtons({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 42.w,
        height: 42.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/icons/back.png"),
          ),
        ),
      ),
    );
  }
}
