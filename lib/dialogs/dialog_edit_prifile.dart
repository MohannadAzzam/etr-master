

import 'package:etr/screens/change_password.dart';
import 'package:etr/screens/edit_profile_screen.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/custom_widget/my_text_faild.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogEditProfile extends StatelessWidget {
  TextEditingController email;

  DialogEditProfile({Key key}) : super(key: key) {
    email = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,),
      child: Container(

        padding: EdgeInsets.all(20.r),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w).copyWith(top: 20.h),
              child: Column(
                children: [
                  DefaultButton(
                    onPressed: () async {
                     await To(context, const EditProfileScreen());
                     Navigator.pop(context);
                     },

                    text: 'edit_profile'.t,
                    icon: 'person_icon',
                   // isExpanded: false,
                  ),
                  SizedBox(height: 10.h),
                  DefaultButton(
                    onPressed: () async {
                      await To(context, const ChangePassword());
                      Navigator.pop(context);
                      },
                    text: 'changePassword'.t,
                    icon: 'lock_icon',
                    //isExpanded: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
