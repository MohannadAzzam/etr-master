import 'package:etr/dialogs/dialog_book_package.dart';
import 'package:etr/module/social.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../module/sponsors.dart';

class ItemPackage extends StatelessWidget {
  final SponsorPackge item ;
  const ItemPackage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      clipBehavior: Clip.hardEdge,
      decoration: boxDecoration,
      // padding: EdgeInsets.all(10.w),
      // // padding: EdgeInsets.all(8.r),
      //  margin: EdgeInsets.all(10.w),
      child: InkWell(
        onTap: (){
          bottomSheet(context: context, child: DialogBookPackage(item: item,));
        },
        child: Stack(
          children: [
            myText(item.id.toString()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child:SvgPicture.network(item.image) ),
                ),

                myText(item.name),
                SizedBox(height: 10.h),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
