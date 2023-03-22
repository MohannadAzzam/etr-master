import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:etr/utils/enums.dart';
import 'package:lottie/lottie.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/enums.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ErrorResponseState extends StatelessWidget {
 final Function onTryAgain ;
 final ErrorType errorType ;
 final bool isSmallError ;
  const ErrorResponseState({Key key, this.onTryAgain, this.errorType, this.isSmallError=false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return isSmallError?Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error_outline,color: fRed,),
        myText('errorMessage'.t,color: fWhite,fontSize: 14.sp,),
        InkWell(
            onTap: onTryAgain,
            child: myText('try_again'.t ,color: fWhite,fontSize: 18.sp,isBold: true))
      ],
    ) : Center(
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
            errorType==ErrorType.NO_INTERNET ?'assets/images/no_internet.json':'assets/images/44656-error.json',
            width: 300.w,
             height: 300.w,

         fit: BoxFit.contain
        ),
       // SizedBox(height: 20.h,) ,
        InkWell(
            onTap: onTryAgain,
            child: myText('try_again'.t,color: fPrimaryColor,fontSize: 25.sp,isBold: true))
      ],
      ),
    );
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
