import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_you_cook_today/shared_components/routes/routes_name.dart';
import 'package:what_you_cook_today/shared_components/widgets/reuseable_button.dart';

import '../../../shared_components/widgets/back_button.dart';
import '../../../shared_components/widgets/small_resueable_button.dart';

class DetailsFoodScreen extends StatefulWidget {
  dynamic data;
  DetailsFoodScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailsFoodScreen> createState() => _DetailsFoodScreenState();
}

class _DetailsFoodScreenState extends State<DetailsFoodScreen> {
  bool favouriteFood = false;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        minimum: EdgeInsets.zero,
        child: Scaffold(
          backgroundColor: const Color(0xfff5f5f5),
          body: SizedBox(
            height: double.infinity.h,
            width: double.infinity.w,
            child: SingleChildScrollView(
              child: Column(children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity.w,
                      height: 374.42.h,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.r),
                            bottomRight: Radius.circular(32.r),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(widget.data['imageUrl']),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                        top: 50.h,
                        left: 16.w,
                        child: BackButtons(
                          onPress: () {
                            Navigator.pop(context);
                          },
                        ))
                  ],
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.data['name'],
                        style: GoogleFonts.mulish(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff2F2F37),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 9.w),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (favouriteFood == true) {
                                favouriteFood = false;
                              } else if (favouriteFood != true) {
                                favouriteFood = true;
                              }
                            });
                          },
                          child: Image(
                            color: favouriteFood != false
                                ? const Color(0xffFFDF33)
                                : null,
                            image: const AssetImage("assets/icons/like.png"),
                            height: 22.h,
                            width: 24.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 37.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '\$',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                              color: const Color(0xff2F2F37)),
                          children: <TextSpan>[
                            TextSpan(
                                text: widget.data['price'],
                                style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24.sp,
                                    color: const Color(0xff2F2F37))),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SmallReusableButton(
                            onPress: () {
                              setState(() {
                                if (counter != 0) {
                                  counter = counter - 1;
                                }
                              });
                            },
                            height: 26,
                            width: 50,
                            radius: 8,
                            size: 20,
                            iconData: Icons.remove,
                            color: const Color(0xffCFCFCF),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "$counter",
                              style: GoogleFonts.mulish(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff2F2F37),
                              ),
                            ),
                          ),
                          SmallReusableButton(
                            onPress: () {
                              setState(() {
                                counter = counter + 1;
                              });
                            },
                            height: 26,
                            width: 50,
                            size: 20,
                            radius: 8,
                            iconData: Icons.add,
                            color: const Color(0xffCFCFCF),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 36.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: GoogleFonts.mulish(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff2F2F37),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        widget.data['description'],
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.mulish(
                          height: 2.2.h,
                          letterSpacing: 0.6.sp,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff656572),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          bottomNavigationBar: Container(
            width: double.infinity.w,
            height: 109.h,
            decoration: BoxDecoration(
              color: const Color(0xfff5f5f5),
              boxShadow: [
                BoxShadow(
                    color: const Color(0x11000f0f),
                    offset: Offset(0, -6.h),
                    spreadRadius: 0,
                    blurRadius: 16.sp)
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 28.h,
                bottom: 24.h,
                right: 16.w,
                left: 16.w,
              ),
              child: Row(children: [
                Column(
                  children: [
                    Text(
                      "Total Price",
                      style: GoogleFonts.mulish(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff2F2F37),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    RichText(
                      text: TextSpan(
                        text: '\$',
                        style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp,
                            color: const Color(0xff2F2F37)),
                        children: <TextSpan>[
                          TextSpan(
                              text: widget.data['price'],
                              style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.sp,
                                  color: const Color(0xff2F2F37))),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 28.h,
                ),
                Expanded(
                  child: ReusableButton(
                    title: "Add to Card",
                    onPress: () {
                      Navigator.pushNamed(context, RouteName.cardScreen);
                    },
                    color: const Color(0xffFFDF33),
                    textColor: const Color(0xff2F2F37),
                    width: double.infinity.w,
                    height: 57.h,
                    radius: 8.4,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
