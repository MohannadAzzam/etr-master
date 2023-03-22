import 'package:etr/module/home_model.dart';
import 'package:etr/screens/blog_details_screen.dart';
import 'package:etr/screens/blog_screen.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewBlogItem extends StatelessWidget {
 final Blog item ;
  const NewBlogItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        ToWithFade(context, BolgDetailsScreen(item: item,)) ;
        // To(context, ServicesFormScreen()) ;
        // showCustomDialog(context, DialogChooseCity(title: 'Choose The Right Price',)) ;
        // To(context, ServiceDetailsScreen()) ;
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 200.h,
        width: ScreenUtil().screenWidth*0.8,
        margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
        // padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        decoration: BoxDecoration(
            color: fWhite,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: boxShadow()
        ),
        child: Stack(

          children: [
            Positioned.fill(child: Hero(
              tag: item.id.toString()+'i',
                child: Material(

                    color: Colors.transparent,
                    child: imageNet(item.image)),)),
            Container(color: Colors.black.withOpacity(0.3)),
            PositionedDirectional(
              start: 10.w,
              bottom: 10.h,
              end: 10.w,
              child: Hero(
                tag: item.id.toString()+'t',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    myText(item.name,
                        color: fWhite,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                    SizedBox(height: 10.h),
                    myText(
                      formatDate(item.createdAt.toLocal()),
                      color: fWhite,
                      fontSize: 16.sp,
                    ),



                    //myText(drawerMenu.name,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
