import 'dart:io';

import 'package:etr/dialogs/dialog_forgot_password.dart';
import 'package:etr/dialogs/dialog_forgot_password_message.dart';
import 'package:etr/items/logo_item.dart';
import 'package:etr/module/user.dart';
import 'package:etr/screens/select_type_account_screen.dart';
import 'package:etr/utils/NavigationService.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/enums.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/scroll_column_expandable.dart';
import 'package:etr/utils/storage.dart';
import 'package:etr/utils/web_service/dio_helper.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/custom_widget/my_text_faild.dart';
import '../utils/global_widget/widget_parent/widget_for_auth_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController()..text = '';

  TextEditingController password = TextEditingController()..text = '';

  GlobalKey<FormState> ky = GlobalKey();

  fetchApi() async {
    if (!ky.currentState.validate()) return;
    //print(getToken()) ;
    getObjData(apiLogin, dioType: DioType.post, withLoader: true,key: 'user', data: {
      'email': email.text,
      'password': password.text,
      'fcm_token': getToken(),
      'device_type': Platform.isIOS ? 1 : 0,
    }, fun: (json) {
      return User.fromJson(json);
    }, onSuccess: (val) {
      setUser(val);
      goHome(NavigationService.navigatorKey.currentContext, isFirst: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(''),
      body: Form(
        key: ky,
        child: ScrollColumnExpandable(
          children: [
            Container(
                width: double.infinity,
                color: fPrimaryColor,
                padding: EdgeInsets.only(
                  bottom: 50.h,
                ),
                child: const Center(child: ItemLogo())),
            const Spacer(),
            // myImage('logo',height: 150.w,width: 150.w),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 30.w),
                  Align(
                    child: myText('Sign_In'.t,
                        color: fPrimaryColor, fontSize: 20.sp),
                    alignment: AlignmentDirectional.centerStart,
                  ),
                  SizedBox(height: 10.w),
                  MyTextFailed(
                    controller: email,
                    icon: svgImage('person_icon', color: fPrimaryColor),
                    textInputType: TextInputType.emailAddress,
                    hint: 'Email'.t,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyTextFailed(
                    controller: password,
                    icon: svgImage('lock_icon'),
                    hint: 'Password'.t,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  SizedBox(
                    height: 50.h,
                  ),
                  DefaultButton(
                    text: 'Sign_In'.t,
                    isExpanded: false,
                    onPressed: () {
                      fetchApi();
                    },
                  ),
                  // const Spacer(),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                     // bottomSheet(context: context, child: DialogForgotPassword());
                      bottomSheet(context: context, child: DialogForgotPasswordMessage());
                      // To(context, ForgotPassword());
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 10.w),
                      child: myText('forgot_password'.t,
                          color: fPrimaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Wrap(
                    children: [
                      myText('Don_have_an_account'.t, color: fPrimaryColor),
                      SizedBox(
                        width: 5.w,
                      ),
                      InkWell(
                          onTap: () {
                             To(context, const SelectTypeAccount());
                          },
                          child: myText('Sign_Up'.t, color: fRed)),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
