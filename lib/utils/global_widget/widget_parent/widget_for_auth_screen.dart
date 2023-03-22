import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/box_this_corner_top.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:etr/utils/scroll_column_expandable.dart';

class WidgetForAuthScreen extends StatelessWidget {
  final Widget child;
  final double topPadding;
  final String title ;

  const WidgetForAuthScreen({Key key, this.child, this.topPadding=50,  this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:title!=null? myAppBar(title,centerTitle: false): AppBar(toolbarHeight: 0,systemOverlayStyle: SystemUiOverlayStyle.light,backgroundColor: fPrimaryColor,),
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 0,
            right: 0,
            left: 0,
           top: 0,
            child: ScrollColumnExpandable(
                children: [
                 const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80.r),
                    child: myImage('logo',fit: BoxFit.contain),
                  ),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: topPadding ,bottom: 20.h).copyWith(left: 20.w,right: 20.w),
                    // decoration: BoxDecoration(
                    //     color: fWhite,
                    //     borderRadius: BorderRadius.vertical(top: Radius.circular(40.r))
                    // ),
                    child: child,
                  ),
                  const Spacer(),
                ],

            ),
          ),
        ],
      ),
    );
  }
}
