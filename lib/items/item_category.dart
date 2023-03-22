import 'package:etr/module/drawer_menu.dart';
import 'package:etr/screens/TravelHotelsScreen.dart';
import 'package:etr/screens/blog_screen.dart';
import 'package:etr/screens/exhibitors_screen.dart';
import 'package:etr/screens/info_screen.dart';
import 'package:etr/screens/sponsors_screen.dart';
import 'package:etr/screens/tickets_screen.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCategory extends StatelessWidget {
 final DrawerMenu drawerMenu ;
  const ItemCategory({Key key, this.drawerMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:drawerMenu.onTab,
      child: Container(
        width: ScreenUtil().screenWidth*0.3,
        margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        decoration: BoxDecoration(
            color: fWhite,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: boxShadow()
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: const BoxDecoration(
                  color: fSecondaryColor,
                  shape: BoxShape.circle
                ),
                child: svgImage(drawerMenu.icon,color: fWhite),width: 40.w,height: 40.w,),
              SizedBox(height: 5.h),
              Text(
                drawerMenu.name??'-',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(color: fSecondaryColor ,fontSize: 16.sp,height: 1.2),
              )
              //myText(drawerMenu.name,)
            ],
          ),
        ),
      ),
    );
  }
}
