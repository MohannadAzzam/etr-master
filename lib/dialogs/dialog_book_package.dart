
import 'package:etr/module/sponsors.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/custom_widget/my_text_faild.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DialogBookPackage extends StatelessWidget {

  final SponsorPackge item ;

  const DialogBookPackage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: AlignmentDirectional.centerEnd,
                child: CloseButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            SvgPicture.network(item.image),
           // svgImage('image_message_forgot_password'),
            SizedBox(height: 30.h),
            myText(item.name, fontSize: 20.sp,color: fBlack),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myText('You_have_chosen'.t, fontSize: 16.sp,color: fTextColorLight),
                SizedBox(width: 3.w),
                myText(item.name, fontSize: 16.sp,color: fTextColorLight),
              ],
            ),

            SizedBox(height: 30.h),
            DefaultButton(
              onPressed: () {Navigator.pop(context,);},
              text: 'Booking'.t,
              isExpanded: false,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
