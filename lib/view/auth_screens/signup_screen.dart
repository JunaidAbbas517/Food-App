import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:what_you_cook_today/shared_components/widgets/reuseable_button.dart';
import 'package:what_you_cook_today/view/auth_screens/verify_screen.dart';

import '../../model/userModel.dart';
import '../../shared_components/routes/routes_name.dart';
import '../../shared_components/utils.dart';
import '../../shared_components/widgets/text_from_field.dart';
import '../../view_model/providers/auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final phoneNoFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  var provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<UserAuth>(context, listen: false);
  }

  // @override
  void dispose() {
    // TODO: implement dispose
    obscurePassword.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    firstNameController.dispose();
    firstNameFocusNode.dispose();
    lastNameController.dispose();
    lastNameFocusNode.dispose();
    phoneNoController.dispose();
    phoneNoController.dispose();
    addressController.dispose();
    addressController.dispose();
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
                    height: 80.h,
                  ),
                  Text(
                    'Welcome to Registration Screen',
                    style: GoogleFonts.mulish(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                        child: Consumer<UserAuth>(builder: (_, userAuth, __) {
                          return Column(
                            children: [
                              InputTextField(
                                myController: firstNameController,
                                focusNode: firstNameFocusNode,
                                onFieldSubmittedValue: (value) {
                                  Utils.fieldFocus(context, firstNameFocusNode,
                                      lastNameFocusNode);
                                },
                                hint: 'Enter first name',
                                keyBoardType: TextInputType.name,
                                obscureText: false,
                                onValidator: (value) {
                                  return value.isEmpty
                                      ? 'Enter first name'
                                      : null;
                                },
                              ),
                              InputTextField(
                                myController: lastNameController,
                                focusNode: lastNameFocusNode,
                                onFieldSubmittedValue: (value) {
                                  Utils.fieldFocus(context, lastNameFocusNode,
                                      phoneNoFocusNode);
                                },
                                hint: 'Enter last name',
                                keyBoardType: TextInputType.name,
                                obscureText: false,
                                onValidator: (value) {
                                  return value.isEmpty
                                      ? 'Enter last name'
                                      : null;
                                },
                              ),
                              InputTextField(
                                myController: phoneNoController,
                                focusNode: phoneNoFocusNode,
                                onFieldSubmittedValue: (value) {
                                  Utils.fieldFocus(context, phoneNoFocusNode,
                                      emailFocusNode);
                                },
                                hint: 'Enter phone number',
                                keyBoardType: TextInputType.number,
                                obscureText: false,
                                onValidator: (value) {
                                  return value.isEmpty
                                      ? 'Enter phone number'
                                      : null;
                                },
                              ),
                              InputTextField(
                                myController: emailController,
                                focusNode: emailFocusNode,
                                onFieldSubmittedValue: (value) {
                                  Utils.fieldFocus(context, emailFocusNode,
                                      addressFocusNode);
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
                              InputTextField(
                                myController: addressController,
                                focusNode: addressFocusNode,
                                onFieldSubmittedValue: (value) {
                                  Utils.fieldFocus(context, addressFocusNode,
                                      passwordFocusNode);
                                },
                                hint: 'Enter your address',
                                keyBoardType: TextInputType.streetAddress,
                                obscureText: false,
                                onValidator: (value) {
                                  return value.isEmpty
                                      ? 'Enter your address'
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
                            ],
                          );
                        }),
                      )),
                  ReusableButton(
                    title: 'SignUp',
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        // registerWithEmailAndPassword(
                        //     emailController.text, passwordController.text);
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteName.homeScreen,
                        // );

                        try {
                          provider.signUpDataProvider(
                            context,
                            firstName : firstNameController.text ,
                            lastName:lastNameController.text,
                            email: emailController.text,
                            contact: phoneNoController.text,
                            password: passwordController.text,
                            address:addressController.text,
                          );
                          setState(() {});
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Server Error'),
                          ));
                          setState(() {
                            provider.signupModelLoading = false;
                          });
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
                      Navigator.pushNamed(context, RouteName.loginScreen);
                    },
                    child: Text.rich(TextSpan(
                        text: "Already have an account?  ",
                        style: GoogleFonts.mulish(
                          fontSize: 15.sp,
                        ),
                        children: [
                          TextSpan(
                            text: 'Log In',
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

  // Future<void> registerWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _auth
  //         .createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     )
  //         .then((value) async {
  //       User? user = _auth.currentUser;
  //       // for firestore
  //
  //       UserModel userModel = UserModel();
  //       userModel.email = user!.email;
  //       userModel.uid = user.uid;
  //       userModel.firstName = firstNameController.text;
  //       userModel.lastName = lastNameController.text;
  //       userModel.password = passwordController.text;
  //       userModel.contact = phoneNoController.text;
  //       userModel.address = addressController.text;
  //       userModel.status = 'pending';
  //       print('user $user');
  //       try {
  //         final CollectionReference userCollection =
  //             FirebaseFirestore.instance.collection('new user');
  //
  //         // save data in firestore
  //         await userCollection
  //             .doc(user.uid)
  //             .set(userModel.toMap())
  //             .then((value) async {
  //           // final prefs = await SharedPreferences.getInstance();
  //
  //           // save data in realtime
  //
  //           Navigator.pushAndRemoveUntil(
  //               (context),
  //               MaterialPageRoute(builder: (context) => VerifyScreen()),
  //               (route) => false);
  //           // await prefs.setString('email', user.uid);
  //         });
  //         Fluttertoast.showToast(msg: "Account created sucessfully");
  //       } on FirebaseAuthException catch (e) {
  //         Fluttertoast.showToast(msg: e.toString());
  //       }
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
