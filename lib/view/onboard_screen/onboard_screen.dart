import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_you_cook_today/shared_components/widgets/reuseable_button.dart';

import '../../shared_components/routes/routes_name.dart';
import '../../view_model/services/splash_services.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  SplashServices services = SplashServices();
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: EdgeInsets.zero,
      bottom: false,
      child: Scaffold(
        body: Container(
            width: double.infinity.w,
            height: double.infinity.h,
            color: const Color(0xffFAFAFA),
            child: Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity.w,
                    height: 300.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/splash_logo.png"))),
                  ),
                  Text(
                    'What You',
                    style: GoogleFonts.mulish(
                      fontSize: 38.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cook',
                        style: GoogleFonts.mulish(
                          fontSize: 38.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFFDF33),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Today',
                        style: GoogleFonts.mulish(
                          fontSize: 38.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ReusableButton(
                    title: 'Login',
                    onPress: () {
                      Navigator.pushNamed(
                          context, RouteName.loginScreen);
                    },
                    color: const Color(0xffFFDF33),
                    textColor: const Color(0xff2F2F37),
                    width: 247.w,
                    height: 57.h,
                    radius: 8.r,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ReusableButton(
                    title: 'Signup',
                    onPress: () {
                      Navigator.pushNamed(context, RouteName.signupScreen);
                    },
                    color: const Color(0xffFFDF33),
                    textColor: const Color(0xff2F2F37),
                    width: 247.w,
                    height: 57.h,
                    radius: 8.r,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
