import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_you_cook_today/shared_components/widgets/reuseable_button.dart';

import '../../shared_components/routes/routes_name.dart';
import '../../shared_components/widgets/back_button.dart';
import '../../shared_components/widgets/text_from_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  final emailFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        minimum: EdgeInsets.zero,
        bottom: false,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                SizedBox(
                  width: 260.w,
                  height: 42.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButtons(onPress: () {
                        Navigator.pop(context);
                      }),
                      Text(
                        'Forgot Password',
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: const Color(0xff2F2F37),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                      child: Column(
                        children: [
                          InputTextField(
                            myController: emailController,
                            focusNode: emailFocusNode,
                            onFieldSubmittedValue: (value) {},
                            hint: 'Enter your email',
                            keyBoardType: TextInputType.emailAddress,
                            obscureText: false,
                            onValidator: (value) {
                              return value.isEmpty
                                  ? 'Enter email address'
                                  : null;
                            },
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: ReusableButton(
                    title: 'Login',
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                          context,
                          RouteName.homeScreen,
                        );
                      }
                    },
                    color: const Color(0xffFFDF33),
                    textColor: const Color(0xff2F2F37),
                    width: 247.w,
                    height: 57.h,
                    radius: 8.r,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
