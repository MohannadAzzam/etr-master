import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemLogo extends StatelessWidget {
  const ItemLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          myImage('logo', height: 70.w),
          myText('Riyadh_International_Exhibition'.t,
              color: fWhite,
              fontSize: 25.sp,
              fontWeight: FontWeight.w700),
          myText(
            'for_childrens_games'.t,
            color: fWhite,
            fontSize: 16.sp,
          )
        ],
      ),
    );
  }
}
