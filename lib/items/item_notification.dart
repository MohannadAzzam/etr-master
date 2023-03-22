import 'package:etr/module/my_notifications.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ItemNotifications extends StatelessWidget {
  final MyNotifications myNotifications ;
  const ItemNotifications({Key key, this.myNotifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        switch(myNotifications.messagType.toString()){
          case 'order':
           // To(context, OrderDetailsScreen(id: myNotifications.orderId,)) ;
            break ;
          case 'offer':
           // To(context, OrderDetailsScreen(id: myNotifications.orderId,)) ;

            break ;

        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: fWhite,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: boxShadow()
        ),
        margin: EdgeInsets.all(15.r).copyWith(bottom: 0),
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 25.h),
        child: Row(
          children: [
            Expanded(child: myText(myNotifications.message,fontSize: 18.sp)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                myText(formatDate(myNotifications.createdAt.toLocal(), withDate: false)),
              //  myText(formatDate(myNotifications.createdAt.toLocal(), withTime: false)),

              ],
            )
          ],
        ),
      ),
    );
  }
}
