
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/custom_widget/my_text_faild.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogForgotPassword extends StatelessWidget {
  TextEditingController email;

  DialogForgotPassword({Key key}) : super(key: key) {
    email = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(

        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: AlignmentDirectional.centerEnd,
                child: CloseButton(
                  onPressed: () {},
                )),
            myText('forgot_password'.t, fontSize: 20.sp,color: fBlack),
            MyTextFailed(
              marginTop: 20.h,
              controller: email,
              icon: svgImage('person_icon', color: fPrimaryColor),
              textInputType: TextInputType.emailAddress,
              hint: 'Email'.t,
            ),
            SizedBox(height: 30.h),
            DefaultButton(
              onPressed: () {Navigator.pop(context,email.text);},
              text: 'send',
              isExpanded: false,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
