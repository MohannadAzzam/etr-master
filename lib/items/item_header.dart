import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemHeader extends StatelessWidget {
  final String title ;
  final String details ;
  final Function onTap ;
  const ItemHeader({Key key, this.title, this.details, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(15.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        //  myText(title,color: fPrimaryColor,fontSize: 20.sp),
          myText(details),
          SizedBox(height: 10.h),
          if(onTap!=null)
          Center(child: DefaultButton(onPressed: onTap, text: title??'Ticket_booking'.t,isExpanded: false,icon: 'ticket_icon',)),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
