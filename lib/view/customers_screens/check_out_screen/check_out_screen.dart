import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_you_cook_today/shared_components/widgets/text_from_field.dart';

import '../../../shared_components/widgets/back_button.dart';
import '../../../shared_components/widgets/reuseable_button.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  TextEditingController noteController = TextEditingController();
  final noteFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    noteController.dispose();
    noteFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            SizedBox(
              width: 216.w,
              height: 42.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtons(onPress: () {
                    Navigator.pop(context);
                  }),
                  Text(
                    'My Order',
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
              height: 47.h,
            ),
            Text(
              'Customer Information',
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: const Color(0xff2F2F37),
              ),
            ),
            SizedBox(
              height: 17.h,
            ),
            Text(
              'Junaid Abbas',
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: const Color(0xff96969C),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 282.w,
              height: 42.h,
              child: Text(
                'Jl. Dressrosa No.66, Kec. Apiraksa, Kota Bandung, Jawa Barat, indonesia',
                style: GoogleFonts.mulish(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: const Color(0xff96969C),
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            InputTextField(
              myController: noteController,
              focusNode: noteFocusNode,
              maxLine: 4,
              onFieldSubmittedValue: (value) {},
              hint: 'Note...',
              keyBoardType: TextInputType.text,
              obscureText: false,
              onValidator: (value) {},
            ),
            SizedBox(
              height: 28.h,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 17),
        child: SizedBox(
          width: double.infinity.w,
          height: 137.h,
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                title: Text(
                  'Total',
                  style: GoogleFonts.mulish(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: Text(
                  'result for 5 order',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: const Color(0xffA0A0A6)),
                ),
                trailing: RichText(
                  text: TextSpan(
                    text: '\$',
                    style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: const Color(0xff2F2F37)),
                    children: <TextSpan>[
                      TextSpan(
                        text: '16.2',
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w700,
                          fontSize: 30.sp,
                          color: const Color(0xff2F2F37),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ReusableButton(
                title: 'Buy Now',
                onPress: () {},
                color: const Color(0xffFFDF33),
                textColor: const Color(0xff2F2F37),
                width: double.infinity.w,
                height: 57.h,
                radius: 8.r,
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
