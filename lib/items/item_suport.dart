import 'package:etr/module/home_model.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemSupport extends StatelessWidget {
  final SupportTeam supportTeam ;
  const ItemSupport({Key key, this.supportTeam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // To(context, MainCategoriesServicesScreen(id: mainCategory.id,type:mainCategory.type ,)) ;
        // To(context, ServicesFormScreen()) ;
        // showCustomDialog(context, DialogChooseCity(title: 'Choose The Right Price',)) ;
        // To(context, ServiceDetailsScreen()) ;
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        // height: ScreenUtil().screenHeight*0.47,
         width: ScreenUtil().screenWidth*0.35,
        margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
         padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 20.h).copyWith(bottom: 5.h),
        decoration: BoxDecoration(
            color: fWhite,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: boxShadow()
        ),
        child: Column(
          children: [
            imageCircle(supportTeam.image,radius: 37.r),
            SizedBox(height: 5.h),
            myText(supportTeam.name,fontSize: 16.sp,fontWeight: FontWeight.w700),
            myText(supportTeam.position,color: fTextColor,fontSize: 14.sp),
            Row(children: [
              IconButton(onPressed: (){}, icon: svgImage('email_icon')),
              Spacer(),
              IconButton(onPressed: (){}, icon: svgImage('phone_icon'))
            ],)

          ],
        ),
      ),
    );
  }
}
