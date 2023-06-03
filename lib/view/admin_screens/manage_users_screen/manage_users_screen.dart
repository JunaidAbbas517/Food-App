import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared_components/routes/routes_name.dart';
import '../../../shared_components/widgets/admin_dashboard_item.dart';
import '../../../shared_components/widgets/back_button.dart';

class ManageUsersScreen extends StatefulWidget {
  const ManageUsersScreen({Key? key}) : super(key: key);

  @override
  State<ManageUsersScreen> createState() => _ManageUsersScreenState();
}

class _ManageUsersScreenState extends State<ManageUsersScreen> {
  final List<String> icon = [
    'assets/icons/approverequest.png',
    'assets/icons/approverequest.png',

  ];
  final List<String> cardName = [
    'New Users',
    'Regular Users',

  ];
  List<dynamic> routes = [
    RouteName.newUserScreen,
    RouteName.regularUserScreen,
  ];
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
                    Navigator.pushNamed(context, RouteName.adminDashboardScreen,);
                  }),

                  Expanded(
                    child: Center(
                      child: Text(
                        'Manage Users',
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: const Color(0xff2F2F37),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width:  42.w,),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Flexible(
              child: GridView.builder(
                itemCount: cardName.length,
                padding: EdgeInsets.only(
                  top: 5.h,
                  bottom: 5,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 3 / 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, routes[index]);
                    },
                    child: AdminDashBoardItem(
                      imagePath: icon[index].toString(),
                      text: cardName[index].toString(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
