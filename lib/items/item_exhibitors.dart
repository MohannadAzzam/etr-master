import 'package:etr/module/exhibitors.dart';
import 'package:etr/module/social.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemExhibitors extends StatelessWidget {
  final Exhibition item ;
  const ItemExhibitors({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: boxDecoration,
      // padding: EdgeInsets.all(10.w),
      // // padding: EdgeInsets.all(8.r),
      //  margin: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 70.w,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                imageNet(item.coverImage),
                Center(
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: 50.w,
                      width: 50.w,
                      decoration: const BoxDecoration(
                          color: fItemBackground,
                          shape: BoxShape.circle,
                         // borderRadius: BorderRadius.circular(10.r)
                          ),
                      //padding: EdgeInsets.all(10.r),
                      child: imageNet(item.image)),
                ),
                PositionedDirectional(
                  end: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: fWhite.withOpacity(0.7),
                      borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(20.r),
                          topStart: Radius.circular(0.r),
                          bottomStart: Radius.circular(10.r),
                          bottomEnd: Radius.circular(0.r),
                      )
                    ),
                    padding: EdgeInsets.all(5.w),
                    margin: EdgeInsets.all(5.w),
                    child: Column(
                      children: [
                        myText('Place'.t,fontSize: 14.sp),
                        myText(item.space?.spaceNumber?.toString(),color: fSecondaryColor,fontWeight: FontWeight.w900,fontSize: 18.sp),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  myText(item.companyName),
                  SizedBox(height: 5.h),
                  myText(item.mobile, icon: 'phone_icon', color: fPrimaryColor,fontSize: 12.sp),
                  myText(item.email, icon: 'email_icon', color: fPrimaryColor,fontSize: 12.sp),
                  SizedBox(height: 5.h),
                  myText(item.details, maxLine: 2),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if(item.linkedin!=null)
              IconButton(
                onPressed: () {},
                icon: svgImage('in_icon', color: fPrimaryColor),
                padding: EdgeInsets.all(3.w),
                constraints: const BoxConstraints(),
              ),
              if(item.twitter!=null)
              IconButton(
                  onPressed: () {},
                  icon: svgImage('tweeter_icon', color: fPrimaryColor),
                  padding: EdgeInsets.all(3.w),
                  constraints: const BoxConstraints()),
              if(item.inesta!=null)
              IconButton(
                  onPressed: () {},
                  icon: svgImage('insta_icon', color: fPrimaryColor),
                  padding: EdgeInsets.all(3.w),
                  constraints: const BoxConstraints()),
              if(item.facebook!=null)
              IconButton(
                  onPressed: () {},
                  icon: svgImage('feacbook_icon', color: fPrimaryColor),
                  padding: EdgeInsets.all(3.w),
                  constraints: const BoxConstraints()),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
