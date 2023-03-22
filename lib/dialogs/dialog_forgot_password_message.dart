
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/custom_widget/my_text_faild.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogForgotPasswordMessage extends StatelessWidget {


  const DialogForgotPasswordMessage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(

        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            svgImage('image_message_forgot_password'),
            SizedBox(height: 30.h),
            myText('forgot_password'.t, fontSize: 20.sp,color: fBlack),
            SizedBox(height: 10.h),
            myText('messageForgotPassword'.t, fontSize: 16.sp,color: fTextColorLight),

            SizedBox(height: 30.h),
            DefaultButton(
              onPressed: () {Navigator.pop(context,);},
              text: 'Login',
              isExpanded: false,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
