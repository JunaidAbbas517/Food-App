import 'package:badges/badges.dart' as badges;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_you_cook_today/shared_components/widgets/admin_dashboard_item.dart';

import '../../../shared_components/routes/routes_name.dart';
import '../../auth_screens/login_screen.dart';

class AdminHomePageScreen extends StatefulWidget {
  const AdminHomePageScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomePageScreen> createState() => _AdminHomePageScreenState();
}

class _AdminHomePageScreenState extends State<AdminHomePageScreen> {
  final List<String> icon = [
    'assets/icons/approverequest.png',
    'assets/icons/addfood.png',
    'assets/icons/editfood.png',
    'assets/icons/checkorder.png',
  ];
  final List<String> cardName = [
    'Manage Users',
    'Add Food',
    'Edit Food',
    'Manage Orders',
  ];
  List<dynamic> routes = [
    RouteName.approveRequestScreen,
    RouteName.addFoodScreen,
    RouteName.editFoodScreen,
    RouteName.manageOrderScreen,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: EdgeInsets.zero,
      bottom: false,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Hello, ',
                      style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          color: const Color(0xff999999)),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Saima Aziz',
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                            color: const Color(0xff2F2F37),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 24.27.w,
                        height: 26.h,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/icons/settings.png'),
                        )),
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      badges.Badge(
                        showBadge: true,
                        ignorePointer: false,
                        position: badges.BadgePosition.custom(
                          start: 8,
                          bottom: 10,
                        ),
                        badgeContent: Text(
                          '0',
                          style: GoogleFonts.mulish(
                            fontSize: 8.sp,
                          ),
                        ),
                        badgeStyle: const badges.BadgeStyle(
                          badgeColor: Color(0xffFFDF33),
                        ),
                        child: Container(
                          width: 20.2.w,
                          height: 22.44.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage('assets/icons/notification.png'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      InkWell(
                        onTap: () async {
                          final FirebaseAuth _auth =
                              await FirebaseAuth.instance;
                          _auth.signOut();
                          Navigator.pushAndRemoveUntil(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => const LogInScreen()),
                              (route) => false);
                        },
                        child: Icon(
                          Icons.exit_to_app,
                          color: const Color(0xff033345),
                          size: 21.sp,
                        ),
                      )
                    ],
                  ),
                ],
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
      ),
    );
  }
}
