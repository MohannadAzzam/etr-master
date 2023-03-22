import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          children: [

            Positioned.fill(
              child: Hero(tag: 'tag', child: RotatedBox(
                quarterTurns:1 ,
                  child: InteractiveViewer(
                    alignPanAxis: false,

                      panEnabled: true, // Set it to false
                      //boundaryMargin: EdgeInsets.all(100),
                      minScale: 1.0,
                      maxScale: 4,
                      child: imageNet(getSettings().expoMap))),
                   flightShuttleBuilder: (
                    BuildContext flightContext,
                    Animation<double> animation,
                    HeroFlightDirection flightDirection,
                    BuildContext fromHeroContext,
                    BuildContext toHeroContext,) {
                     Animation<double> animati ;
                     if(flightDirection == HeroFlightDirection.push) {
                       animati = Tween(begin: 0.75,end: 1.0).animate(animation) ;
                     } else if (flightDirection == HeroFlightDirection.pop){
                       animati= Tween(begin: 0.0,end: 0.25).animate(animation) ;
                     }

                  final Hero toHero = toHeroContext.widget;
                  return RotationTransition(
                    turns: animati,
                    child: toHero.child,
                  );
                },),
            ),
            InkWell(
              onTap: (){
                Navigator.pop(context) ;
              },
              child: Container(
                margin: EdgeInsetsDirectional.only(top: 20.w,start: 10),
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                    color: fBlack.withOpacity(0.5),
                    shape: BoxShape.circle
                ),
                child: const Icon(Icons.close,color: fWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
