import 'package:flutter/material.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
  ButtonStyle  elevatedButtonStyle ({Color color = fPrimaryColor,double radius})=> ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: color,
  elevation: 0,
  minimumSize: Size(88.w, 40.h),
  textStyle: const TextStyle(color: Colors.white , fontFamily: 'Cairo'),
  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 5.h ),
  shape:  RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(radius??10.r)),
  ),
);
ButtonStyle  elevatedOutLinButtonStyle ({Color color = fPrimaryColor,double radius})=> OutlinedButton.styleFrom(
  //onPrimary: Colors.white,
  primary: color,
  elevation: 0,
  side: BorderSide(color: fSecondaryColor,width: 1),
  minimumSize: Size(88.w, 40.h),
  textStyle: const TextStyle(color: Colors.white , fontFamily: 'Cairo'),
  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 5.h ),

  shape:  RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(radius??16.r)),

  ),
);
TextStyle defaultTextStyleWithShadow() =>
    TextStyle(fontSize: 25.sp,
      color: fSecondaryColor,
      fontWeight: FontWeight.w500,
      shadows:  [
        Shadow(
          blurRadius: 5.0,
          color: Colors.black,
          offset: Offset(2.0, 2.0),
        ),]
      ,
    );
TextStyle defaultTextStyle() =>
    TextStyle(fontSize: 25.sp,
      color: fSecondaryColor,
      fontWeight: FontWeight.w500,
    );

TextStyle defaultTextStyleHint() =>
    TextStyle(fontSize: 18.sp,
      color: fSecondaryColor,
      fontWeight:FontWeight.w600,
        fontFamily: 'Cairo'
    );
