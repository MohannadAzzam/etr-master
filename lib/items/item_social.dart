import 'package:etr/module/social.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemSocial extends StatelessWidget {
  final Social social ;
  final Color color ;

  const ItemSocial({Key key, this.social, this.color =fWhite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        ToUrl(social.url) ;
      } ,
      child: Container(
        padding: EdgeInsets.all(8.r),
        margin: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          border: Border.all(color: color,width: 1),
          shape: BoxShape.circle
        ),
        child:svgImage(social.icon,size: 15.r,color: color) ,
      ),
    );
  }
}
