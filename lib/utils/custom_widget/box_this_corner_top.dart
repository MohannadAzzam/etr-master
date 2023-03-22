import 'package:flutter/material.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxWithCornerTop extends StatelessWidget {
 final Widget child ;
  const BoxWithCornerTop({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h).copyWith(left: 20.w,right: 20.w),
      decoration: BoxDecoration(
        color: fWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.r))
      ),
      child: child,
    );
  }
}
