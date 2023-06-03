import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallReusableButton extends StatelessWidget {
  final double width;
  final double height;
  final IconData iconData;
  final double size;
  final double radius;
  final Color color;
  final VoidCallback onPress;
  const SmallReusableButton({
    Key? key,
    required this.width,
    required this.height,
    required this.iconData,
    required this.size,
    required this.radius,
    required this.color,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius.r),
        ),
        child: Icon(
          iconData,
          color: const Color(0xff2F2F37),
          size: size.sp,
        ),
      ),
    );
  }
}
