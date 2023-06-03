import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:what_you_cook_today/shared_components/utils.dart';
import 'package:what_you_cook_today/shared_components/widgets/reuseable_button.dart';
import 'package:what_you_cook_today/view/auth_screens/verify_screen.dart';
import 'package:what_you_cook_today/view/customers_screens/home_screen/home_screen.dart';

import '../../shared_components/routes/routes_name.dart';
import '../../shared_components/widgets/text_from_field.dart';
import '../../view_model/providers/auth_provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);
  final emailController = TextEditingController();

  final emailFocusNode = FocusNode();

  final passwordController = TextEditingController();

  final passwordFocusNode = FocusNode();

  var provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<UserAuth>(context, listen: false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    obscurePassword.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 259.w,
                    height: 210.h,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/splash_logo.png'),
                        )),
                  ),
                  Text(
                    'Welcome to login Screen',
                    style: GoogleFonts.mulish(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
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
                              onFieldSubmittedValue: (value) {
                                Utils.fieldFocus(
                                    context, emailFocusNode, passwordFocusNode);
                              },
                              hint: 'Enter your email',
                              keyBoardType: TextInputType.emailAddress,
                              obscureText: false,
                              onValidator: (value) {
                                return value.isEmpty
                                    ? 'Enter email address'
                                    : null;
                              },
                            ),
                            ValueListenableBuilder(
                              valueListenable: obscurePassword,
                              builder: (context, value, child) =>
                                  InputTextField(
                                myController: passwordController,
                                focusNode: passwordFocusNode,
                                onFieldSubmittedValue: (value) {},
                                hint: 'Enter your password',
                                keyBoardType: TextInputType.emailAddress,
                                obscureText: obscurePassword.value,
                                onValidator: (value) {
                                  return value.isEmpty
                                      ? 'Enter email password'
                                      : null;
                                },
                                suffixIcon: InkWell(
                                  onTap: () {
                                    obscurePassword.value =
                                        !obscurePassword.value;
                                  },
                                  child: obscurePassword.value
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: Colors.black54,
                                        )
                                      : const Icon(
                                          Icons.visibility_outlined,
                                          color: Colors.black54,
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.forgotPasswordScreen);
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forgot password',
                                  style: GoogleFonts.mulish(
                                    fontSize: 15.sp,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  ReusableButton(
                    title: 'Login',
                    onPress: () async {
                      if (_formKey.currentState!.validate()) {
                        User? user = await provider.signUserIn(
                            email: emailController.text,
                            password: passwordController.text,
                            context: context);
                        print('asdf $user');
                        if (user!.email == "admin@food.com") {
                          Navigator.pushNamed(
                            context,
                            RouteName.adminDashboardScreen,
                          );
                        } else if (user.email == emailController.text) {
                          var regularUser = await FirebaseFirestore.instance
                              .collection('regular user')
                              .doc(user.uid)
                              .get();
                          if (regularUser.exists) {
                            Navigator.pushAndRemoveUntil(
                                (context),
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                                (route) => false);
                          } else if (!regularUser.exists) {
                            Navigator.pushAndRemoveUntil(
                                (context),
                                MaterialPageRoute(
                                    builder: (context) => VerifyScreen(
                                          uid: user.uid,
                                        )),
                                (route) => false);
                          }
                        }
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
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.signupScreen);
                    },
                    child: Text.rich(TextSpan(
                        text: "Don't have an account?  ",
                        style: GoogleFonts.mulish(
                          fontSize: 15.sp,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: GoogleFonts.mulish(
                              fontSize: 15.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ])),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
