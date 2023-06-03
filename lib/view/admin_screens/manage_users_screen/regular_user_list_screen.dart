import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../shared_components/routes/routes_name.dart';
import '../../../shared_components/widgets/back_button.dart';
import '../../../view_model/providers/user_list_provider.dart';

class RegularUserListScreen extends StatefulWidget {
  const RegularUserListScreen({Key? key}) : super(key: key);

  @override
  State<RegularUserListScreen> createState() => _RegularUserListScreenState();
}

class _RegularUserListScreenState extends State<RegularUserListScreen> {
  var provider;

  @override
  void initState() {
    provider = Provider.of<UserListProvider>(context, listen: false);
    provider.fetchRegularUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            SizedBox(
              height: 42.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtons(onPress: () {
                    Navigator.pushNamed(context, RouteName.approveRequestScreen,);
                  }),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Regular Users',
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: const Color(0xff2F2F37),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 42.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Flexible(
              child: Consumer<UserListProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return ListView.separated(
                      itemCount: value.regularUserList.length,
                      padding: EdgeInsets.only(bottom: 28.h, top: 10.h),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {

                        return Container(
                          // height: 60,
                          width: double.infinity.w,
                          padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${value.regularUserList[index].firstName} ${value.regularUserList[index].secondName}",
                                style: GoogleFonts.mulish(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                "${value.regularUserList[index].email}",
                                style: GoogleFonts.mulish(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                "Status: ${value.regularUserList[index].status}",
                                style: GoogleFonts.mulish(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 23.w);
                      },
                    );
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
