import 'package:etr/module/exhibitors.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemPlace extends StatelessWidget {


  final Function() onSelect ;
 final bool isSelect ;
 final Space space ;
  const ItemPlace({Key key, this.isSelect, this.onSelect, this.space}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
        color:space.disabled==0? null:fWhite.withOpacity(0.7)
      ),
      decoration: BoxDecoration(
          color: fItemBackground,
        borderRadius: BorderRadius.circular(15.r),
        border:isSelect? Border.all(width: 1.w,color: fPrimaryColor):null
      ),
      child: InkWell(
        onTap:space.disabled==0? onSelect:null,
        child: Container(
          padding: EdgeInsets.all(10.w),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 10.h,bottom: 10.h,start: 20.w),
                  height: 15.w,
                  width: 15.w,
                  decoration: BoxDecoration(
                    color: isSelect?fPrimaryColor:fWhite,
                    border: Border.all(color: fDevider,width: 1),
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      myText('Place'.t,color: fTextLight),
                      SizedBox(width: 5.w),
                      myText(space.spaceNumber.toString(),),
                    ],
                  ),
                ),
                VerticalDivider(width: 5.w,thickness: 2,color: fTextLight),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myText('space'.t,color: fTextLight),
                      SizedBox(width: 5.w),
                      myText(space.spaceX.toString(),),
                      SizedBox(width: 3.w),
                      myText('x',),
                      SizedBox(width: 3.w),
                      myText(space.spaceY.toString(),),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 10.h,bottom: 10.h,end:  20.w),
                  height: 15.w,
                  width: 15.w,

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
