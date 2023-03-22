import 'package:etr/module/social.dart';
import 'package:etr/module/ticket.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemTicket extends StatelessWidget {
 final Ticket ticket ;
  const ItemTicket({Key key, this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(8.r),
       margin: EdgeInsets.all(10.w),
      child:Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: fItemBackground,
              borderRadius: BorderRadius.circular(10.r)
            ),
            padding: EdgeInsets.all(10.r),
              child: svgImage('ticket_icon',size: 30.r,color: fPrimaryColor)),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myText(ticket.name,fontSize: 20.sp),
              SizedBox(height: 5.h),
              myText(formatDate(ticket.createdAt.toLocal()),color: fTextColorLight)
            ],
          )
        ],
      ) ,
    );
  }
}
