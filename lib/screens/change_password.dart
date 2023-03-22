import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/custom_widget/my_text_faild.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/scroll_column_expandable.dart';
import 'package:etr/utils/web_service/dio_helper.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  fetchApi() async {
    if (!key.currentState.validate()) return;
    bool status = await apiAction(
      apiChangePassword,
      withLoader: true,
      withShowSuccess: true,
      data: {
        'old_password': oldPassword.text,
        'password': newPassword.text,
        'confirm_password': confirmPassword.text,
      },
    );
    if (status) {
      Navigator.pop(context);
    }
  }

  GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(''),
      body: ScrollColumnExpandable(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 40.h),
            color: fPrimaryColor,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(30.r),
                    margin: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: fWhite, width: 1),
                        shape: BoxShape.circle),
                    child: svgImage('person_icon', size: 30.r, color: fWhite),
                  ),
                  myText('changePassword'.t, color: fWhite),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 20.h),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Form(
                    key: key,
                    child: Column(
                      children: [
                        MyTextFailed(
                          hint: 'Your_old_Password'.t,
                          controller: oldPassword,
                          isPassword: true,
                          withTitle: false,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        MyTextFailed(
                          hint: 'New_Password'.t,
                          controller: newPassword,
                          isPassword: true,
                          withTitle: false,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        MyTextFailed(
                          hint: 'Confirm_Password'.t,
                          controller: confirmPassword,
                          withTitle: false,
                          isPassword: true,
                          textInputType: TextInputType.visiblePassword,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 40.h,
                ),
                DefaultButton(
                  onPressed: () {
                    fetchApi();
                  },
                  text: 'Save'.t,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
