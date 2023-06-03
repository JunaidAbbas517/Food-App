import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:what_you_cook_today/shared_components/routes/routes_name.dart';
import 'package:what_you_cook_today/shared_components/widgets/product_items.dart';
import 'package:what_you_cook_today/view_model/providers/product_provider.dart';

import '../../../shared_components/widgets/text_from_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  int selectedIndex = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context);
    return SafeArea(
      top: false,
      minimum: EdgeInsets.zero,
      bottom: false,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 60.h),
          child: SizedBox(
            width: double.infinity.w,
            height: double.infinity.h,
            // color: const Color(0xfff5f5f5),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 26.w,
                          height: 21.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/manu.png'),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.loginScreen);
                            },
                            child: const Icon(
                              Icons.exit_to_app,
                              color: Colors.black54,
                            ))
                      ]),
                  SizedBox(
                    height: 34.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Best Food',
                            style: GoogleFonts.mulish(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff2F2F37),
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            'For You Today',
                            style: GoogleFonts.mulish(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff2F2F37),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  InputTextField(
                    obscureText: false,
                    hint: 'Search...',
                    keyBoardType: TextInputType.text,
                    myController: searchController,
                    focusNode: searchFocusNode,
                    onFieldSubmittedValue: (newValue) {},
                    onValidator: (value) {},
                    prefixIcon: const Icon(Icons.search),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Flexible(
                    child: DefaultTabController(
                      length: 4,
                      child: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverAppBar(
                              // automaticallyImplyLeading: false,
                              // forceElevated: innerBoxIsScrolled,

                              toolbarHeight: 5.h,
                              collapsedHeight: 5.h,
                              expandedHeight: 5.h,

                              pinned: true,
                              primary: false,
                              titleSpacing: 0.h,
                              backgroundColor: const Color(0xfff5f5f5),
                              bottom: TabBar(
                                tabs: [
                                  Tab(
                                    child: FittedBox(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Text("Traditional"),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: FittedBox(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Text("Local"),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: FittedBox(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Text("Fast"),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: FittedBox(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                        ),
                                        child: Text("Special"),
                                      ),
                                    ),
                                  ),
                                ],
                                indicator: BoxDecoration(
                                  color: const Color(0xffFFDF33),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                padding: EdgeInsets.zero,
                                unselectedLabelColor: Colors.black54,
                                labelColor: Colors.black,
                                automaticIndicatorColorAdjustment: true,
                                enableFeedback: false,
                                indicatorColor: const Color(0xffFFDF33),
                                indicatorSize: TabBarIndicatorSize.tab,
                                labelPadding: EdgeInsets.zero,
                              ),
                            ),
                          ];
                        },
                        body: Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TabBarView(children: [
                            GridView.builder(
                              itemCount: products.traditionalFood.length,
                              padding: EdgeInsets.only(
                                top: 5.h,
                                bottom: 5,
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 16.h,
                                childAspectRatio: 2.h / 3.w,
                              ),
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.detailsFoodScreen,
                                      arguments: {
                                        'name': products
                                            .traditionalFood[index].name
                                            .toString(),
                                        'price': products
                                            .traditionalFood[index].price
                                            .toString(),
                                        'description': products
                                            .traditionalFood[index].description
                                            .toString(),
                                        'imageUrl': products
                                            .traditionalFood[index].imageUrl
                                            .toString(),
                                      });
                                },
                                child: ProductItems(
                                  imageUrl:
                                      products.traditionalFood[index].imageUrl,
                                  name: products.traditionalFood[index].name,
                                  mealReview: products
                                      .traditionalFood[index].mealReview,
                                  price: products.traditionalFood[index].price,
                                ),
                              ),
                            ),
                            GridView.builder(
                              itemCount: products.fastFood.length,
                              padding: EdgeInsets.only(
                                top: 5.h,
                                bottom: 5,
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 16.h,
                                childAspectRatio: 2.h / 3.w,
                              ),
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.detailsFoodScreen,
                                      arguments: {
                                        'name': products.fastFood[index].name
                                            .toString(),
                                        'price': products.fastFood[index].price
                                            .toString(),
                                        'description': products
                                            .fastFood[index].description
                                            .toString(),
                                        'imageUrl': products
                                            .fastFood[index].imageUrl
                                            .toString(),
                                      });
                                },
                                child: ProductItems(
                                  imageUrl: products.fastFood[index].imageUrl,
                                  name: products.fastFood[index].name,
                                  mealReview:
                                      products.fastFood[index].mealReview,
                                  price: products.fastFood[index].price,
                                ),
                              ),
                            ),
                            GridView.builder(
                              itemCount: products.localFood.length,
                              padding: EdgeInsets.only(
                                top: 5.h,
                                bottom: 5.h,
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 16.h,
                                childAspectRatio: 2.h / 3.w,
                              ),
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.detailsFoodScreen,
                                      arguments: {
                                        'name': products.localFood[index].name
                                            .toString(),
                                        'price': products.localFood[index].price
                                            .toString(),
                                        'description': products
                                            .localFood[index].description
                                            .toString(),
                                        'imageUrl': products
                                            .localFood[index].imageUrl
                                            .toString(),
                                      });
                                },
                                child: ProductItems(
                                  imageUrl: products.localFood[index].imageUrl,
                                  name: products.localFood[index].name,
                                  mealReview:
                                      products.localFood[index].mealReview,
                                  price: products.localFood[index].price,
                                ),
                              ),
                            ),
                            GridView.builder(
                              itemCount: products.specialOrder.length,
                              padding: EdgeInsets.only(
                                top: 5.h,
                                bottom: 5,
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 16.h,
                                childAspectRatio: 2.h / 3.w,
                              ),
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.detailsFoodScreen,
                                      arguments: {
                                        'name': products
                                            .specialOrder[index].name
                                            .toString(),
                                        'price': products
                                            .specialOrder[index].price
                                            .toString(),
                                        'description': products
                                            .specialOrder[index].description
                                            .toString(),
                                        'imageUrl': products
                                            .specialOrder[index].imageUrl
                                            .toString(),
                                      });
                                },
                                child: ProductItems(
                                  imageUrl:
                                      products.specialOrder[index].imageUrl,
                                  name: products.specialOrder[index].name,
                                  mealReview:
                                      products.specialOrder[index].mealReview,
                                  price: products.specialOrder[index].price,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
