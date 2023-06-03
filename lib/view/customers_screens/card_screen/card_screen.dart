import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:what_you_cook_today/shared_components/routes/routes_name.dart';
import 'package:what_you_cook_today/shared_components/widgets/back_button.dart';

import '../../../shared_components/widgets/reuseable_button.dart';
import '../../../shared_components/widgets/small_resueable_button.dart';
import '../../../view_model/card_view_model/card_view_model.dart';


class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CardViewModel(),
      child: Consumer<CardViewModel>(
        builder: (context, provider, child) => SafeArea(
          top: false,
          bottom: false,
          minimum: EdgeInsets.zero,
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
                    height: 32.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 111.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFDF33),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Location',
                                style: GoogleFonts.mulish(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              SizedBox(
                                width: 239.w,
                                height: 38.h,
                                child: Text(
                                  'Jl. Dressrosa No.66, Kec. Apiraksa, Kota Bandung, Jawa Barat, Khomar area dmabudas',
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.showAddressDialog(context);
                            },
                            child: Container(
                              width: 46.w,
                              height: 46.h,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/icons/edit.png'),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 19.h),
                      itemCount: 10,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: const EdgeInsets.all(0.0),
                        leading: Container(
                          width: 50.w,
                          height: 51.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1543738066-49621e5b1f87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHRyYWRpdGlvbmFsJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                              )),
                        ),
                        title: RichText(
                          text: TextSpan(
                            text: '\$',
                            style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                color: const Color(0xff2F2F37)),
                            children: <TextSpan>[
                              TextSpan(
                                text: '2.5',
                                style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.sp,
                                  color: const Color(0xff2F2F37),
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          'Cheese Burger',
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SmallReusableButton(
                              width: 32,
                              height: 16,
                              radius: 4,
                              iconData: Icons.remove,
                              size: 13,
                              color: const Color(0xffE0E0E0),
                              onPress: () {
                                setState(() {
                                  if (counter != 0) {
                                    counter--;
                                  }
                                });
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Text(
                                "$counter",
                                style: GoogleFonts.mulish(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff2F2F37),
                                ),
                              ),
                            ),
                            SmallReusableButton(
                              width: 32,
                              height: 16,
                              radius: 4,
                              iconData: Icons.add,
                              size: 13,
                              color: const Color(0xffE0E0E0),
                              onPress: () {
                                setState(() {
                                  counter = counter + 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
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
                        'result for 7 order',
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
                              text: '8.5',
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
                      title: 'Checkout Order',
                      onPress: () {
                        Navigator.pushNamed(context, RouteName.checkOutScreen);
                      },
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
          ),
        ),
      ),
    );
  }
}
