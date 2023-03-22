import 'package:etr/module/home_model.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Widget flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
    ) {
  return DefaultTextStyle(
    style: DefaultTextStyle.of(toHeroContext).style,
    child: toHeroContext.widget,
  );
}
class BolgDetailsScreen extends StatelessWidget {
 final Blog item ;
  const BolgDetailsScreen({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('details'.t),
      body: ListView(
        children: [
          Hero(
            tag: item.id.toString()+'i',
            child: Material(
              textStyle:DefaultTextStyle.of(context).style ,
                child: imageNet(item.image)),
          ),
          Padding(
            padding:  EdgeInsets.all(20.r),
            child: Hero(
              tag:  item.id.toString()+'t',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  myText(item.name,
                      color: fBlack,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700),
                  SizedBox(height: 10.h),
                  myText(formatDate(item.createdAt.toLocal())
                    ,
                    color: fBlack,
                    fontSize: 16.sp,
                  ),
                  myText(Constant.textTest)
                ],
              ),
              flightShuttleBuilder: flightShuttleBuilder,
            ),
          ),
        ],
      ),
    );
  }
}
