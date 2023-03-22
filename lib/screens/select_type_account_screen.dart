import 'package:etr/items/item_social.dart';
import 'package:etr/module/social.dart';
import 'package:etr/screens/sign_up_screen.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SelectTypeAccount extends StatelessWidget {
  const SelectTypeAccount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(''),
      body: Container(
        width: double.infinity,
        height: double.infinity,
       child: Stack(
         children: [
           svgImage('background_select_type',fit: BoxFit.fill),
           Positioned(
             bottom:0 ,
               left: 0,
               right: 0,
               top:0,
               child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   const Spacer(flex: 1),
                   myText('Choose_type_account'.t,color: fWhite,fontSize: 25.sp),
                   SizedBox(height: 20.h),
                   buildItem('assets/images/gest_image.png','person_icon','visitor_account'.t,onTap: (){
                   To(context, const SignUpScreen(type: 1,));
                   }),
                   SizedBox(height: 10.h),
                   buildItem('assets/images/casual_image.png','stor_icon','casual_account'.t,onTap: (){
                     To(context, const SignUpScreen(type: 2,));
                   }),
                   SizedBox(height: 10.h),
                   buildItem('assets/images/sponsor-image.png','medal_icon','sponsor_account'.t,onTap: (){
                     To(context, const SignUpScreen(type: 3,));

                   }),
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
