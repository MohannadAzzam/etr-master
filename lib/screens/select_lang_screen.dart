import 'package:etr/items/item_social.dart';
import 'package:etr/main.dart';
import 'package:etr/module/social.dart';
import 'package:etr/screens/sign_up_screen.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SelectLangAccount extends StatelessWidget {
  const SelectLangAccount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(''),
      body: Container(
        width: double.infinity,
        height: double.infinity,
       child: Stack(
         children: [
           Positioned.fill(child: svgImage('background_select_type',fit: BoxFit.fill)),
           Positioned(
             bottom:0 ,
               left: 50.w,
               right: 50.w,
               top:0,
               child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   const Spacer(flex: 1),
                   myText('Select_language'.t,color: fWhite,fontSize: 25.sp),
                   SizedBox(height: 20.h),
                   DefaultButton(onPressed: () async {
                     setLang('en');
                     final _newLocale = Locale('en', 'UK');
                     await context.setLocale(_newLocale);
                     RestartWidget.restartApp(context);
                   }, text: 'English'),

                   SizedBox(height: 10.h),
                   DefaultButton(onPressed: () async {
                     setLang('ar');
                     final _newLocale = Locale('ar', 'SA');
                     await context.setLocale(_newLocale);
                     RestartWidget.restartApp(context);
                   }, text: 'عربي'),

                   const Spacer(flex: 3),

                 ],
             
           ))
         ],
       ),
      ),
    );
  }

  buildItem(String image,String icon ,String title, {Function onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height:130.w,
        width: 180.w,
        margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
        // padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        decoration: BoxDecoration(
          //  color: fWhite,
            borderRadius: BorderRadius.circular(15.r),
           // boxShadow: boxShadow()
        ),
        child: Stack(

          children: [
             Positioned.fill(child: Image.asset(image,fit: BoxFit.cover,)),
             Container(color:coverColor.withOpacity(0.8)),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(15.r),
                    margin: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: fWhite,width: 1),
                        shape: BoxShape.circle
                    ),
                    child:svgImage(icon,size: 20.r,color: fWhite) ,
                  ),
                  myText(title,color: fWhite),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
