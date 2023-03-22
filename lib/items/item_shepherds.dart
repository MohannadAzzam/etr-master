import 'package:etr/module/social.dart';
import 'package:etr/module/sponsors.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemShepherds extends StatelessWidget {
 final Sponsor item ;
  const ItemShepherds({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      padding: EdgeInsets.all(10.w),
      // padding: EdgeInsets.all(8.r),
       margin: EdgeInsets.all(10.w),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: 100.w,
              width: 100.w,
              child: SvgPicture.network(item.sponsorPackge.image),
            ),
          ),
          SizedBox(height: 5.h),
          Center(child: myText(item.sponsorPackge.name)),
          SizedBox(height: 10.h),
          Row(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                height: 50.w,
                width: 50.w,
                decoration: BoxDecoration(
                  color: fItemBackground,
                  borderRadius: BorderRadius.circular(10.r)
                ),
               //padding: EdgeInsets.all(10.r),
                  child: imageNet(item.image)),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myText(item.name,fontSize: 20.sp),
                  SizedBox(height: 5.h),
                  myText(item.companyName,color: fTextColorLight)
                ],
              )
            ],
          ),
          SizedBox(height: 5.h),
          myText(item.mobile,icon: 'phone_icon',color: fPrimaryColor),
          SizedBox(height: 5.h),

          myText(item.email,icon: 'email_icon',color: fPrimaryColor),
          SizedBox(height: 5.h),
          myText(item.details,maxLine: 2),

          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [


              if(item.linkedin!=null) IconButton(onPressed: (){}, icon: svgImage('in_icon',color: fPrimaryColor)),
              if(item.twitter!=null) IconButton(onPressed: (){}, icon: svgImage('tweeter_icon',color: fPrimaryColor)),
              if(item.inesta!=null) IconButton(onPressed: (){}, icon: svgImage('insta_icon',color: fPrimaryColor)),
              if(item.facebook!=null) IconButton(onPressed: (){}, icon: svgImage('feacbook_icon',color: fPrimaryColor)),
          ],)
        ],
      ) ,
    );
  }
}
