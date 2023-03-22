import 'dart:io';

import 'package:etr/dialogs/dialog_choose_country.dart';
import 'package:etr/module/settings.dart';
import 'package:etr/module/user.dart';
import 'package:etr/screens/verifi_screen.dart';
import 'package:etr/utils/NavigationService.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/custom_widget/my_text_faild.dart';
import 'package:etr/utils/enums.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/scroll_column_expandable.dart';
import 'package:etr/utils/storage.dart';
import 'package:etr/utils/web_service/dio_helper.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  final int type ;
  const SignUpScreen({Key key, this.type}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController() ;
  TextEditingController email = TextEditingController() ;
  TextEditingController mobile = TextEditingController() ;
  TextEditingController country = TextEditingController() ;
  TextEditingController password = TextEditingController() ;
  TextEditingController confirmPassword = TextEditingController() ;
  GlobalKey<FormState> ky = GlobalKey();
  fetchApi() async {
    if (!ky.currentState.validate()) return;
    //print(getToken()) ;
  //  required   1=user 2=exhibitions  3= sponsors
    getObjData(apiSignUp, dioType: DioType.post, withLoader: true, data: {
      'name': name.text,
      'email': email.text,
      'mobile': mobile.text,
      'country': countryObg.id,
      'password': password.text,
      'confirm_password': password.text,
      'fcm_token': getToken(),
      'type_mobile': Platform.isIOS ? 1 : 0,
      'type': widget.type,
    }, fun: (json) {
      return User.fromJson(json);
    }, onSuccess: (val) {
     // setUser(val);
      To(context, VerifiScreen(email.text));
     // goHome(NavigationService.navigatorKey.currentContext, isFirst: true);
    });
  }
  Country countryObg ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(''),
      body: ScrollColumnExpandable(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 40.h),
            color: fPrimaryColor,
            child:  Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(30.r),
                    margin: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: fWhite,width: 1),
                        shape: BoxShape.circle
                    ),
                    child:svgImage('person_icon',size: 30.r,color: fWhite) ,
                  ),
                  myText(widget.type==1?'Create_visitor_account'.t:widget.type==2?'Create_viewer_account'.t:'Create_sponsor_account'.t,color: fWhite),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 20.h),
            child: Form(
              key: ky,
              child: Column(
                children: [
                  MyTextFailed(
                    marginTop: 10.h,

                    controller: name,
                    icon: svgImage('person_icon', color: fPrimaryColor),
                    //textInputType: TextInputType.emailAddress,
                    hint: 'Name'.t,
                  ),
                  MyTextFailed(
                    marginTop: 10.h,

                    controller: email,
                    icon: svgImage('email_icon', color: fPrimaryColor),
                    textInputType: TextInputType.emailAddress,
                    hint: 'Email'.t,
                  ),
                  MyTextFailed(
                    marginTop: 10.h,
                    isMobile: true,
                    controller: mobile,
                    icon: svgImage('phone_icon', color: fPrimaryColor),
                    textInputType: TextInputType.number,
                    hint: 'MobileNO'.t,
                  ),
                  MyTextFailed(
                    onTap: () async {
                   Country c = await showCustomDialog(context, DialogChooseCountry(title:'country'.t ,));
                   if(c!=null){
                     country.text = c.name;
                     countryObg = c ;
                   }
                    },
                    marginTop: 10.h,

                    controller: country,
                    icon: svgImage('location_icon', color: fPrimaryColor),
                    //textInputType: TextInputType.emailAddress,
                    hint: 'country'.t,
                  ),
                  MyTextFailed(
                    marginTop: 10.h,

                    controller: password,
                    icon: svgImage('lock_icon', color: fPrimaryColor),
                    //textInputType: TextInputType.emailAddress,
                    hint: 'Password'.t,
                  ),
                  MyTextFailed(
                    marginTop: 10.h,
                    controller: confirmPassword,
                    icon: svgImage('lock_icon', color: fPrimaryColor),
                    //textInputType: TextInputType.emailAddress,
                    hint: 'Confirm_Password'.t,
                  ),
                  SizedBox(height: 20.h),
                  DefaultButton(onPressed: (){fetchApi();}, text: 'Sign_Up'.t,isExpanded: false,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
