import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';


class NoDataState extends StatelessWidget {
 final Function onTryAgain ;
  const NoDataState({Key key, this.onTryAgain}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
            'assets/images/no_data.json',
          width: 200,
          height: 200,
         fit: BoxFit.cover
        ),
        myText('No_results'.t,fontSize: 16.sp,) ,
        SizedBox(height: 10.h,),
        if(onTryAgain!=null)
        InkWell(
            onTap: onTryAgain,
            child: myText('try_again'.t,color: fPrimaryColor,fontSize: 25.sp,isBold: true)),
        SizedBox(height: 20.h,)
      ],
    ));
  }

// switch(errorType){
//   case ErrorType.CRASH_ERROR:
//     return Center(child: InkWell(
//         onTap: (){
//           if(widget.onTryAgain!=null){
//             widget.onTryAgain() ;
//           }
//         },
//         child: myText('CRASH_ERROR',fontSize: 50)),);
//   case ErrorType.NO_INTERNET:
//     return NoInternetState(onTryAgain:widget.onTryAgain,) ;
//   case ErrorType.NOT_SUCCESS:
//     return Container(child: myText('NOT_SUCCESS',fontSize: 50)) ;
//   case ErrorType.NON:
//     return Container(child: myText('NON',fontSize: 50)) ;
// }

}
