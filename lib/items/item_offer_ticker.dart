import 'package:etr/module/tickets.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemOfferTicket extends StatelessWidget {
  final EventEvent item  ;
  const ItemOfferTicket({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     //
     // height: ScreenUtil().screenHeight*0.47,
      width: ScreenUtil().screenWidth*0.5,
      margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),


      child: Stack(
        fit: StackFit.loose,
        children: [

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: fWhite,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: boxShadow()
            ),
            margin: EdgeInsets.only(top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myText(item.name,fontSize: 18.sp,fontWeight: FontWeight.w700),
                SizedBox(height: 5.h),
                myText(item.details ),

              ],
            ),
          ),
          PositionedDirectional(
            end: 0,

            child: Container(

              padding: EdgeInsets.all(10.w,),
              decoration: BoxDecoration(
                  color: fSecondaryColor,
                  shape: BoxShape.circle
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  myText(getTime(item.time),color: fWhite,fontWeight: FontWeight.w700),
                  myText(isEvening(item.time)?'PM':'AM',color: fWhite,fontSize: 12.sp)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

 bool isEvening(String time){
   int hour = int.parse(time.substring(0,time.indexOf(':')));
   return hour>12 ;
  }
  getTime(String time){

   String min =   time.substring(0,time.lastIndexOf(':'));
   return min ;
  }
}
