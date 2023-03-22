import 'package:etr/module/drawer_menu.dart';
import 'package:etr/module/home_model.dart';
import 'package:etr/screens/TravelHotelsScreen.dart';
import 'package:etr/screens/exhibitors_screen.dart';
import 'package:etr/screens/organizers_screen.dart';
import 'package:etr/screens/sponsors_screen.dart';
import 'package:etr/screens/tickets_screen.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemOffer extends StatelessWidget {
 final Categore categore ;
  const ItemOffer({Key key, this.categore}) : super(key: key);

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
        height: ScreenUtil().screenHeight*0.47,
        width: ScreenUtil().screenWidth*0.7,
        margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
       // padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        decoration: BoxDecoration(
            color: fWhite,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: boxShadow()
        ),
        child: Stack(

          children: [
            Positioned.fill(child: imageNet(categore.image)),
            Container(color: Colors.black.withOpacity(0.3)),
            PositionedDirectional(
              start: 10.w,
              bottom: 10.h,
              end: 10.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  myText(categore.name,
                      color: fWhite,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700),
                  SizedBox(height: 10.h),
                  myText(
                    categore.shortDetails,
                    color: fWhite,
                    fontSize: 16.sp,
                  ),
                  SizedBox(height: 10.h),
                  myText(
                    categore.details,
                    color: fTextLight,
                    fontSize: 16.sp,
                  ),
                  SizedBox(height: 10.h),
                  Center(child: DefaultButton(onPressed: (){
                    switch(categore.id){
                      case 1:  To(context, const TicketsScreen()) ; break ;
                      case 2:  To(context, const ExhibitorsScreen()) ; break ;
                      case 3:  To(context, const TravelHotelsScreen()) ; break ;
                      case 4:  To(context, const SponsorsScreen()) ; break ;
                      case 5:  To(context, const OrganizersScreen()) ; break ;
                    }

                  }, text: 'booking_tickets'.t,isExpanded: false,))
                  //myText(drawerMenu.name,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
