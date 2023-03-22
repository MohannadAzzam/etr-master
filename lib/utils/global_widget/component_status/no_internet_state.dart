import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
// import 'package:flutter_screenutil/size_extension.dart';

class NoInternetState extends StatelessWidget {
 final Function onTryAgain ;
  const NoInternetState({Key key, this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          'assets/images/no_internet.json',
          width: 200,
          height: 200,
          fit: BoxFit.cover
        ),
        SizedBox(height: 20.h,) ,
        InkWell(
            onTap: onTryAgain,
            child: myText('try_again'.t,color: fPrimaryColor,fontSize: 25.sp,isBold: true))
      ],
    ));
  }
}
