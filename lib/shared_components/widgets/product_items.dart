import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItems extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String mealReview;
  final double price;

  const ProductItems({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.mealReview,
    required this.price,
  }) : super(key: key);

  @override
  State<ProductItems> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {
  bool favouriteFood = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12.h, left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 130.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(widget.imageUrl)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.name,
            style: GoogleFonts.mulish(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff2F2F37)),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            widget.mealReview,
            style: GoogleFonts.mulish(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xffA0A0A6)),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 9.w),
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
                          text: widget.price.toString(),
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w700,
                              fontSize: 24.sp,
                              color: const Color(0xff2F2F37))),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16.w,
                  height: 15.h,
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
                      fit: BoxFit.fill,
                      color: favouriteFood != false
                          ? const Color(0xffFFDF33)
                          : null,
                      image: const AssetImage("assets/icons/like.png"),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
