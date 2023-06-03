import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:what_you_cook_today/shared_components/widgets/reuseable_button.dart';
import 'package:what_you_cook_today/shared_components/widgets/text_from_field.dart';

class CardViewModel with ChangeNotifier {

  final TextEditingController addressController = TextEditingController();
  final addressFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    addressController.dispose();
    addressFocusNode.dispose();
    super.dispose();
  }

  Future<void> showAddressDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Your Address'),
        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputTextField(
                  obscureText: false,
                  hint: 'Add Address',
                  keyBoardType: TextInputType.text,
                  myController: addressController,
                  focusNode: addressFocusNode,
                  onFieldSubmittedValue: (newValue) {},
                  onValidator: (value) {},
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReusableButton(
                      title: 'Cancel',
                      onPress: () {
                        Navigator.pop(context);
                      },
                      color: const Color(0xffFFDF33),
                      textColor: const Color(0xff2F2F37),
                      width: 70.w,
                      height: 35.h,
                      radius: 8.r,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    ReusableButton(
                      title: 'Ok',
                      onPress: () {
                        Navigator.pop(context);
                      },
                      color: const Color(0xffFFDF33),
                      textColor: const Color(0xff2F2F37),
                      width: 70.w,
                      height: 35.h,
                      radius: 8.r,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
